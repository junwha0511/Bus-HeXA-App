
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bus_hexa/model/classes.dart';
import 'package:bus_hexa/constant.dart';

Future<List<LaneToTracks>> getAPILaneToTracks() async {
  var response = await http
      .get(Uri.parse(URL_LANE_TO_TRACKS));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<LaneToTracks> lists = [];
  for(dynamic entry in datas){
    lists.add(LaneToTracks.fromJson(entry));
  }
  return lists;
}

Future<List<NodeOfLanes>> getAPINodeOfLanes() async {
  var response = await http
      .get(Uri.parse(URL_NODE_OF_LANES));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<NodeOfLanes> lists = [];
  for(dynamic entry in datas){
    lists.add(NodeOfLanes.fromJson(entry));
  }
  return lists;
}

Future<List<PosOfBuses>> getAPIPosOfBuses() async {
  var response = await http
      .get(Uri.parse(URL_POS_OF_BUSES));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<PosOfBuses> lists = [];
  for(dynamic entry in datas){
    lists.add(PosOfBuses.fromJson(entry));
  }
  return lists;
}

Future<List<UlsanBusLaneToTracks>> getAPIUlsanBusLaneToTracks() async {
  var response = await http
      .get(Uri.parse(URL_ULSAN_BUS_LANE_TO_TRACKS));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<UlsanBusLaneToTracks> lists = [];
  for(dynamic entry in datas){
    lists.add(UlsanBusLaneToTracks.fromJson(entry));
  }
  return lists;
}

Future<List<UlsanBusTimeTables>> getAPIUlsanBusTimeTables() async {
  var response = await http
      .get(Uri.parse(URL_ULSAN_BUS_TIME_TABLES));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<UlsanBusTimeTables> lists = [];
  for(dynamic entry in datas){
    lists.add(UlsanBusTimeTables.fromJson(entry));
  }
  return lists;
}

Future<List<UlsanBusNodeToTracks>> getAPIUlsanBusNodeToTracks() async {
  var response = await http
      .get(Uri.parse(URL_ULSAN_BUS_NODE_TO_TRACKS));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<UlsanBusNodeToTracks> lists = [];
  for(dynamic entry in datas){
    lists.add(UlsanBusNodeToTracks.fromJson(entry));
  }
  return lists;
}

Future<List<UlsanBusArrivalInfos>> getAPIUlsanBusArrivalInfos() async {
  var response = await http
      .get(Uri.parse(URL_ULSAN_BUS_ARRIVAL_INFOS));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<UlsanBusArrivalInfos> lists = [];
  for(dynamic entry in datas){
    lists.add(UlsanBusArrivalInfos.fromJson(entry));
  }
  return lists;
}

Future<List<LaneAliases>> getAPILaneAliases() async {
  var response = await http
      .get(Uri.parse(URL_LANE_ALIASES));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<LaneAliases> lists = [];
  for(dynamic entry in datas){
    lists.add(LaneAliases.fromJson(entry));
  }
  return lists;
}

Future<List<PartOfLanes>> getAPIPartOfLanes() async {
  var response = await http
      .get(Uri.parse(URL_PART_OF_LANES));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<PartOfLanes> lists = [];
  for(dynamic entry in datas){
    lists.add(PartOfLanes.fromJson(entry));
  }
  return lists;
}

Future<List<MapToAliases>> getAPIMapToAliases() async {
  var response = await http
      .get(Uri.parse(URL_MAP_TO_ALIASES));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<MapToAliases> lists = [];
  for(dynamic entry in datas){
    lists.add(MapToAliases.fromJson(entry));
  }
  return lists;
}

Future<List<LandmarkAliases>> getAPILandmarkAliases() async {
  var response = await http
      .get(Uri.parse(URL_LANDMARK_ALIASES));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<LandmarkAliases> lists = [];
  for(dynamic entry in datas){
    lists.add(LandmarkAliases.fromJson(entry));
  }
  return lists;
}

Future<List<LandmarkNodes>> getAPILandmarkNodes() async {
  var response = await http
      .get(Uri.parse(URL_LANDMARK_NODES));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<LandmarkNodes> lists = [];
  for(dynamic entry in datas){
    lists.add(LandmarkNodes.fromJson(entry));
  }
  return lists;
}

Future<List<LandmarkOfLanes>> getAPILandmarkOfLanes() async {
  var response = await http
      .get(Uri.parse(URL_LANDMARK_OF_LANES));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<LandmarkOfLanes> lists = [];
  for(dynamic entry in datas){
    lists.add(LandmarkOfLanes.fromJson(entry));
  }
  return lists;
}