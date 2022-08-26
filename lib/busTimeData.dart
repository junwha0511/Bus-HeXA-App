import 'package:bus_hexa/model/classes.dart';
import 'package:bus_hexa/model/getAPI.dart';
import 'package:bus_hexa/model/getAPI.dart';

// routekey() async {
//   List timeTableMap = await UlsanBusTimeTables();
//   var routeKey = await Map<int, int>.fromIterable(timeTableMap,
//       key: (Index) => Index - 1, value: (element) => element["route_key"]);
//   return routeKey;
// }

deparatTime() async {
  List<UlsanBusTimeTables> timeTableMap = await getAPIUlsanBusTimeTables();
  List<String> departTime = await List<String>.generate(
      timeTableMap.length, (index) => timeTableMap[index - 1].departTime);
  // var departTime = await Map<String, int>.fromIterable(timeTableMap,
  //     key: (Index) => Index - 1, value: (element) => element["depart_time"]);
  return departTime;
}

busName() async {
  List<UlsanBusTimeTables> timeTableMap = await getAPIUlsanBusTimeTables();
  List<LaneToTracks> laneToTracks = await getAPILaneToTracks();
  List<String> busName_list = [];
  for (int i = 0; i < timeTableMap.length; i++) {
    for (int j = 0; j < laneToTracks.length; j++) {
      if (timeTableMap[i].routeKeyUsb == laneToTracks[j].id) {
        busName_list.add(laneToTracks[j].busName);
      }
    }
  }
  return busName_list;
}

landmarkKeys() async {
  List<UlsanBusTimeTables> timeTableMap = await getAPIUlsanBusTimeTables();
  List<LandmarkOfLanes> landmarkLanes = await getAPILandmarkOfLanes();
  List<LandmarkNodes> landmarkNodes = await getAPILandmarkNodes();
  List<LandmarkAliases> landmarkAliases = await getAPILandmarkAliases();
  List<List<int>> landmark_key_list = [];
  for (int i = 0; i < timeTableMap.length; i++) {
    for (int j = 0; j < landmarkLanes.length; j++) {
      if (timeTableMap[i].routeKeyUsb == landmarkLanes[j].routeKey) {
        landmark_key_list.add(landmarkLanes[j].landmarkKeys);
      }
    }
  }
  return landmark_key_list;
}

landmarkNodes() async {
  List<LandmarkNodes> landmarkNodes = await getAPILandmarkNodes();
  List<List<int>> landmark_key_list = await landmarkKeys();
  List<List<int>> alias_key_list = [];
  for (int i = 0; i < landmark_key_list.length; i++) {
    List<int> alias_keys = [];
    for (int j = 0; j < landmark_key_list[i].length; j++) {
      for (int k = 0; k < landmarkNodes.length; k++) {
        if (landmark_key_list[i][j] == landmarkNodes[k].nodeId) {
          alias_keys.add(landmarkNodes[k].aliasKey);
        }
      }
    }
    alias_key_list.add(alias_keys);
  }
  return alias_key_list;
}

landmarkAliases() async {
  List<LandmarkAliases> landmarkAliases = await getAPILandmarkAliases();
  List<List<int>> alias_key_list = await landmarkNodes();
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
  List<List<String>> alias_name_list = await landmarkAliases();
  List<String> landmark = [];
  for (int i = 0; i < alias_name_list.length; i++) {
    String listToString = alias_name_list[i].join(',');
    landmark.add(listToString);
  }
  return landmark;
}

busTime() async {
  List<UlsanBusTimeTables> timeTableMap = await getAPIUlsanBusTimeTables();
  List<String> bus = await busName();
  List<String> time = await deparatTime();
  List<String> landmark = await landmarkNames();
  List<Map<String, String>> _busTime = [];
  for (int i = 0; i <= timeTableMap.length; i++) {
    Map<String, String> data = {};
    data["bus"] = bus[i];
    data["time"] = time[i];
    data["route"] = landmark[i];
    _busTime.add(data);
  }
  return _busTime;
}

void main() async{
  List a = await busTime();
  print(a);
}
