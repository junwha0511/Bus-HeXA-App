
// ignore_for_file: avoid_print
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


// Future<List<dynamic>> getAPI(url) async {
//   var response = await http
//       .get(Uri.parse(url));
//   var statusCode = response.statusCode;
//   var responseHeaders = response.headers;
//   String jsonString = utf8.decode(response.bodyBytes);
//   List<dynamic> datas = jsonDecode(jsonString);
//   List<dynamic> lists = [];
//   for(dynamic entry in datas){
//     lists.add(classes.fromJson(entry));
//   }
//   return lists;
// }

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

class NodeOfLanes {
  String routeKey;
  String nodeOrder;
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
  String routeKey;
  String nodeId;
  String busNum;
  String nodeOrder;

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
  String id;
  String routeKey;
  String routeId;
  String routeNum;
  String routeDirection;
  String routeClass;

  UlsanBusLaneToTracks.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        routeKey = json['route_key'].toString(),
        routeId = json['route_id'],
        routeNum = json['route_num'],
        routeDirection = json['route_direction'].toString(),
        routeClass = json['route_class'].toString();

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
  String routeKeyUsb;
  String departTime;
  String departSeq;

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
  String id;
  String aliasName;

  UlsanBusArrivalInfos.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        aliasName = json['alias_name'];

  Map<String,dynamic> toJson() =>
  {
    'id':id,
    'alias_name':aliasName
  };
}

class LaneAliases {
  String id;
  String aliasName;

  LaneAliases.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        aliasName = json['alias_name'];

  Map<String, dynamic> toJson() => {'id': id, 'alias_name': aliasName};
}

class PartOfLanes {
  String id;
  String laneKey;
  String firstNodeKey;
  String lastNodeKey;
  String partName;
  String count;

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
  String laneKey;
  String count;
  String aliasKey;

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
  String aliasKey;
  String nodeId;

  LandmarkNodes.fromJson(Map<String, dynamic> json)
      : aliasKey = json['alias_key'],
        nodeId = json['node_id'];

  Map<String, dynamic> toJson() => {'alias_key': aliasKey, 'node_id': nodeId};
}

class LandmarkOfLanes {
  String routeKey;
  String landmarkKeys;

  LandmarkOfLanes.fromJson(Map<String, dynamic> json)
      : routeKey = json['route_key'],
        landmarkKeys = json['landmark_keys'];

  Map<String, dynamic> toJson() =>
      {'route_key': routeKey, 'landmark_keys': landmarkKeys};
}






// class LineAndRoute {
//   List<String> numbers = [];
//   List<List<String>> direction = [[], [], [], [], [], []];

//   LineAndRoute() {
//     this.ApiBusNum();
//     this.ApiBusRoute();
//   }
//   void ApiBusNum() async {
//     String url =
//         "http://jhshim.ddns.net/api/ulsanbus_lanetotracks/?format=json";
//     var response = await http.get(Uri.parse(url));
//     var statusCode = response.statusCode;
//     var responseHeaders = response.headers;
//     String jsonString = utf8.decode(response.bodyBytes);
//     List<dynamic> buses = jsonDecode(jsonString);
//     for (Map<String, dynamic> entry in buses) {
//       if (!this.numbers.contains(entry["route_num"]))
//         this.numbers.add(entry["route_num"]);
//     }
//   }
// }

//   void ApiBusRoute() async {
//     int i = 0;
//     String url = "http://jhshim.ddns.net/api/lanetotracks/?format=json";
//     var response = await http.get(Uri.parse(url));
//     var statusCode = response.statusCode;
//     var responseHeaders = response.headers;
//     String jsonString = utf8.decode(response.bodyBytes);
//     List<dynamic> buses = jsonDecode(jsonString);
//     for (Map<String, dynamic> entry in buses) {
//       if (entry["id"] == 1 || entry["id"] == 2 || entry["id"] == 3)
//         this.direction[0].add(entry["bus_name"]);
//       else if (entry["id"] == 4 || entry["id"] == 5)
//         this.direction[1].add(entry["bus_name"]);
//       else if (entry["id"] == 6 || entry["id"] == 11)
//         this.direction[2].add(entry["bus_name"]);
//       else if (entry["id"] == 7 || entry["id"] == 12)
//         this.direction[3].add(entry["bus_name"]);
//       else if (entry["id"] == 8 || entry["id"] == 13)
//         this.direction[4].add(entry["bus_name"]);
//       else
//         this.direction[5].add(entry["bus_name"]);
//     }
//   }
// }



// }
// getAPI() async {
//   var response = await http
//       .get(Uri.parse('http://jhshim.ddns.net/api/lanetotracks/?format=json'));
//   var statusCode = response.statusCode;
//   var responseHeaders = response.headers;
//   String jsonString = utf8.decode(response.bodyBytes);
//   List<dynamic> buses = jsonDecode(jsonString);
// for (Map<String, dynamic> entry in buses) {
//   print(entry);
// }