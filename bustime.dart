import 'package:flutter/material.dart';

void main() => runApp(BusTime());

class BusTime extends StatefulWidget {
  @override
  _BusTimeState createState() => _BusTimeState();
}

class _BusTimeState extends State<BusTime> {
  List<Map> _Bustime = [
    {
      'time': '05:35',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'time': '06:05',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'time': '06:30',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'time': '07:00',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'time': '07:40',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'time': '08:20',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'time': '09:05',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'time': '09:35',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'time': '10:10',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'time': '10:45',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'time': '11:25',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'time': '12:05',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'time': '12:40',
      'busnumber': '337',
      'busdiretion': '삼남 순환',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('버스출발시간 기준                         현재시각: t'),
        ),
        body: ListView(
          children: [_createDataTable()],
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
    return _Bustime.map((bustime) => DataRow(cells: [
          DataCell(Text(bustime['time'])),
          DataCell(Text(bustime['busnumber'])),
          DataCell(Text(bustime['busdiretion'])),
          DataCell(Text(bustime['route'])),
        ])).toList();
  }
}
