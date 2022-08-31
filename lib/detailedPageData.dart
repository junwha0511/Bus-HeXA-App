import 'package:bus_hexa/model/classes.dart';
import 'package:bus_hexa/model/getAPI.dart';

busNames() async {
  List<LaneToTracks> laneToTracks = await getAPILaneToTracks();
  List<int> idList = List<int>.generate(
      laneToTracks.length, (index) => laneToTracks[index].id);
  List<String> routeList = List<String>.generate(
      laneToTracks.length, (index) => laneToTracks[index].busName);
  Map<int, String> idName = {};
  for (var i = 0; i < laneToTracks.length; i++) {
    idName[idList[i]] = routeList[i];
  }
  return routeList;
}

landmarkKeyList() async {
  List<LandmarkOfLanes> landmarkLanes = await getAPILandmarkOfLanes();
  List<LaneToTracks> laneToTracks = await getAPILaneToTracks();
  List<List<int>> landmarkKey = [];
  for (var i = 0; i < laneToTracks.length; i++) {
    for (var j = 0; j < landmarkLanes.length; j++) {
      if (laneToTracks[i].id == landmarkLanes[j].routeKey) {
        landmarkKey.add(landmarkLanes[j].landmarkKeys);
      }
    }
  }
  return landmarkKey;
}

landmarkNodesList() async {
  List<LandmarkNodes> landmarkNodes = await getAPILandmarkNodes();
  List<List<int>> landmarkKey = await landmarkKeyList();
  List<List<int>> alias_key_list = [];
  for (int i = 0; i < landmarkKey.length; i++) {
    List<int> alias_keys = [];
    List<int> alias_keys_set = [];
    for (int j = 0; j < landmarkKey[i].length; j++) {
      for (int k = 0; k < landmarkNodes.length; k++) {
        if (landmarkKey[i][j] == landmarkNodes[k].id) {
          alias_keys.add(landmarkNodes[k].aliasKey);
        }
      }
    }
    alias_keys_set = alias_keys.toSet().toList();
    alias_key_list.add(alias_keys_set);
  }
  return alias_key_list;
}

landmarkAliasesList() async {
  List<LandmarkAliases> landmarkAliases = await getAPILandmarkAliases();
  List<List<int>> alias_key_list = await landmarkNodesList();
  List<List<String>> alias_name_list = [];
  for (int i = 0; i < alias_key_list.length; i++) {
    List<String> alias_names = [];
    for (int j = 0; j < alias_key_list[i].length; j++) {
      for (int k = 0; k < landmarkAliases.length; k++) {
        if (alias_name_list[i][j] == landmarkAliases[k].aliasKey) {
          alias_names.add(landmarkAliases[k].aliasName);
        }
      }
    }
    alias_name_list.add(alias_names);
  }
  return alias_name_list;
}

landmarkNames() async {
  List<List<String>> alias_name_list = await landmarkAliasesList();
  List<String> landmark = [];
  for (int i = 0; i < alias_name_list.length; i++) {
    String listToString = alias_name_list[i].join(',');
    landmark.add(listToString);
  }
  return landmark;
}

departTimeList() async {
  List<UlsanBusTimeTables> timeTable = await getAPIUlsanBusTimeTables();
  List<LaneToTracks> laneToTracks = await getAPILaneToTracks();
  List<List<String>> departTimeList = [];
  for (var i = 0; i < laneToTracks.length; i++) {
    List<String> departTime = [];
    for (var j = 0; j < timeTable.length; j++) {
      if (laneToTracks[i].id == timeTable[j].routeKeyUsb) {
        departTime.add(timeTable[j].departTime);
      }
    }
    departTimeList.add(departTime);
  }
  return departTimeList;
}

nodeNames() async {
  List<LaneToTracks> laneToTracks = await getAPILaneToTracks();
  List<NodeOfLanes> nodeOfLanes = await getAPINodeOfLanes();
  List<List<String>> nodeNameList = [];
  for (var i = 0; i < laneToTracks.length; i++) {
    List<String> nodeNames = [];
    for (var j = 0; j < nodeOfLanes.length; j++) {
      if (nodeOfLanes[j].routeKey == laneToTracks[i].id) {
        nodeNames.add(nodeOfLanes[j].nodeName);
      }
    }
    nodeNameList.add(nodeNames);
  }
  return nodeNameList;
}

nodeOrder() async {
  List<LaneToTracks> laneToTracks = await getAPILaneToTracks();
  List<NodeOfLanes> nodeOfLanes = await getAPINodeOfLanes();
  List<List<int>> nodeOrderList = [];
  for (var i = 0; i < laneToTracks.length; i++) {
    List<int> nodeOrders = [];
    for (var j = 0; j < nodeOfLanes.length; j++) {
      if (nodeOfLanes[j].routeKey == laneToTracks[i].id) {
        nodeOrders.add(nodeOfLanes[j].nodeOrder);
      }
    }
    nodeOrderList.add(nodeOrders);
  }
  return nodeOrderList;
}

posOfBusesList() async {
  List<LaneToTracks> laneToTracks = await getAPILaneToTracks();
  List<PosOfBuses> posOfBus = await getAPIPosOfBuses();
  List<List<String>> nodeNameList = await nodeNames();
  List<List<dynamic>> busName_List = [];
  for (var i = 0; i < laneToTracks.length; i++) {
    var busNameNode =
        List<dynamic>.generate(nodeNameList[i].length, (index) => '');
    for (var j = 0; j < posOfBus.length; j++) {
      if (posOfBus[j].routeKey == laneToTracks[i].id) {
        busNameNode.remove(posOfBus[j].nodeOrder - 1);
        busNameNode.insert(
            posOfBus[j].nodeOrder - 1, posOfBus[j].busNum.substring(2));
      }
    }
    busName_List.add(busNameNode);
  }
  return busName_List;
}

detailedPageData() async {
  List<LaneToTracks> laneToTracks = await getAPILaneToTracks();
  List<String> routeList = await busNames();
  List<String> landmark = await landmarkNames();
  List<List<String>> deparatTime = await departTimeList();
  List<List<String>> nodeNameList = await nodeNames();
  List<List<int>> nodeOrderList = await nodeOrder();
  List<List<dynamic>> busNameList = await posOfBusesList();
  List<Map<String, dynamic>> detail = [];
  for (var i = 0; i < laneToTracks.length; i++) {
    Map<String, dynamic> data = {};
    data["bus"] = routeList[i];
    data["mainStation"] = landmark[i];
    data["departTime"] = deparatTime[i];
    data["node_orders"] = nodeOrderList[i];
    data["node_names"] = nodeNameList[i];
    data["poseOfBuses"] = busNameList[i];
    detail.add(data);
  }
  return detail;
}
//모두 API중 laneToTracks의 순서대로 되어있음.
//출발시간(depart_time)은 timetable의 출발시간 순서로 되어있음.
//정류장 이름(node_names)와 정류장 순서(node_orders)는 nodeOfLanes의 순서로 되어있음.

// void main() async {
//   List<String> routeList = await busNames();
//   List<String> landmark = await landmarkNames();
//   List<String> deparatTime = await departTimeList();
//   List<List<String>> nodeNameList = await nodeNames();
//   List<List<dynamic>> busNameList = await posOfBusesList();
//   List detail = await detailedPageData();
//   print(routeList);
//   print(landmark);
//   print(deparatTime);
//   print(nodeNameList);
//   print(busNameList);
// }
