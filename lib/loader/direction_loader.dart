import 'package:bus_hexa/constant.dart';
import 'package:bus_hexa/model/getAPI.dart';
import 'package:bus_hexa/model/classes.dart';
import 'dart:core';
import 'package:flutter/material.dart';

TimeOfDay now = TimeOfDay.now();
//TimeOfDay time = TimeOfDay(hour: now.hour, minute: now.minute);
int current_time = now.hour*100 + now.minute;

class StopInfo {
  int? stopLeft;
  int? timeLeft;
  String? departTime;
  String? busNum;

  String nodeName;

  StopInfo({required this.nodeName, this.busNum, this.stopLeft, this.timeLeft, this.departTime});
}
class LaneStopInfo {
  LaneToTracks bus;
  List<StopInfo> stopInfoList;

  LaneStopInfo({required this.bus, required this.stopInfoList});
}
class LaneStopInfo337 {
  LaneToTracks bus;
  List<StopInfo> stopInfoList337;

  LaneStopInfo337({required this.bus, required this.stopInfoList337});
}
// Key: RouteKey, Value: LaneToTracks object
// 각 버스의 기본적인 정보
Future<Map<int, LaneToTracks>> constructBusNoMap() async {
  List<LaneToTracks> laneToTrackList = await getAPILaneToTracks();
  Map<int, LaneToTracks> busNoMap = {
    for (var element in laneToTrackList) element.id: element
  };
  return busNoMap;
}

Future<Map<int, List<UlsanBusArrivalInfos>>> constructBusInfoMap() async {
  List<UlsanBusArrivalInfos> ulsanBusArrivalInfosList =
      await getAPIUlsanBusArrivalInfos();
  Map<int, List<UlsanBusArrivalInfos>> busInfoMap = {};
  
  for (int i = N_BUS_MIN; i <= N_BUS_MAX; i++) {
    List<UlsanBusArrivalInfos> busInfo = ulsanBusArrivalInfosList.where((element) {
      return element.routeKeyUsb == i;
    }).toList();
    busInfoMap[i] = busInfo;
    }

  return busInfoMap;
}


// Key: RouteKey(routeKeyUsb), Value: UlsanBusArrivalInfos object
// 각 버스의 도착 시간 정보 (울산과학기술원 기준 도착시간 표시)
/*Future<Map<int, UlsanBusArrivalInfos>> constructBusInfoMap() async {
  List<UlsanBusArrivalInfos> ulsanBusArrivalInfos =
      await getAPIUlsanBusArrivalInfos();
  Map<int, UlsanBusArrivalInfos> busInfoMap = {
    for (var element in ulsanBusArrivalInfos) element.routeKeyUsb: element
  };
  return busInfoMap;
}
*/
// Key: BusNo(routeKey), Value: NodeOfLanes List
// 각 버스의 정거장 정보
Future<Map<int, List<NodeOfLanes>>> constructNodeOfLanesMap() async {
  List<NodeOfLanes> nodeOfLaneList = await getAPINodeOfLanes();
  // Map <int, LaneToTracks> busNomap = await constructBusNoMap();

  Map<int, List<NodeOfLanes>> nodeOfLanesMap = {};

  for (int i = N_BUS_MIN; i <= N_BUS_MAX; i++) {
    List<NodeOfLanes> nodeOfBus = nodeOfLaneList.where((element) {
      return element.routeKey == i;
    }).toList();
    nodeOfLanesMap[i] = nodeOfBus;
  }

  return nodeOfLanesMap;
}

// 각 버스의 '울산과학기술원'의 node_order를 알아내기 위해 생성
Future<Map<int, NodeOfLanes>> constructUNISTNodeMap() async {
  List<NodeOfLanes> nodeOfLaneList = await getAPINodeOfLanes();
  List<NodeOfLanes> unistNodes = nodeOfLaneList.where((element) {
    return element.nodeName == '울산과학기술원';
  }).toList();

  Map<int, NodeOfLanes> unistNodeMap = {};

  for (int i = N_BUS_MIN; i <= N_BUS_MAX; i++) {
    List<NodeOfLanes> nodeOfBus = unistNodes.where((element) {
      return element.routeKey == i;
    }).toList();
    unistNodeMap[i] = nodeOfBus[0];
  }

  // TODO: modify this hard code to class version
  unistNodeMap[1]?.nodeOrder = 114;

  return unistNodeMap;
}

