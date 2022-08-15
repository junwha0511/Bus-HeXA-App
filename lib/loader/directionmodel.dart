import 'package:bus_hexa/loader/getAPI.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

busnomap() async {
    List busNo = await getAPILaneToTracks();
    var numbers = await Map<int,String>.fromIterable(busNo,
    key: (element) => element['id'] ,
    value: (element) => element['bus_name']);
    return numbers;
    }

infomap() async {
  List arrivalInfo = await getAPIUlsanBusArrivalInfos();
  Map busNomap = await busnomap();
  var infos = Map<String, Map>.fromIterable(arrivalInfo,
  key: (element) => busNomap[element['route_key_usb']],
  value: (element) => element);
  return infos;
}

nodesoflanemap() async {
  List nodeoflane = await getAPINodeOfLanes();
  Map busNomap = await busnomap();
  List dataList = [];
  for (int i = 3; i < 10; i++){
    Map elements = {};
    List nodeofbus = nodeoflane.where((element) {
      return element['route_key'] == i;
    }).toList();
    var nodesmap = Map<int, String>.fromIterable(nodeofbus,
    key: (element) => element['node_order'],
    value: (element) => element['node_name']);
    elements[busNomap[i]] = nodesmap;
    dataList.add(elements);
  }
  return dataList;
}

nodemap() async {
  List nodeInfo = await getAPINodeOfLanes();
  Map busNomap = await busnomap();
  List unistNodes = nodeInfo.where((element) {
    return element['node_name'] == '울산과학기술원';
  }).toList();
  var nodes = Map<String, int>.fromIterable(unistNodes,
  key: (element) => busNomap[element['route_key']],
  value: (element) => element['node_order']);
  nodes['233(농소차고지 방면)'] = 57;
  return nodes;
}

posmap() async {
  List posInfo = await getAPIPosOfBuses();
  Map busNomap = await busnomap();
  var infos = Map<String, Map>.fromIterable(posInfo,
  key: (element) => busNomap[element['route_key']],
  value: (element) => element);
  return infos;
}
 
poslist() async {
  List posInfo = await getAPIPosOfBuses();
  Map busNomap = await busnomap();
  Map posMap = await posmap();
  List dataList = [];
  if (posMap[busNomap[1]] == null){
    Map special = {};
    special['bus_no'] = busNomap[2];
    special['info'] = posMap[busNomap[1]];
    dataList.add(special);
  }else{
    List buses = posInfo.where((element) {
      return element['route_key'] == 1;
    }).toList();
    List lists = [];
    for (int j = 0; j < buses.length; j++) {
      Map elements = {};
      elements['bus_num'] = buses[j]['bus_num'];
      elements['current_node_order'] = buses[j]['node_order'];
      lists.add(elements);
    }
    Map nodeMap = {};
    nodeMap['bus_no'] = busNomap[1];
    nodeMap['info'] = lists;
    dataList.add(nodeMap);
  }
  for (int i = 3; i < 10; i++) {
    if (posMap[busNomap[i]] == null){
    Map elements = {};
    elements['bus_no'] = busNomap[i];
    elements['info'] = posMap[busNomap[i]];
    dataList.add(elements);
    }
    else{
    List buses = posInfo.where((element) {
      return element['route_key'] == i;
    }).toList();
    List lists = [];
    for (int j = 0; j < buses.length; j++) {
      Map elements = {};
      elements['bus_num'] = buses[j]['bus_num'];
      elements['current_node_order'] = buses[j]['node_order'];
      lists.add(elements);
    }
    Map nodeMap = {};
    nodeMap['bus_no'] = busNomap[i];
    nodeMap['info'] = lists;
    dataList.add(nodeMap);
  }
  }
  return dataList;
}

