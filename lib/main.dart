import 'package:bus_hexa/detailed_page.dart';
import 'package:bus_hexa/direction_page.dart';
import 'package:bus_hexa/provider/BusHeXAProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bus_line_page.dart';
import 'detailed_page.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      title: 'BusHeXA Directionpage',
      home: ChangeNotifierProvider<Data>(
        create: (context) => Data(),
        child: Directionpage())  
      );
  }
}