// 각 버스의 현재 위치 (울산과학기술원과 관계 없이 현재 위치)
Future<Map<int, List<PosOfBuses>>> constructPosMap() async {
  List<PosOfBuses> posOfBusesList = await getAPIPosOfBuses();
  Map<int, List<PosOfBuses>> posOfBusesMap = {};
  for (int i = N_BUS_MIN; i <= N_BUS_MAX; i++) {
    List<PosOfBuses> posOfBuses = posOfBusesList.where((element) {
      return element.routeKey == i;
    }).toList();

    posOfBusesMap[i] = posOfBuses;
  }

  return posOfBusesMap;
}


Future<Map<int, List<UlsanBusTimeTables>>> constructTimeTablesMap() async {
  List<UlsanBusTimeTables> timeTablesList = await getAPIUlsanBusTimeTables ();
  // Map <int, LaneToTracks> busNomap = await constructBusNoMap();

  Map<int, List<UlsanBusTimeTables>> timeTablesMap = {};

  for (int i = N_BUS_MIN; i <= N_BUS_MAX; i++) {
      List<UlsanBusTimeTables> timeTables = timeTablesList.where((element) {
      return element.routeKeyUsb == i;
    }).toList();
    timeTablesMap[i] = timeTables;
  }
  return timeTablesMap;
}


String intFixed(int n, int count) => n.toString().padLeft(count, "0");

// 기존 정보 활용하여 진행
Future<List<LaneStopInfo>> constructStopInfo() async {
  Map<int, LaneToTracks> busNoMap = await constructBusNoMap();
  Map<int, NodeOfLanes> unistNodeMap = await constructUNISTNodeMap();
  Map<int, List<PosOfBuses>> posMap = await constructPosMap();
  Map<int, List<NodeOfLanes>> nodeOfLanesMap = await constructNodeOfLanesMap();
  Map<int, List<UlsanBusArrivalInfos>> arrivalTimeInfoMap = await constructBusInfoMap();
  Map<int, List<UlsanBusTimeTables>> timeTablesMap = await constructTimeTablesMap();
  List<LaneStopInfo> laneStopInfoList = [];

  for (int key = 4; key <= N_BUS_MAX; key++) {
    if (unistNodeMap[key] == null) {
      print("Unexpected error for key: $key");
      continue;
    }
    NodeOfLanes unistNode = unistNodeMap[key]!; // unist node info must exist
    List<NodeOfLanes> nodesOfBus = nodeOfLanesMap[key] ?? [];
    List<PosOfBuses> currentPosOfBus = posMap[key] ?? [];
    List<UlsanBusArrivalInfos> arrivalTimeInfo = arrivalTimeInfoMap[key] ?? [];
    LaneToTracks busInfo = busNoMap[key]!;
    List<UlsanBusTimeTables> timeTableInfo = timeTablesMap[key] ?? [];

    Map<String, NodeOfLanes> id2Node = {
      for (var node in nodesOfBus) node.nodeId: node
    };

    // Calculate stop left by subtract current position from UNIST
    List<StopInfo> stopLeftList = currentPosOfBus
        .map((position) => StopInfo(
            nodeName: id2Node[position.nodeId]!.nodeName,
            stopLeft: (unistNode.nodeOrder - position.nodeOrder),
            busNum: position.busNum))
        .where((stopInfo) => stopInfo.stopLeft! >= 0)
        .toList();

    stopLeftList.sort((a, b) => a.stopLeft!.compareTo(b.stopLeft!));

    // Parse time table after current time
    List<StopInfo> timeTableList = timeTableInfo
        .map((timeTable) => int.parse(timeTable.departTime))
        .where((time) => time >= current_time)
        .map((time)=>StopInfo(nodeName: "", departTime: "${intFixed(time~/100, 2)}:${intFixed(time%100, 2)}"))
        .toList();
  
    List<StopInfo> arrivalTimeList = arrivalTimeInfo
        .map((timeInfo) => StopInfo(
          nodeName: timeInfo.currentNodeName,
          timeLeft: timeInfo.arrivalTime
        )).toList();

    arrivalTimeList.sort((a,b) => a.timeLeft!.compareTo(b.timeLeft!));

    // stop info 
    List<StopInfo> stopInfoList = (arrivalTimeList == null ? [] : arrivalTimeList);
    if (arrivalTimeList != null && stopLeftList.length > 0) stopLeftList.removeAt(0);
    stopInfoList
        .addAll(stopLeftList);
    
    // time table
    if (timeTableList.length > 0) {
      stopInfoList.add(timeTableList[0]);
    }
    if (timeTableList.length > 1) {
      stopInfoList.add(timeTableList[1]);
    }

    // Add to global
    laneStopInfoList
        .add(LaneStopInfo(bus: busInfo, stopInfoList: stopInfoList));


  }

  return laneStopInfoList;
}

