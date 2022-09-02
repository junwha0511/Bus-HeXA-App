import 'package:flutter/material.dart';
import 'package:bus_hexa/loader/directionmodel.dart';
import 'package:bus_hexa/direction_page.dart';
import 'package:bus_hexa/model/advancedDTO.dart';
/*Future<List<dynamic>> getBusinfo() async{
List<Map<String, dynamic>> busInfo = [];
 return Future.delayed(Duration(), () => busInfo);
}*/


class Data with ChangeNotifier{
  List<LaneStopInfo> busStopInfo = [];
  //List getBusinfolist() {
  //  updateData();
   // return busInfo;
 // }
  Data(){updateData();}
  void updateData() async {
    busStopInfo = await constructStopInfo();
    print(busStopInfo);
    notifyListeners();
  }
}
