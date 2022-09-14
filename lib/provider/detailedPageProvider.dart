import 'package:flutter/material.dart';
import 'package:bus_hexa/detailedPageData.dart';
import 'package:bus_hexa/detailed_page.dart';

class DetailPageProvider with ChangeNotifier {
  List<Map<String, dynamic>> detail = [];
  void Data() async {
    detail = await detailedPageData();
    notifyListeners();
  }
}