Future<List<LaneStopInfo337>> constructStopInfo337() async {
  Map<int, LaneToTracks> busNoMap = await constructBusNoMap();
  Map<int, NodeOfLanes> unistNodeMap = await constructUNISTNodeMap();
  Map<int, List<PosOfBuses>> posMap = await constructPosMap();
  Map<int, List<NodeOfLanes>> nodeOfLanesMap = await constructNodeOfLanesMap();
  Map<int, List<UlsanBusArrivalInfos>> arrivalTimeInfoMap = await constructBusInfoMap();
  Map<int, List<UlsanBusTimeTables>> timeTablesMap = await constructTimeTablesMap();
  List<LaneStopInfo337> laneStopInfoList337 = [];
  
  for (int key = 1; key <= 3; key++) {
    if (unistNodeMap[key] == null) {
      print("Unexpected error for key: $key");
      continue;
    }
  }

    NodeOfLanes unistNode_1 = unistNodeMap[1]!; // unist node info must exist
    NodeOfLanes unistNode_2 = unistNodeMap[2]!;
    NodeOfLanes unistNode_3 = unistNodeMap[3]!;

    List<NodeOfLanes> nodesOfBus_1 = nodeOfLanesMap[1] ?? [];
    List<NodeOfLanes> nodesOfBus_2 = nodeOfLanesMap[2] ?? [];
    List<NodeOfLanes> nodesOfBus_3 = nodeOfLanesMap[3] ?? [];

    List<NodeOfLanes> nodesofBus_TH = nodesOfBus_3.sublist(0,32);
    List<PosOfBuses> currentPosOfBus_1 = posMap[1] ?? [];
    List<PosOfBuses> currentPosOfBus_2 = posMap[2] ?? [];
    List<PosOfBuses> currentPosOfBus_3 = posMap[3] ?? [];

    List<UlsanBusArrivalInfos> arrivalTimeInfo_1 = arrivalTimeInfoMap[1] ?? [];
    List<UlsanBusArrivalInfos> arrivalTimeInfo_2 = arrivalTimeInfoMap[2] ?? [];
    List<UlsanBusArrivalInfos> arrivalTimeInfo_3 = arrivalTimeInfoMap[3] ?? [];

    LaneToTracks busInfo_1 = busNoMap[1]!;
    LaneToTracks busInfo_2 = busNoMap[2]!;
    LaneToTracks busInfo_3 = busNoMap[3]!;

    List<UlsanBusTimeTables> timeTableInfo_1 = timeTablesMap[1] ?? [];
    List<UlsanBusTimeTables> timeTableInfo_2 = timeTablesMap[2] ?? [];
    List<UlsanBusTimeTables> timeTableInfo_3 = timeTablesMap[3] ?? [];
    
    Map<String, NodeOfLanes> id2Node_1 = {
      for (var node in nodesOfBus_1) node.nodeId: node
    };
    Map<String, NodeOfLanes> id2Node_2 = {
      for (var node in nodesOfBus_2) node.nodeId: node
    };
    Map<String, NodeOfLanes> id2Node_3 = {
      for (var node in nodesOfBus_3) node.nodeId: node
    };

    // Calculate stop left by subtract current position from UNIST (337 삼남신화 방면 --역전으로 쓰임)
    List<StopInfo> stopLeftList_1 = currentPosOfBus_1
        .map((position) => StopInfo(
            nodeName: id2Node_1[position.nodeId]!.nodeName,
            stopLeft: (unistNode_1.nodeOrder - position.nodeOrder)))
        .where((stopInfo) => stopInfo.stopLeft! >= 0)
        .toList();

    List<StopInfo> stopLeftList_2 = currentPosOfBus_2
        .map((position) => StopInfo(
            nodeName: id2Node_2[position.nodeId]!.nodeName,
            stopLeft: (unistNode_2.nodeOrder - position.nodeOrder)))
        .where((stopInfo) => stopInfo.stopLeft! >= 0)
        .toList();

    List<StopInfo> stopLeftList_3 = currentPosOfBus_3
        .map((position) => StopInfo(
            nodeName: id2Node_3[position.nodeId]!.nodeName,
            stopLeft: (unistNode_3.nodeOrder - position.nodeOrder)))
        .where((stopInfo) => stopInfo.stopLeft! >= 0)
        .toList();

    List<StopInfo> stopLeftList_4 = currentPosOfBus_1 //(1로부터 계산)
        .map((position) => StopInfo(
            nodeName: id2Node_1[position.nodeId]!.nodeName,
            stopLeft: (unistNode_3.nodeOrder - position.nodeOrder)))
        .where((stopInfo) => stopInfo.stopLeft! >= 0)
        .toList();
    
    List<StopInfo> stopLeftList_SN = stopLeftList_1 + stopLeftList_2;
    List<StopInfo> stopLeftList_TH = stopLeftList_3 + stopLeftList_4;

    stopLeftList_SN.sort((a, b) => a.stopLeft!.compareTo(b.stopLeft!));
    stopLeftList_TH.sort((a, b) => a.stopLeft!.compareTo(b.stopLeft!));



    // Parse time table after current time
    List<StopInfo> timeTableList_1 = timeTableInfo_1
        .map((timeTable) => int.parse(timeTable.departTime))
        .where((time) => time >= current_time)
        .map((time)=>StopInfo(nodeName: "", departTime: "${intFixed(time~/100, 2)}:${intFixed(time%100, 2)}"))
        .toList();
    List<StopInfo> timeTableList_2 = timeTableInfo_2
        .map((timeTable) => int.parse(timeTable.departTime))
        .where((time) => time >= current_time)
        .map((time)=>StopInfo(nodeName: "", departTime: "${intFixed(time~/100, 2)}:${intFixed(time%100, 2)}"))
        .toList();
    List<StopInfo> timeTableList_3 = timeTableInfo_3
        .map((timeTable) => int.parse(timeTable.departTime))
        .where((time) => time >= current_time)
        .map((time)=>StopInfo(nodeName: "", departTime: "${intFixed(time~/100, 2)}:${intFixed(time%100, 2)}"))
        .toList();

    List<StopInfo> timeTableList_SN = timeTableList_1 + timeTableList_2;
    List<StopInfo> timeTableList_TH = timeTableList_1 + timeTableList_3;

    timeTableList_SN.sort((a, b) => a.departTime!.compareTo(b.departTime!));
    timeTableList_TH.sort((a, b) => a.departTime!.compareTo(b.departTime!));
  
    List<StopInfo> arrivalTimeList_1 = arrivalTimeInfo_1 
        .map((time) => StopInfo(
            nodeName: id2Node_1[time.currentNodeName]!.nodeName,
            timeLeft: time.arrivalTime,
            stopLeft: time.prevStopCnt))
        .where((stopInfo) => stopInfo.stopLeft! >= 0)
        .toList();
    List<StopInfo> arrivalTimeList_2 = arrivalTimeInfo_2
        .map((time) => StopInfo(
            nodeName: id2Node_2[time.currentNodeName]!.nodeName,
            timeLeft: time.arrivalTime))
        .where((stopInfo) => stopInfo.stopLeft! >= 0)
        .toList();
    List<StopInfo> arrivalTimeList_3 = arrivalTimeInfo_3
        .map((time) => StopInfo(
            nodeName: id2Node_1[time.currentNodeName]!.nodeName,
            timeLeft: time.arrivalTime))
        .where((stopInfo) => stopInfo.stopLeft! >= 0)
        .toList();    
    
//337 arrivaltimeinfo 여러개 뜨는거 구현중에있음
    // stop info 
    List<StopInfo> stopInfoList_SN = (timeLeft_1 == null ? timeLeft_2 == null ?  [] : [timeLeft_2] : [timeLeft_1]);
    if ((timeLeft_1 != null || timeLeft_2 != null) && stopLeftList_SN.length > 0) stopLeftList_SN.removeAt(0);
    stopInfoList_SN
        .addAll(stopLeftList_SN);

    List<StopInfo> stopInfoList_TH = (timeLeft_3 == null ? [] : [timeLeft_3]);
    if (timeLeft_3 != null && stopLeftList_TH.length > 0) stopLeftList_TH.removeAt(0);
    stopInfoList_TH
        .addAll(stopLeftList_TH);
    
    // time table
    if (timeTableList_SN.length > 0) {
      stopInfoList_SN.add(timeTableList_SN[0]);
    }
    if (timeTableList_SN.length > 1) {
      stopInfoList_SN.add(timeTableList_SN[1]);
    }

    if (timeTableList_TH.length > 0) {
      stopInfoList_TH.add(timeTableList_TH[0]);
    }
    if (timeTableList_TH.length > 1) {
      stopInfoList_TH.add(timeTableList_TH[1]);
    }

    // Add to global
    laneStopInfoList337
        .add(LaneStopInfo337(bus: busInfo_2, stopInfoList337: stopInfoList_SN));
    laneStopInfoList337
        .add(LaneStopInfo337(bus: busInfo_3, stopInfoList337: stopInfoList_TH));

  return laneStopInfoList337;
}

