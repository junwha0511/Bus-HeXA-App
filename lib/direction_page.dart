import 'dart:core';
import 'package:bus_hexa/main.dart';
import 'package:flutter/material.dart';

final Map<String, dynamic> busInfo ={'337(삼남신화 방면)':[{'min': 12, 'text': '현대2차'}, {'before': 37, 'text': '농수산'}], 
  '337(태화강역 방면)':[{'min': 8, 'text': '현대2차'}, {'before': 15, 'text': '농수산'}], 
  '304(율리방면)':[{'min': 12, 'text': '현대2차'}, {'before': 37, 'text': '농수산'}], 
  '304(복합웰컴센터 방면)':[{'min': 12, 'text': '현대2차'}, {'before': 37, 'text': '농수산'}], 
  '743(태화강역 방면)':[{'min': 12, 'text': '현대2차'}, {'before': 37, 'text': '농수산'}], 
  '133(꽃바위 방면)':[{'min': 12, 'text': '현대2차'}, {'before': 37, 'text': '농수산'}], 
  '733(덕하차고지 방면)':[{'min': 12, 'text': '현대2차'}, {'before': 37, 'text': '농수산'}], 
  '233(농소차고지 방면)':[{'min': 12, 'text': '현대2차'}, {'before': 37, 'text': '농수산'}]};
final busNo = busInfo.keys.toList();
final arrivalInfo = busInfo.values.toList();
class Directionpage extends StatefulWidget {
  const Directionpage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<Directionpage> createState() => _DirectionpageState();
}

class _DirectionpageState extends State<Directionpage> {
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shadowColor: Colors.grey,
        title: const Text('버스 방향 기준', style: TextStyle(fontSize: 25)),
      ),
      body: Scrollbar(
        controller: _scrollController,
        radius: const Radius.circular(10),
        thickness: 10,
        child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              height: 50,
              width: double.infinity,
              color: const Color.fromARGB(255, 0, 86, 157),
              child: const Text('정류소명 : 울산과학기술원', style: TextStyle(
                fontSize: 20, color: Colors.white)),
            ),
            for(var i = 0; i < busNo.length; i++)
              buildBusinfo(i)
          ],
        ),
    ))));
  }
}

Widget buildBusinfo(index){
  return Container(
              margin: const EdgeInsets.only(top: 50, left: 30, right: 30),
              height: 212,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color.fromARGB(255, 157, 203, 225), width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[400]),
                    child:  Center(
                      child: Text(busNo[index], style: TextStyle(fontSize: 25, color: Colors.white),),
                      ),
                    ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    child:  Center(
                      child: Text(arrivalInfo[index][0]['min'].toString()+'분 후'+'('+arrivalInfo[index][0]['text']+')'
                      ,textAlign: TextAlign.left ,style: TextStyle(fontSize: 25, color: Colors.black),),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300]
                    ),
                    child:  Center(
                      child: Text(arrivalInfo[index][1]['before'].toString()+'역 전'+'('+arrivalInfo[index][1]['text']+')', 
                      textAlign: TextAlign.left , style: TextStyle(fontSize: 25, color: Colors.black)),
                    ),
                  )
                ],
              ),);
} 
