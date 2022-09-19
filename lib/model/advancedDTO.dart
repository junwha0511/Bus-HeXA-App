// ignore_for_file: avoid_print
import 'dart:async';
import 'package:bus_hexa/constant.dart';
import 'package:bus_hexa/model/getAPI.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'classes.dart';

class DForDirection {
  Future<List<LaneToTracks>> laneToTracks = getAPILaneToTracks();
  Future<List<UlsanBusLaneToTracks>> ulsanBusLaneToTracks =
      getAPIUlsanBusLaneToTracks();
  Future<List<LaneAliases>> laneAliases = getAPILaneAliases();
  Future<List<UlsanBusArrivalInfos>> ulsanBusArrivalInfos =
      getAPIUlsanBusArrivalInfos();
  Future<List<UlsanBusTimeTables>> ulsanBusTimeTables =
      getAPIUlsanBusTimeTables();
}

class DForDetail {
  Future<List<LaneToTracks>> laneToTracks = getAPILaneToTracks();
  Future<List<UlsanBusLaneToTracks>> ulsanBusLaneToTracks =
      getAPIUlsanBusLaneToTracks();
  Future<List<UlsanBusArrivalInfos>> ulsanBusArrivalInfos =
      getAPIUlsanBusArrivalInfos();
  Future<List<UlsanBusTimeTables>> ulsanBusTimeTables =
      getAPIUlsanBusTimeTables();
  //주요역 정보..
}

class DForLine {
  Future<List<LaneToTracks>> laneToTracks = getAPILaneToTracks();
  Future<List<UlsanBusLaneToTracks>> ulsanBusLaneToTracks =
      getAPIUlsanBusLaneToTracks();
  Future<List<LaneAliases>> laneAliases = getAPILaneAliases();
}

class DForDeparture {
  Future<List<LaneToTracks>> laneToTracks = getAPILaneToTracks();
  Future<List<UlsanBusLaneToTracks>> ulsanBusLaneToTracks =
      getAPIUlsanBusLaneToTracks();
  Future<List<UlsanBusArrivalInfos>> ulsanBusArrivalInfos =
      getAPIUlsanBusArrivalInfos();
  Future<List<UlsanBusTimeTables>> ulsanBusTimeTables =
      getAPIUlsanBusTimeTables();
  //경유 노선..
}
