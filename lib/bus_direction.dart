import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(BusTime());

class BusTime extends StatefulWidget {
  @override
  _BusTimeState createState() => _BusTimeState();
}

class _BusTimeState extends State<BusTime> {
  List<Map> _busTime = [
    {
      'hour': 05,
      'minute': 35,
      'time':'05:35',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 06,
      'minute': 05,
      'time':'06:05',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 06,
      'minute': 30,
      'time':'06:30',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 07,
      'minute': 00,
      'time':'07:00',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 07,
      'minute': 40,
      'time':'07:40',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 08,
      'minute': 20,
      'time':'08:20',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 09,
      'minute': 05,
      'time':'09:05',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 09,
      'minute': 35,
      'time':'09:35',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 10,
      'minute': 10,
      'time':'10:10',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 10,
      'minute': 45,
      'time':'10:45',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 11,
      'minute': 25,
      'time':'11:25',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 12,
      'minute': 05,
      'time':'12:05',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 12,
      'minute': 40,
      'time':'12:40',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
  ];

TimeOfDay time = TimeOfDay(hour: 00, minute: 00);

void _showTimePicker(){
  showTimePicker(context: context,
   initialTime: time).then((value) {
    setState(() {
      time=value!;
    });
   });
}

  @override
  Widget build(BuildContext context) {
 
  
var splitTime = [];
var timeOfBusTime = [];
var hourOfTime = new List.empty(growable: true);
var minuteOfTime = new List.empty(growable: true);

for (var i =0; i<_busTime.length; i++) {
  splitTime = _busTime[i]['time'].split(':');
  hourOfTime.add(splitTime[0]);
  minuteOfTime.add(splitTime[1]);
  splitTime=[];
}

var newList = new List.empty(growable: true);

for (var i =0; i<_busTime.length; i++) {
  if(hourOfTime[i] >= time.hour){
    if(minuteOfTime[i]>=time.minute){
      newList.add(_busTime[i]);
    }
  };
}

    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text('버스출발시간 기준'),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Container(
                      height: 40,
                      width: 5,
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      decoration: BoxDecoration(color: Colors.purple[700]),
                    ),
                    Expanded(child: Container(
                      height: 40,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(color: Colors.purpleAccent.withOpacity(0.1)),
                      child: Row(
                        children: [
                          Text(
                        '현재 시각: ${time.hour.toString().padLeft(2,'0')}:${time.minute.toString().padLeft(2, '0')} '
                      ),
                      const SizedBox( width: 5,),
                     TextButton(child: Text('시간 선택'),
                     onPressed:(){
                      showDialog(context: context,
                      barrierDismissible: true,
                       builder: (BuildContext context){
                        return AlertDialog(
                          content: Row(children: [
                            Text('hi')
                          ],),
                          actions: [
                            TextButton(child: const Text('확인'),
                            onPressed: (){
                              Navigator.of(context).pop();
                            },)
                          ],
                        );
                       });
                     })
                        ],
                      )
                    ),
                    ),
              ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: _createDataTable(),
                )
              ),
              
                ],
              ),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('시간')),
      DataColumn(label: Text('버스번호')),
      DataColumn(label: Text('노선방면')),
      DataColumn(label: Text('노선경유'))
    ];
  }

  List<DataRow> _createRows() {
    return _busTime.map((newList) => DataRow(cells: [
          DataCell(Text('${newList['hour'].toString().padLeft(2,'0')}:${newList['minute'].toString().padLeft(2,'0')}')),
          DataCell(Text(newList['busnumber'])),
          DataCell(Text(newList['busdiretion'])),
          DataCell(Text(newList['route'])),
        ])).toList();
  }

}