import 'dart:async';
import 'dart:developer';
import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(BusTime());

class BusTime extends StatefulWidget {
  const BusTime({Key? key}) : super(key: key);

  @override
  State<BusTime> createState() => _BusTimeState();
}

class _BusTimeState extends State<BusTime> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'busDeparatureTime',
      home: deparatureTime(),
      debugShowCheckedModeBanner: false,
      builder: (context, childWidget) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: childWidget!);
      },
    );
  }
}

class deparatureTime extends StatefulWidget {
  const deparatureTime({Key? key}) : super(key: key);

  @override
  State<deparatureTime> createState() => _deparatureTimeState();
}

class _deparatureTimeState extends State<deparatureTime> {
  List<Map> _busTime = [
    {
      'hour': 05,
      'minute': 35,
      'time': '05:35',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 06,
      'minute': 05,
      'time': '06:05',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 06,
      'minute': 30,
      'time': '06:30',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 07,
      'minute': 00,
      'time': '07:00',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 07,
      'minute': 40,
      'time': '07:40',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 08,
      'minute': 20,
      'time': '08:20',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 09,
      'minute': 05,
      'time': '09:05',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 09,
      'minute': 35,
      'time': '09:35',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 10,
      'minute': 10,
      'time': '10:10',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 10,
      'minute': 45,
      'time': '10:45',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 11,
      'minute': 25,
      'time': '11:25',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 12,
      'minute': 05,
      'time': '12:05',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'hour': 12,
      'minute': 40,
      'time': '12:40',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
  ];

  var newList = new List.empty(growable: true);
  TimeOfDay time = TimeOfDay(hour: 00, minute: 00);

  void _showTimePicker() {
    showTimePicker(context: context, initialTime: time).then((value) {
      setState(() {
        time = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < _busTime.length; i++) {
      if (_busTime[i]['hour'] >= time.hour) {
        if (_busTime[i]['minute'] >= time.minute) {
          newList.add(_busTime[i]);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('버스출발시간 기준'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  Expanded(
                    child: Container(
                        height: 40,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.purpleAccent.withOpacity(0.1)),
                        child: Row(
                          children: [
                            Text(
                                '현재 시각: ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} '),
                            const SizedBox(
                              width: 5,
                            ),
                            OutlinedButton(
                              child: Text('시간 선택'),
                              onPressed: () {
                                showTimePicker(
                                        context: context, initialTime: time)
                                    .then((value) {
                                  setState(() {
                                    time = value!;
                                  });
                                });
                              },
                              style:
                                  TextButton.styleFrom(primary: Colors.black),
                            )
                          ],
                        )),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(child: _createDataTable()),
              ),
            ],
          ),
        ),
      ),
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
    return newList
        .map((newList) => DataRow(cells: [
              DataCell(Text(
                  '${newList['hour'].toString().padLeft(2, '0')}:${newList['minute'].toString().padLeft(2, '0')}')),
              DataCell(Text(newList['busnumber'])),
              DataCell(Text(newList['busdiretion'])),
              DataCell(Text(newList['route'])),
            ]))
        .toList();
  }
}