// StopInfo_1() async {
//   Map busNomap = await busnomap();
//   Map nodeMap = await nodemap();
//   List posList = await poslist();
//   List nodeoflane = await nodesoflanemap();
//   List dataList = [];
//   for (int i = 3; i < 10; i++) {
//     Map elements = {};
//     Map info = {};
//       if (posList[i-2]['info'] == null){
//         elements['bus_no'] = busNomap[i];
//         elements['info'] = null;
//         dataList.add(elements);
//       }else{
//         List stopList = [];
//         List indexList = [];
//         for (int j = 0; j < posList[i-2]['info'].length; j++){
//           int stop_left = nodeMap[busNomap[i]] - posList[i-2]['info'][j]['current_node_order'];
//           if (stop_left > 0){
//             stopList.add(stop_left);
//             indexList.add(j);
//           }
//         }
//         if (stopList.isEmpty == true){
//           elements['bus_no'] = busNomap[i];
//           elements['info'] = null;
//           dataList.add(elements);
//         }else{
//           info['stop_left'] = stopList.reduce((value, element) => value < element? value: element);
//           info['bus_num'] = posList[i-2]['info'][indexList[stopList.indexOf(stopList.reduce((value, element) => value < element? value: element))]]['bus_num'];
//           info['current_node'] = nodeoflane[i-3][busNomap[i]][posList[i-2]['info'][indexList[stopList.indexOf(stopList.reduce((value, element) => value < element? value: element))]]['current_node_order']];
//           elements['bus_no'] = busNomap[i];
//           elements['info'] = info;
//           dataList.add(elements);
//         }
        
