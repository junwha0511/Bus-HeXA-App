import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bus_hexa/loader/directionmodel.dart';

Future<List<dynamic>> getAPILaneToTracks() async {
  var response = await http
      .get(Uri.parse('http://jhshim.ddns.net/api/lanetotracks/?format=json'));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<dynamic> lists = [];
  //for(dynamic entry in datas){
  //  lists.add(LaneToTracks.fromJson(entry));
  //}
  return datas;
}

Future<List<dynamic>> getAPIUlsanBusArrivalInfos() async {
  var response = await http
      .get(Uri.parse('http://jhshim.ddns.net/api/ulsanbus_arrivalinfos/?format=json'));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  List<dynamic> lists = [];
  //for(dynamic entry in datas){
  //  lists.add(UlsanBusArrivalInfos.fromJson(entry));
  //}
  return datas;
}