import 'package:bus_hexa/bustime.dart';
import 'package:bus_hexa/model/classes.dart';
import 'package:bus_hexa/model/getAPI.dart';

Future<List<String>> deparatTime() async {
  List<UlsanBusTimeTables> timeTable = await getAPIUlsanBusTimeTables();
  List<String> departTime = await List<String>.generate(
      timeTable.length, (index) => timeTable[index].departTime);
  return departTime;
}
//UlsanBusTimeTables에서 departTime(출발시간)만 list로

Future<List<String>> busName() async {
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

//UlsanBusTimeTables의 routekeyusb로 LaneToTracks에서 해당하는 버스 번호 찾고
//버스번호만 list로

Future<List<List<int>>> landmarkKeys() async {
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

//UlsanBusTimeTables의 routekeyusb로 LandmarkOfLanes에서 해당하는 버스
//landmarkKeys찾고 리스트로

Future<List<List<int>>> landmarkNodes() async {
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
//landmarkKey 리스트에 담긴 landmarkKey 각각에 대응하는 aliasKeys 리스트로

Future<List<List<String>>> landmarkAliases() async {
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
//aliasesKey 에 해당하는 값을 aliasName으로

Future<List<String>> landmarkNames() async {
  List<List<String>> alias_name_list = await landmarkAliases();
  List<String> landmark = [];
  for (int i = 0; i < alias_name_list.length; i++) {
    String listToString = alias_name_list[i].join(',');
    landmark.add(listToString);
  }
  return landmark;
}
//리스트로 된 이름들을 ,로 연결

Future<List<String>> timeHour() async {
  List<String> time = await deparatTime();
  List<String> departTimeHour = [];
  for (var i = 0; i < time.length; i++) {
    departTimeHour.add(time[i].substring(0, 2));
  }
  return departTimeHour;
}
//출발시각 중 hour만

Future<List<String>> timeMin() async {
  List<String> time = await deparatTime();
  List<String> departTimeMin = [];
  for (var i = 0; i < time.length; i++) {
    departTimeMin.add(time[i].substring(2));
  }
  return departTimeMin;
}
//출발시각 중 minute만

class busDepartTime {
  String bus;
  String hour;
  String min;
  String route;

  busDepartTime(
      {required this.bus,
      required this.hour,
      required this.min,
      required this.route});
}

Future<List<busDepartTime>> busTime() async {
  List<UlsanBusTimeTables> timeTable = await getAPIUlsanBusTimeTables();
  List<String> busNumAndName = await busName();
  List<String> departHour = await timeHour();
  List<String> departMin = await timeMin();
  List<String> landmark = await landmarkNames();
  List<busDepartTime> _busTime = [];
  for (int i = 0; i < timeTable.length; i++) {
    List<busDepartTime> _busTime = timeTable
        .map((element) => busDepartTime(
            bus: busNumAndName[i],
            hour: departHour[i],
            min: departMin[i],
            route: landmark[i]))
        .toList();
  }
  return _busTime;
}

//버스 이름, 출발시간, 주요역 모두 API중 timetable의 순서대로 되어있음.

