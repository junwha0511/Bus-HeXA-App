
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bus_hexa/model/classes.dart';

Future<List<dynamic>> getAPILaneToTracks(url) async {
  var response = await http
      .get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<dynamic> lists = [];
  for(dynamic entry in datas){
    lists.add(LaneToTracks.fromJson(entry));
  }
  return lists;
}

Future<List<dynamic>> getAPINodeOfLanes(url) async {
  var response = await http
      .get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<dynamic> lists = [];
  for(dynamic entry in datas){
    lists.add(NodeOfLanes.fromJson(entry));
  }
  return lists;
}

Future<List<dynamic>> getAPIPosOfBuses(url) async {
  var response = await http
      .get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<dynamic> lists = [];
  for(dynamic entry in datas){
    lists.add(PosOfBuses.fromJson(entry));
  }
  return lists;
}

Future<List<dynamic>> getAPIUlsanBusLaneToTracks(url) async {
  var response = await http
      .get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<dynamic> lists = [];
  for(dynamic entry in datas){
    lists.add(UlsanBusLaneToTracks.fromJson(entry));
  }
  return lists;
}

Future<List<dynamic>> getAPIUlsanBusTimeTables(url) async {
  var response = await http
      .get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<dynamic> lists = [];
  for(dynamic entry in datas){
    lists.add(UlsanBusTimeTables.fromJson(entry));
  }
  return lists;
}

Future<List<dynamic>> getAPIUlsanBusNodeToTracks(url) async {
  var response = await http
      .get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<dynamic> lists = [];
  for(dynamic entry in datas){
    lists.add(UlsanBusNodeToTracks.fromJson(entry));
  }
  return lists;
}

Future<List<dynamic>> getAPIUlsanBusArrivalInfos(url) async {
  var response = await http
      .get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<dynamic> lists = [];
  for(dynamic entry in datas){
    lists.add(UlsanBusArrivalInfos.fromJson(entry));
  }
  return lists;
}

Future<List<dynamic>> getAPILaneAliases(url) async {
  var response = await http
      .get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<dynamic> lists = [];
  for(dynamic entry in datas){
    lists.add(LaneAliases.fromJson(entry));
  }
  return lists;
}

Future<List<dynamic>> getAPIPartOfLanes(url) async {
  var response = await http
      .get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<dynamic> lists = [];
  for(dynamic entry in datas){
    lists.add(PartOfLanes.fromJson(entry));
  }
  return lists;
}

Future<List<dynamic>> getAPIMapToAliases(url) async {
  var response = await http
      .get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<dynamic> lists = [];
  for(dynamic entry in datas){
    lists.add(MapToAliases.fromJson(entry));
  }
  return lists;
}

Future<List<dynamic>> getAPILandmarkAliases(url) async {
  var response = await http
      .get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<dynamic> lists = [];
  for(dynamic entry in datas){
    lists.add(LandmarkAliases.fromJson(entry));
  }
  return lists;
}

Future<List<dynamic>> getAPILandmarkNodes(url) async {
  var response = await http
      .get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<dynamic> lists = [];
  for(dynamic entry in datas){
    lists.add(LandmarkNodes.fromJson(entry));
  }
  return lists;
}

Future<List<dynamic>> getAPILandmarkOfLanes(url) async {
  var response = await http
      .get(Uri.parse(url));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<dynamic> lists = [];
  for(dynamic entry in datas){
    lists.add(LandmarkOfLanes.fromJson(entry));
  }
  return lists;
}