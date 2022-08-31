import 'package:flutter/material.dart';
import 'package:bus_hexa/busTimeData.dart';
import 'package:bus_hexa/bustime.dart';

class dpt with ChangeNotifier {
  List<Map<String, dynamic>> _busTime = [];
  void busTimeData() async {
    _busTime = await busTime();
    notifyListeners();
  }
}
