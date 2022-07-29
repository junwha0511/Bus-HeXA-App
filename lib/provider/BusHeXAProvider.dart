import 'package:flutter/material.dart';
import 'package:bus_hexa/loader/directionmodel.dart';
import 'package:bus_hexa/direction_page.dart';

/*Future<List<dynamic>> getBusinfo() async{
List<Map<String, dynamic>> busInfo = [];
 return Future.delayed(Duration(), () => busInfo);
}*/


class Data with ChangeNotifier{
  List busInfo = [];
  List getBusinfolist() {
    updateData();
    return busInfo;
  }
  void updateData() async {
    busInfo = await inputData();
    notifyListeners();
  }
}