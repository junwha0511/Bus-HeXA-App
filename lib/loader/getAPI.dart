import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bus_hexa/model/classes.dart';


Future<List<dynamic>> getAPILaneToTracks() async {
  var response = await http
      .get(Uri.parse('http://bus.hexa.pro/api/lanetotracks/?format=json'));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  
  return datas;
}

Future<List<dynamic>> getAPIUlsanBusArrivalInfos() async {
  var response = await http
      .get(Uri.parse('http://bus.hexa.pro/api/ulsanbus_arrivalinfos/?format=json'));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);

  return datas;
}

Future<List<dynamic>> getAPIPosOfBuses() async {
  var response = await http
      .get(Uri.parse('http://bus.hexa.pro/api/posofbuses/?format=json'));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);

  return datas;
}

Future<List<dynamic>> getAPINodeOfLanes() async {
  var response = await http
      .get(Uri.parse('http://bus.hexa.pro/api/nodeoflanes/?format=json'));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);

  return datas;
}

Future<List<dynamic>> getAPIUlsanBusTimeTables() async {
  var response = await http
      .get(Uri.parse('http://bus.hexa.pro/api/ulsanbus_timetables/?format=json'));
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String jsonString = utf8.decode(response.bodyBytes);
  List<dynamic> datas = jsonDecode(jsonString);
  
  return datas;
}