import 'package:flutter/material.dart';
import 'package:bus_hexa/loader/direction_loader.dart';
import 'package:bus_hexa/direction_page.dart';
import 'package:bus_hexa/model/advancedDTO.dart';
/*Future<List<dynamic>> getBusinfo() async{
List<Map<String, dynamic>> busInfo = [];
 return Future.delayed(Duration(), () => busInfo);
}*/

class StopInfoProvider with ChangeNotifier {
  List<LaneStopInfo> busStopInfo = [];
  //List getBusinfolist() {
  //  updateData();
  // return busInfo;
  // }
  StopInfoProvider() {
    updateData();
  }
  void updateData() async {
    busStopInfo = await constructStopInfo();
    print(busStopInfo);
    notifyListeners();
  }
}