//       }

//     }
//     return dataList;
//   }

// StopInfo_2() async {
//   Map busNomap = await busnomap();
//   Map nodeMap = await nodemap();
//   List posList = await poslist();
//   List nodeoflane = await nodesoflanemap();
//   List dataList = [];
//   for (int i = 3; i < 10; i++) {
//     Map elements = {};
//     Map info = {};
//       if (posList[i-2]['info'] == null){
//         elements['bus_no'] = busNomap[i];
//         elements['info'] = null;
//         dataList.add(elements);
//       }else{
//         List stopList = [];
//         List indexList = [];
//         for (int j = 0; j < posList[i-2]['info'].length; j++){
//           int stop_left = nodeMap[busNomap[i]] - posList[i-2]['info'][j]['current_node_order'];
//           if (stop_left > 0){
//             stopList.add(stop_left);
//             indexList.add(j);
//           }
//         }
//         if (stopList.isEmpty == true){
//           elements['bus_no'] = busNomap[i];
//           elements['info'] = null;
//           dataList.add(elements);
//         }else{
//           stopList.remove(stopList.reduce((value, element) => value < element? value: element));
//           if (stopList.isEmpty == false){
//             info['stop_left'] = stopList.reduce((value, element) => value < element? value: element);
//             info['bus_num'] = posList[i-2]['info'][indexList[stopList.indexOf(stopList.reduce((value, element) => value < element? value: element))]]['bus_num'];
//             info['current_node'] = nodeoflane[i-3][busNomap[i]][posList[i-2]['info'][indexList[stopList.indexOf(stopList.reduce((value, element) => value < element? value: element))]]['current_node_order']];
//             elements['bus_no'] = busNomap[i];
//             elements['info'] = info;
//             dataList.add(elements);
//           }else{
//             elements['bus_no'] = busNomap[i];
//             elements['info'] = null;
//             dataList.add(elements);
//           }
//         }
        
