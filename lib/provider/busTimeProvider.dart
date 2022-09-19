import 'package:flutter/material.dart';
import 'package:bus_hexa/busTimeData.dart';
import 'package:bus_hexa/bustime.dart';

class DepartureProvider with ChangeNotifier {
  List<busDepartTime> _busTime = [];
  DepartureProvider() {
    updateData();
  }
  void updateData() async {
    _busTime = await busTime();
    notifyListeners();
  }
}
