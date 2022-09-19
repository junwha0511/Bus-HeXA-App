import 'package:path/path.dart' as Path;
import 'package:flutter/material.dart';
import 'package:bus_hexa/busTimeData.dart';
import 'package:bus_hexa/provider/busTimeProvider.dart';

class BusTime extends StatefulWidget {
  const BusTime({Key? key}) : super(key: key);

  @override
  State<BusTime> createState() => _BusTimeState();
}

class _BusTimeState extends State<BusTime> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     var _bus = Provider.of<dpt>(context, listen: false);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'busDeparatureTime',
      debugShowCheckedModeBanner: false,
      builder: (context, childWidget) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: childWidget!);
      },
      home: DepartureTimePage(),
    );
  }
}

class DepartureTimePage extends StatefulWidget {
  const DepartureTimePage({Key? key}) : super(key: key);
  @override
  State<DepartureTimePage> createState() => _DepartureTimePageState();
}

class _DepartureTimePageState extends State<DepartureTimePage> {
  var newList = new List.empty(growable: true);
  TimeOfDay time = TimeOfDay(hour: 00, minute: 00);
  // TimeOfDay time = TimeOfDay.now();

  @override
  // var _busTime = Provider.of<dpt>(context).Data();
 List<Map<String, String>> _busTime = [
    {
      'bus': '337(삼남순환)',
      'hour': '05',
      'min': '35',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'bus': '337(삼남순환)',
      'hour': '06',
      'min': '05',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'bus': '337(삼남순환)',
      'hour': '06',
      'min': '30',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'bus': '304(율리방면)',
      'hour': '07',
      'min': '40',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'bus': '304(율리방면)',
      'hour': '08',
      'min': '20',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'bus': '304(율리방면)',
      'hour': '09',
      'min': '05',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
    {
      'bus': '304(율리방면)',
      'hour': '09',
      'min': '35',
      'route': '울산터미널, 구영리, 언양터미널, KTX울산역'
    },
  ];

  Widget build(BuildContext context) {
    for (var i = 0; i < _busTime.length; i++) {
      TimeOfDay listTime = TimeOfDay(
          hour: int.parse(_busTime[i]['hour']),
          minute: int.parse(_busTime[i]['min']));
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
