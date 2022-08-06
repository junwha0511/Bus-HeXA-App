// ignore_for_file: avoid_print
import 'dart:async';
import 'package:bus_hexa/constant.dart';
import 'package:bus_hexa/model/getAPI.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'classes.dart';

class DForDirection{
  Future<List<dynamic>> laneToTracks = getAPILaneToTracks(URL_LANE_TO_TRACKS);
  Future<List<dynamic>> ulsanBusLaneToTracks = getAPIUlsanBusLaneToTracks(URL_ULSAN_BUS_LANE_TO_TRACKS);
  Future<List<dynamic>> laneAliases = getAPILaneAliases(URL_LANE_ALIASES);
  Future<List<dynamic>> ulsanBusArrivalInfos = getAPIUlsanBusArrivalInfos(URL_ULSAN_BUS_ARRIVAL_INFOS);
  Future<List<dynamic>> ulsanBusTimeTables = getAPIUlsanBusTimeTables(URL_ULSAN_BUS_TIME_TABLES);
}

class DForDetail{
  Future<List<dynamic>> laneToTracks = getAPILaneToTracks(URL_LANE_TO_TRACKS);
  Future<List<dynamic>> ulsanBusLaneToTracks = getAPIUlsanBusLaneToTracks(URL_ULSAN_BUS_LANE_TO_TRACKS);
  Future<List<dynamic>> ulsanBusArrivalInfos = getAPIUlsanBusArrivalInfos(URL_ULSAN_BUS_ARRIVAL_INFOS);
  Future<List<dynamic>> ulsanBusTimeTables = getAPIUlsanBusTimeTables(URL_ULSAN_BUS_TIME_TABLES);
  //주요역 정보..
}

class DForLine{
  Future<List<dynamic>> laneToTracks = getAPILaneToTracks(URL_LANE_TO_TRACKS);
  Future<List<dynamic>> ulsanBusLaneToTracks = getAPIUlsanBusLaneToTracks(URL_ULSAN_BUS_LANE_TO_TRACKS);
  Future<List<dynamic>> laneAliases = getAPILaneAliases(URL_LANE_ALIASES);
}

class DForDeparture{
  Future<List<dynamic>> laneToTracks = getAPILaneToTracks(URL_LANE_TO_TRACKS);
  Future<List<dynamic>> ulsanBusLaneToTracks = getAPIUlsanBusLaneToTracks(URL_ULSAN_BUS_LANE_TO_TRACKS);
  Future<List<dynamic>> ulsanBusArrivalInfos = getAPIUlsanBusArrivalInfos(URL_ULSAN_BUS_ARRIVAL_INFOS);
  Future<List<dynamic>> ulsanBusTimeTables = getAPIUlsanBusTimeTables(URL_ULSAN_BUS_TIME_TABLES);
  //경유 노선..
}
