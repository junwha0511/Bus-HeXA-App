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
    {'bus': '337(삼남순환)', 'time': '0535', 'route': '울산터미널, 구영리, 언양터미널, KTX울산역'},
    {'bus': '337(삼남순환)', 'time': '0605', 'route': '울산터미널, 구영리, 언양터미널, KTX울산역'},
    {'bus': '337(삼남순환)', 'time': '0630', 'route': '울산터미널, 구영리, 언양터미널, KTX울산역'},
    {
      'bus': '337(태화강역방면)',
      'time': '0700',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {'bus': '304(율리방면)', 'time': '0740', 'route': '울산터미널, 구영리, 언양터미널, KTX울산역'},
    {'bus': '304(율리방면)', 'time': '0820', 'route': '울산터미널, 구영리, 언양터미널, KTX울산역'},
    {'bus': '304(율리방면)', 'time': '0905', 'route': '울산터미널, 구영리, 언양터미널, KTX울산역'},
    {'bus': '304(율리방면)', 'time': '0935', 'route': '울산터미널, 구영리, 언양터미널, KTX울산역'},
    {
      'bus': '304(복합웰컴센터방면)',
      'time': '1010',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'bus': '304(복합웰컴센터방면)',
      'time': '1045',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'bus': '304(복합웰컴센터방면)',
      'time': '1125',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'bus': '304(복합웰컴센터방면)',
      'time': '1205',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'bus': '304(복합웰컴센터방면)',
      'time': '1240',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
  ];

  var newList = new List.empty(growable: true);
  TimeOfDay time = TimeOfDay(hour: 00, minute: 00);

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < _busTime.length; i++) {
      TimeOfDay listTime = TimeOfDay(
          hour: int.parse(_busTime[i]['time'].substring(0, 2)),
          minute: int.parse(_busTime[i]['time'].substring(2)));
      if (listTime.hour > time.hour) {
        newList.add(_busTime[i]);
      } else if (listTime.hour == time.hour) {
        if (listTime.minute >= time.minute) {
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
                                    newList = [];
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
                  '${newList['time'].substring(0, 2).toString().padLeft(2, '0')}:${newList['time'].substring(2).toString().padLeft(2, '0')}')),
              DataCell(Text(newList['bus'].split("(")[0])),
              DataCell(Text(newList['bus'].split("(")[1].split(")")[0])),
              DataCell(Text(newList['route'])),
            ]))
        .toList();
  }
}
