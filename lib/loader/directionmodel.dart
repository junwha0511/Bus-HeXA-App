import 'dart:async';
import 'package:bus_hexa/direction_page.dart';
import 'package:bus_hexa/loader/getAPI.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LaneToTracks {
  String id;
  String busName;
  String routeId;
  String cityCode;

  LaneToTracks.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        busName = json['bus_name'],
        routeId = json['route_id'],
        cityCode = json['city_code'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'bus_name': busName,
        'route_id': routeId,
        'city_code': cityCode,
      };
}

class UlsanBusArrivalInfos {
  String routeKey;
  String nodeKey;
  String prevStop;
  String arrivalTime;
  String vehicleNo;
  String currentNodename;

  UlsanBusArrivalInfos.fromJson(Map<String, dynamic> json)
      : routeKey = json['route_key_usb'].toString(),
        nodeKey = json['node_key_usb'].toString(),
        prevStop = json['prev_stop_cnt'].toString(),
        arrivalTime = json['arrival_time'].toString(),
        vehicleNo = json['vehicle_no'],
        currentNodename = json['current_node_name'];

  Map<String, dynamic> toJson() => {
        'route_key_usb': routeKey,
        'node_key_usb': nodeKey,
        'prev_stop_cnt': prevStop,
        'arrival_time': arrivalTime,
        'vehicle_no': vehicleNo,
        'current_node_name': currentNodename,
      };
}
//  class busNumber {
//    Map? numbers;
 //   Map? getNumbers(){
//      busnolist();
//    }

busnoList() async {
    List busNo = await getAPILaneToTracks();
    var numbers = await Map<int,String>.fromIterable(busNo,
    key: (element) => element['id'] ,
    value: (element) => element['bus_name']);
    return numbers;
    }
//  }
infoList() async {
  List arrivalInfo = await getAPIUlsanBusArrivalInfos();
  Map busNomap = await busnoList();
  var infos = Map<dynamic, Map>.fromIterable(arrivalInfo,
  key: (element) => busNomap[element['route_key_usb']],
  value: (element) => element
  );
  return infos;
}

inputData() async {
  Map busNomap = await busnoList();
  Map busInfomap = await infoList();
  List dataList = [];
  Map special = {};
  special['bus_no'] = busNomap[2];
  special['info'] = busInfomap[busNomap[1]];
  dataList.add(special);

  for (int i = 3; i < 10; i++) {
    Map elements = {};
    elements['bus_no'] = busNomap[i];
    elements['info'] = busInfomap[busNomap[i]];
    dataList.add(elements);
  }
  return dataList;
}
/*void main() async {
  Map busnumbers = await busnoList();
  List data = await inputData();
  Map arrival = await infoList();
  print(busnumbers);
  print(arrival);
  print(data);
  print('${data[0]['info']['arrival_time']~/60}분');
}
*/

//{'bus_no':string, 
//info':[{'departure':true, 'min_left':int, 'stop_point':string}
//{'departure':false, 'dep_time':string}]}