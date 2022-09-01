import 'package:bus_hexa/model/getAPI.dart';
import 'package:bus_hexa/model/classes.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

// class Station {
//   int order;
//   BusLane includedLane;
//   Station? next;
//   Station? prev;

//   Station (this.order, this.includedLane, this.next, this.prev);
// }

// class BusLane {
//   int id;
//   String routeId;
//   String name;
//   List<Station> stations;

//   BusLane(this.id, this.routeId, this.name, this.stations);
// }

class Position {
  Position();
}

// Key: RouteKey, Value: LaneToTracks object
// 각 버스의 기본적인 정보
Future<Map <int, LaneToTracks>> constructBusNoMap() async {
    List<LaneToTracks> laneToTrackList = await getAPILaneToTracks();
    Map<int, LaneToTracks> busNoMap = { for (var element in laneToTrackList) element.id : element };
    return busNoMap;
}

// Key: RouteKey(routeKeyUsb), Value: UlsanBusArrivalInfos object
// 각 버스의 도착 시간 정보 (울산과학기술원 기준 도착시간 표시)
Future<Map <int, UlsanBusArrivalInfos>> constructBusInfoMap() async {
  List<UlsanBusArrivalInfos> ulsanBusArrivalInfos = await getAPIUlsanBusArrivalInfos();
    Map<int, UlsanBusArrivalInfos> busInfoMap = { for (var element in ulsanBusArrivalInfos) element.routeKeyUsb : element };
    return busInfoMap;
}

// Key: BusNo(routeKey), Value: NodeOfLanes List
// 각 버스의 정거장 정보
Future<Map <int, List<NodeOfLanes>>> constructNodeOfLanesMap() async {
  List<NodeOfLanes> nodeOfLaneList = await getAPINodeOfLanes();
  // Map <int, LaneToTracks> busNomap = await constructBusNoMap();

  Map<int, List<NodeOfLanes>> nodeOfLanesMap = {};

  for (int i = 3; i < 10; i++){
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

  for (int i = 3; i < 10; i++){
    List<NodeOfLanes> nodeOfBus = unistNodes.where((element) {
      return element.routeKey == i;
    }).toList();
    unistNodeMap[i] = nodeOfBus[0];
  }

  // TODO: modify this hard code to class version
  // unistNodeMap['233(농소차고지 방면)']?.nodeOrder = 57;

  return unistNodeMap;
}
 
// 긱 버스의 현재 위치 (울산과학기술원과 관계 없이 현재 위치)
Future<Map<int, List<PosOfBuses>>> constructPosMap() async {
  List<PosOfBuses> posOfBusesList = await getAPIPosOfBuses();

  Map<int, List<PosOfBuses>> posOfBusesMap = {};
  for (int i = 3; i < 10; i++){
    List<PosOfBuses> posOfBuses = posOfBusesList.where((element) {
      return element.routeKey == i;
    }).toList();

    posOfBusesMap[i] = posOfBuses;
  }

  return posOfBusesMap;
}



class StopInfo {
  int? stopLeft;
  int? timeLeft;
  
  NodeOfLanes node;

  StopInfo ({required this.node, this.stopLeft, this.timeLeft});
}
class LaneStopInfo {
  LaneToTracks bus;
  List<StopInfo> stopInfoList = [];

  LaneStopInfo({required this.bus, stopInfoList});
}

// 기존 정보 활용하여 진행
Future<List<LaneStopInfo>> constructStopInfo() async {
  Map <int, LaneToTracks> busNoMap= await constructBusNoMap();
  Map<int, NodeOfLanes> unistNodeMap = await constructUNISTNodeMap();
  Map<int, List<PosOfBuses>> posMap = await constructPosMap();
  Map <int, List<NodeOfLanes>> nodeOfLanesMap = await constructNodeOfLanesMap();
  Map <int, UlsanBusArrivalInfos> arrivalTimeInfoMap = await constructBusInfoMap();
  List<LaneStopInfo> laneStopInfoList = [];

  for (int key in busNoMap.keys) {
    if (unistNodeMap[key] == null) {
      print("Unexpected error for key: $key");
      continue;
    }
    NodeOfLanes unistNode = unistNodeMap[key]!; // unist node info must exist
    List<NodeOfLanes> nodesOfBus = nodeOfLanesMap[key] ?? [];
    List<PosOfBuses> currentPosOfBus = posMap[key] ?? [];
    UlsanBusArrivalInfos? arrivalTimeInfo = arrivalTimeInfoMap[key];
    LaneToTracks busInfo = busNoMap[key]!;
    Map<int, NodeOfLanes> routeKey2Node = { for (var node in nodesOfBus) node.routeKey : node };

    // Calculate stop left by subtract current position from UNIST
    List<StopInfo> stopLeftList = currentPosOfBus.map((position) => 
      StopInfo(node: routeKey2Node[position.routeKey]!, stopLeft: unistNode.nodeOrder - position.nodeOrder)
    ).toList();
    
    stopLeftList.sort((a, b) => a.stopLeft!.compareTo(b.stopLeft!));

    StopInfo? timeLeft = arrivalTimeInfo == null ? null : StopInfo(node: routeKey2Node[arrivalTimeInfo.routeKeyUsb]!, timeLeft: arrivalTimeInfo.arrivalTime);
    
    
    List<StopInfo> stopInfoList = (timeLeft == null ? [] : [timeLeft]);
    stopInfoList.addAll(stopLeftList); // time info has higher priority than stop left

    laneStopInfoList.add(LaneStopInfo(bus: busInfo, stopInfoList: stopInfoList));
  }

  return laneStopInfoList;
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

void testStopInfo() async {
  // List poses = await poslist();
  // Map posMap = await posmap();
  // List ulsan = await TimeInfo();
  // // List pos = await getAPIPosOfBuses();
  // // List nodes = await nodesoflanemap();
  // List stop = await StopInfo_1();
  // // Map nodemaps = await nodemap();
  // List stop2 = await StopInfo_2();
  // //print(ulsan);
  // print(poses);
  // //print(posMap);
  // //print(nodes);
  // print(stop);
  // print(stop2);
  // print(nodemaps);
  List<LaneStopInfo> laneStopInfoList = await constructStopInfo();
  print(laneStopInfoList);
}