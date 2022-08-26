import 'package:bus_hexa/busTimeData.dart';
import 'package:bus_hexa/bustime.dart';
import 'package:bus_hexa/detailed_page.dart';
import 'package:bus_hexa/direction_page.dart';
import 'package:flutter/material.dart';
import 'bus_line_page.dart';
import 'detailed_page.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      home: LinePage(),
      title: 'BusHeXA-line-page',    
      );
  }
}