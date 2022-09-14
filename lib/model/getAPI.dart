import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bus_hexa/model/classes.dart';

Future<List<LaneToTracks>> getAPILaneToTracks(url) async {
  var response = await http.get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<LaneToTracks> lists = [];
  for (dynamic entry in datas) {
    lists.add(LaneToTracks.fromJson(entry));
  }
  return lists;
}

Future<List<NodeOfLanes>> getAPINodeOfLanes(url) async {
  var response = await http.get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<NodeOfLanes> lists = [];
  for (dynamic entry in datas) {
    lists.add(NodeOfLanes.fromJson(entry));
  }
  return lists;
}

Future<List<PosOfBuses>> getAPIPosOfBuses(url) async {
  var response = await http.get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<PosOfBuses> lists = [];
  for (dynamic entry in datas) {
    lists.add(PosOfBuses.fromJson(entry));
  }
  return lists;
}

Future<List<UlsanBusLaneToTracks>> getAPIUlsanBusLaneToTracks(url) async {
  var response = await http.get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<UlsanBusLaneToTracks> lists = [];
  for (dynamic entry in datas) {
    lists.add(UlsanBusLaneToTracks.fromJson(entry));
  }
  return lists;
}

Future<List<UlsanBusTimeTables>> getAPIUlsanBusTimeTables(url) async {
  var response = await http.get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<UlsanBusTimeTables> lists = [];
  for (dynamic entry in datas) {
    lists.add(UlsanBusTimeTables.fromJson(entry));
  }
  return lists;
}

Future<List<UlsanBusNodeToTracks>> getAPIUlsanBusNodeToTracks(url) async {
  var response = await http.get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<UlsanBusNodeToTracks> lists = [];
  for (dynamic entry in datas) {
    lists.add(UlsanBusNodeToTracks.fromJson(entry));
  }
  return lists;
}

Future<List<UlsanBusArrivalInfos>> getAPIUlsanBusArrivalInfos(url) async {
  var response = await http.get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<UlsanBusArrivalInfos> lists = [];
  for (dynamic entry in datas) {
    lists.add(UlsanBusArrivalInfos.fromJson(entry));
  }
  return lists;
}

Future<List<LaneAliases>> getAPILaneAliases(url) async {
  var response = await http.get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<LaneAliases> lists = [];
  for (dynamic entry in datas) {
    lists.add(LaneAliases.fromJson(entry));
  }
  return lists;
}

Future<List<PartOfLanes>> getAPIPartOfLanes(url) async {
  var response = await http.get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<PartOfLanes> lists = [];
  for (dynamic entry in datas) {
    lists.add(PartOfLanes.fromJson(entry));
  }
  return lists;
}

Future<List<MapToAliases>> getAPIMapToAliases(url) async {
  var response = await http.get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<MapToAliases> lists = [];
  for (dynamic entry in datas) {
    lists.add(MapToAliases.fromJson(entry));
  }
  return lists;
}

Future<List<LandmarkAliases>> getAPILandmarkAliases(url) async {
  var response = await http.get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<LandmarkAliases> lists = [];
  for (dynamic entry in datas) {
    lists.add(LandmarkAliases.fromJson(entry));
  }
  return lists;
}

Future<List<LandmarkNodes>> getAPILandmarkNodes(url) async {
  var response = await http.get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<LandmarkNodes> lists = [];
  for (dynamic entry in datas) {
    lists.add(LandmarkNodes.fromJson(entry));
  }
  return lists;
}

Future<List<LandmarkOfLanes>> getAPILandmarkOfLanes(url) async {
  var response = await http.get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<LandmarkOfLanes> lists = [];
  for (dynamic entry in datas) {
    lists.add(LandmarkOfLanes.fromJson(entry));
  }
  return lists;
}
