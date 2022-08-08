import 'dart:core';
import 'package:bus_hexa/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bus_hexa/provider/BusHeXAProvider.dart';

/*List<Map<String, dynamic>> busInfo =[
{'bus_no': '337(삼남신화 방면)', 
'info':[{'departure': true, 'stop_diff': null, 'min_left': 12, 'stop_point': '현대2차'}, 
{'departure': false, 'dep_time': '13:40'}]},
{'bus_no': '337(태화강역 방면)', 
'info':[{'departure': true, 'stop_diff': null, 'min_left': 8, 'stop_point': '삼남신화'}, 
{'departure': true, 'stop_diff': 21, 'min_left': null, 'stop_point': '강남초등학교'}]},
{'bus_no': '304(율리방면)', 
'info':[{'departure': false, 'dep_time': '14:30'},
 {'departure': false, 'dep_time': '16:20'}]},
{'bus_no': '304(복합웰컴센터 방면)', 
'info':[{'departure': true, 'stop_diff': null, 'min_left': 12, 'stop_point': '현대2차'}, 
{'departure': true, 'stop_diff': 36, 'min_left': null, 'stop_point': '강남초등학교'}]},
{'bus_no': '743(태화강역 방면)', 
'info':[{'departure': true, 'stop_diff': null, 'min_left': 12, 'stop_point': '현대2차'}, 
{'departure': true, 'stop_diff': 36, 'min_left': null, 'stop_point': '강남초등학교'}]},
{'bus_no': '133(꽃바위 방면)', 
'info':[{'departure': true, 'stop_diff': null, 'min_left': 12, 'stop_point': '현대2차'}, 
{'departure': true, 'stop_diff': 36, 'min_left': null, 'stop_point': '강남초등학교'}]},
{'bus_no': '733(덕하차고지 방면)', 
'info':[{'departure': true, 'stop_diff': null, 'min_left': 12, 'stop_point': '현대2차'}, 
{'departure': true, 'stop_diff': 36, 'min_left': null, 'stop_point': '강남초등학교'}]},
{'bus_no': '233(농소차고지 방면)', 
'info':[{'departure': false, 'dep_time': '14:30'},
 {'departure': false, 'dep_time': '16:20'}]}
];*/

class Directionpage extends StatefulWidget {
  const Directionpage({Key? key}) : super(key: key);

  @override
  State<Directionpage> createState() => _DirectionpageState();
}

class _DirectionpageState extends State<Directionpage> {
  final _scrollController = ScrollController();
  @override
 /*void initState() {    
    super.initState();
    
    }*/
  Widget build(BuildContext context) {
    var busInfo = Provider.of<Data>(context).updateData();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shadowColor: Colors.grey,
        title: const Text('버스 방향 기준', style: TextStyle(fontSize: 25)),
      ),
      body: Center(
        child: Scrollbar(
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
              ... Provider.of<Data>(context).busInfo.map((info) => buildBusinfo(info))
            ],
          ),
    ))),
      ));
  }
}
/*
Widget buildBusinfo(infoMap){
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
                      child: Text(infoMap['bus_no'], style: TextStyle(fontSize: 25, color: Colors.white),),
                      ),
                    ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    child:  Center(
                      child: infoMap['info'][0]['departure'] == false 
                      ? Text( infoMap['info'][0]['dep_time']+' 출발예정', style: TextStyle(fontSize: 25, color: Colors.black),)
                      : infoMap['info'][0]['stop_diff'] == null 
                        ? Text( infoMap['info'][0]['min_left'].toString()+'분 후'+'('+infoMap['info'][0]['stop_point'] +')', style: TextStyle(fontSize: 25, color: Colors.black),)
                        : Text( infoMap['info'][0]['stop_diff'].toString()+'역 전'+'('+infoMap['info'][0]['stop_point']+')'
                       ,style: TextStyle(fontSize: 25, color: Colors.black),),
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
                      child: infoMap['info'][1]['departure'] == false
                      ? Text( infoMap['info'][1]['dep_time']+' 출발예정', style: TextStyle(fontSize: 25, color: Colors.black),)
                      :infoMap['info'][1]['stop_diff'] == null
                        ? Text( infoMap['info'][1]['min_left'].toString()+'분 후'+'('+infoMap['info'][1]['stop_point']+')', style: TextStyle(fontSize: 25, color: Colors.black),)
                        :Text( infoMap['info'][1]['stop_diff'].toString()+'역 전'+'('+infoMap['info'][1]['stop_point']+')', style: TextStyle(fontSize: 25, color: Colors.black),),
                    ),
                  )
                ],
              ),);
}
*/
Widget buildBusinfo(infoMap){
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
                  buildBox(Colors.blue[400], true, infoMap),
                  buildBox(Colors.white, false, infoMap),
                  buildBox(Colors.grey[300], false, infoMap)
                ],
              ),);
}

Widget buildBox(boxcolor, title, infoMap){
  return Container(
    height: 70,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: boxcolor),
    child:  Center(
      child: title == true
      ? Text(infoMap['bus_no'], style: TextStyle(fontSize: 25, color: Colors.white))
      : infoMap['info'] == null
        ? Text( '00:00 출발예정', style: TextStyle(fontSize: 25, color: Colors.black),)
        : Text('${infoMap['info']['arrival_time']~/60}분 후 (${infoMap['info']['current_node_name']})'
        , style: TextStyle(fontSize: 25, color: Colors.black),)
      )
  );
}