import 'package:bus_hexa/model/classes.dart';
import 'package:bus_hexa/model/getAPI.dart';

// routekey() async {
//   List timeTableMap = await UlsanBusTimeTables();
//   var routeKey = await Map<int, int>.fromIterable(timeTableMap,
//       key: (Index) => Index - 1, value: (element) => element["route_key"]);
//   return routeKey;
// }

deparatTime() async {
  List<UlsanBusTimeTables> timeTable = await getAPIUlsanBusTimeTables();
  List<String> departTime = await List<String>.generate(
      timeTable.length, (index) => timeTable[index].departTime);
  // var departTime = await Map<String, int>.fromIterable(timeTableMap,
  //     key: (Index) => Index - 1, value: (element) => element["depart_time"]);
  return departTime;
}

busName() async {
  List<UlsanBusTimeTables> timeTable = await getAPIUlsanBusTimeTables();
  List<LaneToTracks> laneToTracks = await getAPILaneToTracks();
  List<String> busName_list = [];
  for (int i = 0; i < timeTable.length; i++) {
    for (int j = 0; j < laneToTracks.length; j++) {
      if (timeTable[i].routeKeyUsb == laneToTracks[j].id) {
        busName_list.add(laneToTracks[j].busName);
      }
    }
  }
  return busName_list;
}

landmarkKeys() async {
  List<UlsanBusTimeTables> timeTable = await getAPIUlsanBusTimeTables();
  List<LandmarkOfLanes> landmarkLanes = await getAPILandmarkOfLanes();
  List<List<int>> landmark_key_list = [];
  for (int i = 0; i < timeTable.length; i++) {
    for (int j = 0; j < landmarkLanes.length; j++) {
      if (timeTable[i].routeKeyUsb == landmarkLanes[j].routeKey) {
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
    List<int> alias_keys_set = [];
    for (int j = 0; j < landmark_key_list[i].length; j++) {
      for (int k = 0; k < landmarkNodes.length; k++) {
        if (landmark_key_list[i][j] == landmarkNodes[k].id) {
          alias_keys.add(landmarkNodes[k].aliasKey);
        }
      }
    }
    alias_keys_set = alias_keys.toSet().toList();
    alias_key_list.add(alias_keys_set);
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
  List<UlsanBusTimeTables> timeTable = await getAPIUlsanBusTimeTables();
  List<String> bus = await busName();
  List<String> time = await deparatTime();
  List<String> landmark = await landmarkNames();
  List<Map<String, String>> _busTime = [];
  for (int i = 0; i <= timeTable.length; i++) {
    Map<String, String> data = {};
    data["bus"] = bus[i];
    data["time"] = time[i];
    data["route"] = landmark[i];
    _busTime.add(data);
  }
  return _busTime;
}

//버스 이름, 출발시간, 주요역 모두 API중 timetable의 순서대로 되어있음.

// void main() async {
//   List<String> bus = await busName();
//   List<String> time = await deparatTime();
//   List<String> landmark = await landmarkNames();
//   List<Map<String, String>> a = await busTime();
//   print(bus);
//   print(time);
//   print(landmark);
//   print(a);
// }
