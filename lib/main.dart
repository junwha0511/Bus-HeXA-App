import 'package:flutter/material.dart';
import 'bus-line-page.dart';

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