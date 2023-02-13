import 'dart:core';
import 'package:bus_hexa/loader/direction_loader.dart';
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
    // var busInfo = Provider.of<Data>(context).updateData();
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
                          child: const Text('정류소명 : 울산과학기술원',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        Consumer(builder: (BuildContext ctx,
                            StopInfoProvider model, Widget? widget) {
                          return Column(
                            children: model.busStopInfo337
                                .map((info337) => buildBusInfoBox337(info337))
                                .toList(),
                          );
                            }),
                        Consumer(builder: (BuildContext ctx,
                            StopInfoProvider model, Widget? widget) {
                          return Column(
                            children: model.busStopInfo
                                .map((info) => buildBusInfoBox(info))
                                .toList(),
                          );
                        })
                      ],
                    ),
                  ))),
        ));
  }
}

Widget buildBusInfoBox337(LaneStopInfo337 laneStopInfo337) {
  return Container(
    margin: const EdgeInsets.only(top: 50, left: 30, right: 30),
    width: 500,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: const Color.fromARGB(255, 157, 203, 225), width: 1)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildBusInfoEntry337(Colors.blue[400], true, laneStopInfo337, -1),
        buildBusInfoEntry337(Colors.white, false, laneStopInfo337, 0),
        buildBusInfoEntry337(Colors.grey[300], false, laneStopInfo337, 1)
      ],
    ),
  );
}

Widget buildBusInfoBox(LaneStopInfo laneStopInfo) {
  return Container(
    margin: const EdgeInsets.only(top: 50, left: 30, right: 30),
    width: 500,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: const Color.fromARGB(255, 157, 203, 225), width: 1)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildBusInfoEntry(Colors.blue[400], true, laneStopInfo, -1),
        buildBusInfoEntry(Colors.white, false, laneStopInfo, 0),
        buildBusInfoEntry(Colors.grey[300], false, laneStopInfo, 1)
      ],
    ),
  );
}

Widget buildBusInfoEntry337(boxcolor, title, LaneStopInfo337 laneStopInfo337, int idx) {
  if (idx >= laneStopInfo337.stopInfoList337.length) return Container();
  return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: boxcolor),
      child: Center(
          child: title == true
              ? Text(laneStopInfo337.bus
                  .busName, style: TextStyle(fontSize: 25, color: Colors.white))
              : buildBusInfoText(laneStopInfo337.stopInfoList337[idx]),
      ),
  );
}


Widget buildBusInfoEntry(boxcolor, title, LaneStopInfo laneStopInfo, int idx) {
  if (idx >= laneStopInfo.stopInfoList.length) return Container();
  return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: boxcolor),
      child: Center(
          child: title == true
              ? Text(laneStopInfo.bus
                  .busName, style: TextStyle(fontSize: 25, color: Colors.white))
              : buildBusInfoText(laneStopInfo.stopInfoList[idx]),
      ),
  );
}

// Convert stopInfo as text
Widget buildBusInfoText(StopInfo stopInfo){
  String text = "";
  if (stopInfo.stopLeft != null) {
    text = '${stopInfo.stopLeft!}역 전 (${stopInfo.nodeName})';
  }
  if (stopInfo.timeLeft != null) {
    text = '${stopInfo.timeLeft! ~/ 60}분 후 (${stopInfo.nodeName})';
  }
  if (stopInfo.departTime != null) {
    text = "${stopInfo.departTime!} 출발예정";
  }
  return Text(text, style: TextStyle(fontSize: 25, color: Colors.black));

}
