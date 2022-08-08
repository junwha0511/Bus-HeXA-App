
// ignore_for_file: avoid_print
import 'dart:async';
import 'package:bus_hexa/constant.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class LaneToTracks {
  int id;
  String busName;
  String routeId;
  String cityCode;

  LaneToTracks.fromJson(Map<String, dynamic> json)
      : id = json['id'],
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

class NodeOfLanes {
  int routeKey;
  int nodeOrder;
  String nodeId;
  String nodeName;

  NodeOfLanes.fromJson(Map<String, dynamic> json)
      : routeKey = json['route_key'],
        nodeOrder = json['node_order'],
        nodeId = json['node_id'],
        nodeName = json['node_name'];

  Map<String, dynamic> toJson() => {
        'route_key': routeKey,
        'node_order': nodeOrder,
        'node_id': nodeId,
        'node_name': nodeName,
      };
}

class PosOfBuses {
  int routeKey;
  String nodeId;
  String busNum;
  int nodeOrder;

  PosOfBuses.fromJson(Map<String, dynamic> json)
      : routeKey = json['route_key'],
        nodeId = json['node_id'],
        busNum = json['bus_num'],
        nodeOrder = json['node_order'];

  Map<String,dynamic> toJson() =>
  {
    'route_key' : routeKey,
    'node_id' : nodeId,
    'bus_num' : busNum,
    'node_order' : nodeOrder,
  };
}

class UlsanBusLaneToTracks {
  int id;
  int routeKey;
  String routeId;
  String routeNum;
  int routeDirection;
  int routeClass;

  UlsanBusLaneToTracks.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        routeKey = json['route_key'],
        routeId = json['route_id'],
        routeNum = json['route_num'],
        routeDirection = json['route_direction'],
        routeClass = json['route_class'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'route_key': routeKey,
        'route_id': routeId,
        'route_num': routeNum,
        'route_direction': routeDirection,
        'route_class': routeClass,
      };
}

class UlsanBusTimeTables {
  int routeKeyUsb;
  String departTime;
  int departSeq;

  UlsanBusTimeTables.fromJson(Map<String, dynamic> json)
      : routeKeyUsb = json['route_key_usb'],
        departTime = json['depart_time'],
        departSeq = json['depart_seq'];

  Map<String, dynamic> toJson() => {
        'route_key_usb': routeKeyUsb,
        'depart_time': departTime,
        'depart_seq': departSeq,
      };
}

class UlsanBusNodeToTracks {
  String nodeName;
  String nodeId;

  UlsanBusNodeToTracks.fromJson(Map<String, dynamic> json)
      : nodeName = json['node_name'],
        nodeId = json['node_id'];

  Map<String, dynamic> toJson() => {'node_name': nodeName, 'node_id': nodeId};
}

class UlsanBusArrivalInfos {
  int routeKeyUsb;
  int nodeKeyUsb;
  int prevStopCnt;
  int arrivalTime;
  String vehicleNo;
  String currentNodeName;

  UlsanBusArrivalInfos.fromJson(Map<String, dynamic> json)
      : routeKeyUsb = json['route_key_usb'],
        nodeKeyUsb = json['node_key_usb'],
        prevStopCnt = json['prev_stop_cnt'],
        arrivalTime = json['arrival_time'],
        vehicleNo = json['vehicle_no'],
        currentNodeName = json['current_node_name'];

  Map<String,dynamic> toJson() =>
  {
    'route_key_usb' : routeKeyUsb,
    'node_key_usb' : nodeKeyUsb,
    'prev_stop_cnt' : prevStopCnt,
    'arrival_time' : arrivalTime,
    'vehicle_no' : vehicleNo,
    'current_node_name' : currentNodeName
  };
}
class LaneAliases {
  int id;
  String aliasName;

  LaneAliases.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        aliasName = json['alias_name'];

  Map<String, dynamic> toJson() => {'id': id, 'alias_name': aliasName};
}

class PartOfLanes {
  int id;
  int laneKey;
  int firstNodeKey;
  int lastNodeKey;
  String partName;
  int count;

  PartOfLanes.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        laneKey = json['lane_key'],
        firstNodeKey = json['first_node_key'],
        lastNodeKey = json['last_node_key'],
        partName = json['part_name'],
        count = json['count'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'lane_key': laneKey,
        'first_node_key': firstNodeKey,
        'last_node_key': lastNodeKey,
        'part_name': partName,
        'count': count,
      };
}

class MapToAliases {
  int laneKey;
  int count;
  int aliasKey;

  MapToAliases.fromJson(Map<String, dynamic> json)
      : laneKey = json['lane_key'],
        count = json['count'],
        aliasKey = json['alias_key'];

  Map<String, dynamic> toJson() => {
        'lane_key': laneKey,
        'count': count,
        'alias_key': aliasKey,
      };
}

class LandmarkAliases {
  String aliasName;

  LandmarkAliases.fromJson(Map<String, dynamic> json)
      : aliasName = json['alias_name'];

  Map<String, dynamic> toJson() => {
        'alias_name': aliasName,
      };
}

class LandmarkNodes {
  int aliasKey;
  String nodeId;

  LandmarkNodes.fromJson(Map<String, dynamic> json)
      : aliasKey = json['alias_key'],
        nodeId = json['node_id'];

  Map<String, dynamic> toJson() => {'alias_key': aliasKey, 'node_id': nodeId};
}

class LandmarkOfLanes {
  int routeKey;
  List<int> landmarkKeys;

  LandmarkOfLanes.fromJson(Map<String, dynamic> json)
      : routeKey = json['route_key'],
        landmarkKeys = json['landmark_keys'];

  Map<String, dynamic> toJson() =>
      {'route_key': routeKey, 'landmark_keys': landmarkKeys};
}