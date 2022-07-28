import 'package:bus_hexa/model/classes.dart';
import 'package:bus_hexa/model/getAPI.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'constant.dart';


List<dynamic> laneToTracks = [];
List<dynamic> ulsanBusLaneToTracks = [];
class LinePage extends StatefulWidget {
  const LinePage({Key? key}) : super(key: key);

  @override
  State<LinePage> createState() => _LinePageState();
}
// thenstate -> api call , feature 받고 확인
class _LinePageState extends State<LinePage> {
  final List<String> numbers = ['337', '304', '743', '133', '233'];
  final List direction = [
    ['337(삼남 순환)', '337(삼남신화 방면)', '337(태화강역 방면)'],
    ['304(율리방면)', '304(복합웰컴센터 방면)'],
    ['743(태화강역 방면)', '743(울산과학기술원 방면)'],
    ['133(꽃바위 방면)', '133(울산과학기술원 방면)'],
    ['233(농소차고지 방면)', '233(농소차고지 방면)', '233(울산과학기술원 방면)']
  ];
  @override
  void initState(){
  //  getlinedata();
    Future<List<dynamic>> laneToTracks = getAPILaneToTracks(URL_LANE_TO_TRACKS);
    Future<List<dynamic>> ulsanBusLaneToTracks = getAPILaneToTracks(URL_ULSAN_BUS_LANE_TO_TRACKS);
    laneToTracks.then((value) {});
    laneToTracks.then((value) {});
    List<String> numbers;
    // for (dynamic entry in laneToTracks) {
    //   if (!this.numbers.contains(entry["route_num"]))
    //     this.numbers.add(entry["route_num"]);
    // }
    super.initState();

  }

  // void getlinedata() async {
  // //   this.laneToTracks = await getAPILaneToTracks(LaneToTracks().url);
  //   this.ulsanBusLaneToTracks = await getAPIUlsanBusLaneToTracks(UlsanBusLaneToTracks().url);
  // }

  void buildDir(context, index) async{
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              itemCount: direction[index].length,
              itemBuilder: (BuildContext context, int busNum) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color:  Color.fromARGB(255, 39, 6, 49),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      '${direction[index][busNum]}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Line Page'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: numbers.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () 
            { 
              buildDir(context, index);
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 39, 6, 49),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                '${numbers[index]}',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
