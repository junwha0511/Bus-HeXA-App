// ignore_for_file: avoid_print
import 'dart:async';
import 'package:bus_hexa/constant.dart';
import 'package:bus_hexa/model/getAPI.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'classes.dart';

class DForDirection{
  Future<List<LaneToTracks>> laneToTracks = getAPILaneToTracks(URL_LANE_TO_TRACKS);
  Future<List<UlsanBusLaneToTracks>> ulsanBusLaneToTracks = getAPIUlsanBusLaneToTracks(URL_ULSAN_BUS_LANE_TO_TRACKS);
  Future<List<LaneAliases>> laneAliases = getAPILaneAliases(URL_LANE_ALIASES);
  Future<List<UlsanBusArrivalInfos>> ulsanBusArrivalInfos = getAPIUlsanBusArrivalInfos(URL_ULSAN_BUS_ARRIVAL_INFOS);
  Future<List<UlsanBusTimeTables>> ulsanBusTimeTables = getAPIUlsanBusTimeTables(URL_ULSAN_BUS_TIME_TABLES);
}

class DForDetail{
  Future<List<LaneToTracks>> laneToTracks = getAPILaneToTracks(URL_LANE_TO_TRACKS);
  Future<List<UlsanBusLaneToTracks>> ulsanBusLaneToTracks = getAPIUlsanBusLaneToTracks(URL_ULSAN_BUS_LANE_TO_TRACKS);
  Future<List<UlsanBusArrivalInfos>> ulsanBusArrivalInfos = getAPIUlsanBusArrivalInfos(URL_ULSAN_BUS_ARRIVAL_INFOS);
  Future<List<UlsanBusTimeTables>> ulsanBusTimeTables = getAPIUlsanBusTimeTables(URL_ULSAN_BUS_TIME_TABLES);
  //주요역 정보..
}

class DForLine{
  Future<List<LaneToTracks>> laneToTracks = getAPILaneToTracks(URL_LANE_TO_TRACKS);
  Future<List<UlsanBusLaneToTracks>> ulsanBusLaneToTracks = getAPIUlsanBusLaneToTracks(URL_ULSAN_BUS_LANE_TO_TRACKS);
  Future<List<LaneAliases>> laneAliases = getAPILaneAliases(URL_LANE_ALIASES);
}

class DForDeparture{
  Future<List<LaneToTracks>> laneToTracks = getAPILaneToTracks(URL_LANE_TO_TRACKS);
  Future<List<UlsanBusLaneToTracks>> ulsanBusLaneToTracks = getAPIUlsanBusLaneToTracks(URL_ULSAN_BUS_LANE_TO_TRACKS);
  Future<List<UlsanBusArrivalInfos>> ulsanBusArrivalInfos = getAPIUlsanBusArrivalInfos(URL_ULSAN_BUS_ARRIVAL_INFOS);
  Future<List<UlsanBusTimeTables>> ulsanBusTimeTables = getAPIUlsanBusTimeTables(URL_ULSAN_BUS_TIME_TABLES);
  //경유 노선..
}