//       }

//     }
//     return dataList;
//   }

// TimeInfo() async {
//   Map busNomap = await busnomap();
//   Map busInfomap = await infomap();
//   List dataList = [];
//   Map special = {};
//   Map specialInfo = {};
//   special['bus_no'] = busNomap[2];
//   if (busInfomap[busNomap[1]] == null){
//     special['info'] = busInfomap[busNomap[1]];
//   }else{
//     specialInfo['min'] = busInfomap[busNomap[1]]['arrival_time'];
//     specialInfo['bus_num'] = busInfomap[busNomap[1]]['vehicle_no'];
//     specialInfo['current_node'] = busInfomap[busNomap[1]]['current_node_name'];
//     special['info'] = specialInfo;
//   }
//   dataList.add(special);

//   for (int i = 3; i < 10; i++) {
//     Map elements = {};
//     Map info = {};
//     if (busInfomap[busNomap[i]] == null){
//     elements['bus_no'] = busNomap[i];
//     elements['info'] = busInfomap[busNomap[i]];
//     }else{
//     info['min'] = busInfomap[busNomap[i]]['arrival_time'];
//     info['bus_num'] = busInfomap[busNomap[i]]['vehicle_no'];
//     info['current_node'] = busInfomap[busNomap[i]]  ['current_node_name'];
//     elements['bus_no'] = busNomap[i];
//     elements['info'] = info;
//   }
//     dataList.add(elements);
//   }
//   return dataList;
// }

// void testStopInfo() async {
//   // List poses = await poslist();
//   // Map posMap = await posmap();
//   // List ulsan = await TimeInfo();
//   // // List pos = await getAPIPosOfBuses();
//   // // List nodes = await nodesoflanemap();
//   // List stop = await StopInfo_1();
//   // // Map nodemaps = await nodemap();
//   // List stop2 = await StopInfo_2();
//   // //print(ulsan);
//   // print(poses);
//   // //print(posMap);
//   // //print(nodes);
//   // print(stop);
//   // print(stop2);
//   // print(nodemaps);
//   List<LaneStopInfo> laneStopInfoList = await constructStopInfo();
//   print(laneStopInfoList);
// }