StopInfo_1() async {
  Map busNomap = await busnomap();
  Map nodeMap = await nodemap();
  List posList = await poslist();
  List nodeoflane = await nodesoflanemap();
  List dataList = [];
  for (int i = 3; i < 10; i++) {
    Map elements = {};
    Map info = {};
      if (posList[i-2]['info'] == null){
        elements['bus_no'] = busNomap[i];
        elements['info'] = null;
        dataList.add(elements);
      }else{
        List stopList = [];
        List indexList = [];
        for (int j = 0; j < posList[i-2]['info'].length; j++){
          int stop_left = nodeMap[busNomap[i]] - posList[i-2]['info'][j]['current_node_order'];
          if (stop_left > 0){
            stopList.add(stop_left);
            indexList.add(j);
          }
        }
        if (stopList.isEmpty == true){
          elements['bus_no'] = busNomap[i];
          elements['info'] = null;
          dataList.add(elements);
        }else{
          info['stop_left'] = stopList.reduce((value, element) => value < element? value: element);
          info['bus_num'] = posList[i-2]['info'][indexList[stopList.indexOf(stopList.reduce((value, element) => value < element? value: element))]]['bus_num'];
          info['current_node'] = nodeoflane[i-3][busNomap[i]][posList[i-2]['info'][indexList[stopList.indexOf(stopList.reduce((value, element) => value < element? value: element))]]['current_node_order']];
          elements['bus_no'] = busNomap[i];
          elements['info'] = info;
          dataList.add(elements);
        }
        
      }

    }
    return dataList;
  }

StopInfo_2() async {
  Map busNomap = await busnomap();
  Map nodeMap = await nodemap();
  List posList = await poslist();
  List nodeoflane = await nodesoflanemap();
  List dataList = [];
  for (int i = 3; i < 10; i++) {
    Map elements = {};
    Map info = {};
      if (posList[i-2]['info'] == null){
        elements['bus_no'] = busNomap[i];
        elements['info'] = null;
        dataList.add(elements);
      }else{
        List stopList = [];
        List indexList = [];
        for (int j = 0; j < posList[i-2]['info'].length; j++){
          int stop_left = nodeMap[busNomap[i]] - posList[i-2]['info'][j]['current_node_order'];
          if (stop_left > 0){
            stopList.add(stop_left);
            indexList.add(j);
          }
        }
        if (stopList.isEmpty == true){
          elements['bus_no'] = busNomap[i];
          elements['info'] = null;
          dataList.add(elements);
        }else{
          stopList.remove(stopList.reduce((value, element) => value < element? value: element));
          if (stopList.isEmpty == false){
            info['stop_left'] = stopList.reduce((value, element) => value < element? value: element);
            info['bus_num'] = posList[i-2]['info'][indexList[stopList.indexOf(stopList.reduce((value, element) => value < element? value: element))]]['bus_num'];
            info['current_node'] = nodeoflane[i-3][busNomap[i]][posList[i-2]['info'][indexList[stopList.indexOf(stopList.reduce((value, element) => value < element? value: element))]]['current_node_order']];
            elements['bus_no'] = busNomap[i];
            elements['info'] = info;
            dataList.add(elements);
          }else{
            elements['bus_no'] = busNomap[i];
            elements['info'] = null;
            dataList.add(elements);
          }
        }
        
      }

    }
    return dataList;
  }

TimeInfo() async {
  Map busNomap = await busnomap();
  Map busInfomap = await infomap();
  List dataList = [];
  Map special = {};
  Map specialInfo = {};
  special['bus_no'] = busNomap[2];
  if (busInfomap[busNomap[1]] == null){
    special['info'] = busInfomap[busNomap[1]];
  }else{
    specialInfo['min'] = busInfomap[busNomap[1]]['arrival_time'];
    specialInfo['bus_num'] = busInfomap[busNomap[1]]['vehicle_no'];
    specialInfo['current_node'] = busInfomap[busNomap[1]]['current_node_name'];
    special['info'] = specialInfo;
  }
  dataList.add(special);

  for (int i = 3; i < 10; i++) {
    Map elements = {};
    Map info = {};
    if (busInfomap[busNomap[i]] == null){
    elements['bus_no'] = busNomap[i];
    elements['info'] = busInfomap[busNomap[i]];
    }else{
    info['min'] = busInfomap[busNomap[i]]['arrival_time'];
    info['bus_num'] = busInfomap[busNomap[i]]['vehicle_no'];
    info['current_node'] = busInfomap[busNomap[i]]['current_node_name'];
    elements['bus_no'] = busNomap[i];
    elements['info'] = info;
  }
    dataList.add(elements);
  }
  return dataList;
}

void main() async {
  List poses = await poslist();
  Map posMap = await posmap();
  List ulsan = await TimeInfo();
  List pos = await getAPIPosOfBuses();
  List nodes = await nodesoflanemap();
  List stop = await StopInfo_1();
  Map nodemaps = await nodemap();
  List stop2 = await StopInfo_2();
  //print(ulsan);
  print(poses);
  //print(posMap);
  //print(nodes);
  print(stop);
  print(stop2);
  print(nodemaps);
}