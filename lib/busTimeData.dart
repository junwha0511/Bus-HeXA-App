import 'dart:html';
import 'dart:indexed_db';
import '../bustime.dart';
import '../model/classes.dart';
import '../model/getAPI.dart';

// routekey() async {
//   List timeTableMap = await UlsanBusTimeTables();
//   var routeKey = await Map<int, int>.fromIterable(timeTableMap,
//       key: (Index) => Index - 1, value: (element) => element["route_key"]);
//   return routeKey;
// }

deparattime() async {
  List timeTableMap = await UlsanBusTimeTables();
  List departTime = await List<String>.generate(
      timeTableMap.length, (index) => timeTableMap[index - 1]["depart_time"]);
  // var departTime = await Map<String, int>.fromIterable(timeTableMap,
  //     key: (Index) => Index - 1, value: (element) => element["depart_time"]);
  return departTime;
}

busname() async {
  List timeTableMap = await UlsanBusTimeTables();
  List laneToTracks = await LaneToTracks();
  List busName_list = [];
  for (int i = 0; i < timeTableMap.length; i++) {
    Map<int, String> busName_map = {};
    for (int j = 0; j < laneToTracks.length; j++) {
      if (timeTableMap[i]["route_key"] = laneToTracks[j]["id"]) {
        busName_map[i] = laneToTracks[j]["bus_name"];
      }
    }
    busName_list.add(busName_map);
  }
  return busName_list;
}

landmarkkeys() async {
  List timeTableMap = await UlsanBusTimeTables();
  List landmarkLanes = await LandmarkOfLanes();
  List landmarkNodes = await LandmarkNodes();
  List landmarkAliases = await LandmarkAliases();
  List<List> landmark_key_list = [];
  for (int i = 0; i < timeTableMap.length; i++) {
    List landmark_keys = [];
    for (int j = 0; j < landmarkLanes.length; j++) {
      if (timeTableMap[i]["route_key"] = landmarkLanes[j]["id"]) {
        landmark_keys.add(landmarkLanes[j]["landmark_keys"]);
      }
    }
    landmark_key_list.add(landmark_keys);
  }
  return landmark_key_list;
}

landmarknodes() async {
  List landmarkNodes = await LandmarkNodes();
  List<List> landmark_key_list = await landmarkkeys();
  List<List> alias_key_list = [];
  for (int i = 0; i < landmark_key_list.length; i++) {
    List alias_keys = [];
    for (int j = 0; j < landmark_key_list[i].length; j++) {
      for (int k = 0; k < landmarkNodes.length; k++) {
        if (landmark_key_list[i][j] = landmarkNodes[k]["id"]) {
          alias_keys.add(landmarkNodes[k]["alias_key"]);
        }
      }
    }
    alias_key_list.add(alias_keys);
  }
  return alias_key_list;
}

landmarkaliases() async {
  List landmarkAliases = await LandmarkAliases();
  List<List> alias_key_list = await landmarknodes();
  List<List> alias_name_list = [];
  for (int i = 0; i < alias_key_list.length; i++) {
    List alias_names = [];
    for (int j = 0; j < alias_key_list[i].length; j++) {
      for (int k = 0; k < landmarkAliases.length; k++) {
        if (alias_name_list[i][j] = landmarkAliases[k]["id"]) {
          alias_names.add(landmarkAliases[k]["alias_name"]);
        }
      }
    }
    alias_name_list.add(alias_names);
  }
  return alias_name_list;
}

landmarknames() async {
  List<List> alias_name_list = await landmarkaliases();
  List landmark = [];
  for (int i = 0; i < alias_name_list.length; i++) {
    String listToString = alias_name_list[i].join(',');
    landmark.add(listToString);
  }
  return landmark;
}

bustime() async {
  List timeTableMap = await UlsanBusTimeTables();
  List bus = await busname();
  List time = await deparattime();
  List landmark = await landmarknames();
  List _busTime = [];
  for (int i = 0; i <= timeTableMap.length; i++) {
    Map data = {};
    data["bus"] = bus[i];
    data["time"] = time[i];
    data["route"] = landmark[i];
    _busTime.add(data);
  }
  return _busTime;
}
