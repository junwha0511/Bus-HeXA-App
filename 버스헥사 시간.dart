import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title =
      'Bus Hexa                                     현재시각: t';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyDatable(),
      ),
    );
  }
}

class Time extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 15),
          Container(
              color: Colors.purpleAccent.shade100,
              child: Text(' 현재 시각: t', style: TextStyle(fontSize: 20.0))),
        ],
      ),
    );
  }
}

class MyDatable extends StatelessWidget {
  const MyDatable({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            '시간',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            '버스번호',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            '노선방면',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            '노선경유',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:35')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('06:05')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('06:30')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:00')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:00')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:00')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:40')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('08:20')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('09:05')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('09:35')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10:10')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10:45')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('11:25')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12:05')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12:40')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('13:10')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('13:45')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('14:20')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('14:50')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('15:25')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16:05')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16:40')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('17:20')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18:00')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18:40')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('19:10')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('19:45')),
            DataCell(Text('337')),
            DataCell(Text('삼남 순환')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:40')),
            DataCell(Text('337')),
            DataCell(Text('삼남신화 방면')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('06:20')),
            DataCell(Text('337')),
            DataCell(Text('삼남신화 방면')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('22:10')),
            DataCell(Text('337')),
            DataCell(Text('삼남신화 방면')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('22:50')),
            DataCell(Text('337')),
            DataCell(Text('삼남신화 방면')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:00')),
            DataCell(Text('337')),
            DataCell(Text('태화강역 방면 방면')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('20:20')),
            DataCell(Text('337')),
            DataCell(Text('태화강역 방면 방면')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('21:15')),
            DataCell(Text('337')),
            DataCell(Text('태화강역 방면 방면')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('22:10')),
            DataCell(Text('337')),
            DataCell(Text('태화강역 방면 방면')),
            DataCell(Text('울산터미널, 구영리, 언양터미널, KTX울산역')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:25')),
            DataCell(Text('304')),
            DataCell(Text('율리방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:20')),
            DataCell(Text('304')),
            DataCell(Text('율리방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('08:55')),
            DataCell(Text('304')),
            DataCell(Text('율리방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('09:20')),
            DataCell(Text('304')),
            DataCell(Text('율리방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('11:00')),
            DataCell(Text('304')),
            DataCell(Text('율리방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12:20')),
            DataCell(Text('304')),
            DataCell(Text('율리방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('13:00')),
            DataCell(Text('304')),
            DataCell(Text('율리방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('14:20')),
            DataCell(Text('304')),
            DataCell(Text('율리방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('15:50')),
            DataCell(Text('304')),
            DataCell(Text('율리방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16:40')),
            DataCell(Text('304')),
            DataCell(Text('율리방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18:20')),
            DataCell(Text('304')),
            DataCell(Text('율리방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('19:50')),
            DataCell(Text('304')),
            DataCell(Text('율리방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('20:30')),
            DataCell(Text('304')),
            DataCell(Text('율리방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('22:10')),
            DataCell(Text('304')),
            DataCell(Text('율리방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:50')),
            DataCell(Text('304')),
            DataCell(Text('복합웰컴센터 방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:05')),
            DataCell(Text('304')),
            DataCell(Text('복합웰컴센터 방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:40')),
            DataCell(Text('304')),
            DataCell(Text('복합웰컴센터 방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('09:20')),
            DataCell(Text('304')),
            DataCell(Text('복합웰컴센터 방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10:45')),
            DataCell(Text('304')),
            DataCell(Text('복합웰컴센터 방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('11:20')),
            DataCell(Text('304')),
            DataCell(Text('복합웰컴센터 방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12:40')),
            DataCell(Text('304')),
            DataCell(Text('복합웰컴센터 방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('14:10')),
            DataCell(Text('304')),
            DataCell(Text('복합웰컴센터 방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('15:00')),
            DataCell(Text('304')),
            DataCell(Text('복합웰컴센터 방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16:30')),
            DataCell(Text('304')),
            DataCell(Text('복합웰컴센터 방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('17:50')),
            DataCell(Text('304')),
            DataCell(Text('복합웰컴센터 방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18:50')),
            DataCell(Text('304')),
            DataCell(Text('복합웰컴센터 방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('20:30')),
            DataCell(Text('304')),
            DataCell(Text('복합웰컴센터 방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('22:00')),
            DataCell(Text('304')),
            DataCell(Text('복합웰컴센터 방면')),
            DataCell(Text('신복로터리, 언양터미널, KTX울산역, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:50')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:50')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('06:25')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:00')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:35')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('08:15')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('08:50')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('09:30')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10:10')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10:40')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('11:15')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:50')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('06:25')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:00')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:35')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('08:15')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('08:50')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('09:30')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10:10')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10:40')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('11:15')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('11:55')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12:30')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('13:10')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('13:40')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('14:15')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('15:00')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('15:30')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16:10')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16:45')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('17:30')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18:20')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18:55')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('19:40')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('20:15')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('20:55')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('21:35')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('22:20')),
            DataCell(Text('743')),
            DataCell(Text('태화강역 방면')),
            DataCell(Text('산단캠, 울산대, 공업탑, 울산터미널, 신복로터리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:00')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:15')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:30')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:45')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('06:00')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('06:15')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('06:30')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('06:45')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:00')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:35')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('08:05')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('08:35')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('09:05')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('09:25')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('09:40')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('09:55')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10:10')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10:25')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10:45')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('11:05')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('11:25')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('11:50')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12:20')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12:55')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('13:20')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('13:40')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('13:55')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('14:10')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('14:30')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('14:45')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('15:05')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('15:25')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('15:45')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16:15')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16:50')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('17:25')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18:00')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18:30')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18:50')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('19:15')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('19:35')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('19:55')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('20:15')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('20:35')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('20:55')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('21:25')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('22:00')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('22:40')),
            DataCell(Text('133')),
            DataCell(Text('꽃바위 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:40')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:40')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('06:10')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('06:50')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:20')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:50')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('08:30')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('09:00')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('09:30')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10:10')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10:40')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('11:10')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12:00')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12:50')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('13:30')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('14:00')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('14:40')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('15:40')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16:30')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('17:10')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('17:40')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18:20')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('19:30')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('20:10')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('20:40')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('21:10')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('21:40')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('23:00')),
            DataCell(Text('733')),
            DataCell(Text('덕하차고지 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:00')),
            DataCell(Text('233')),
            DataCell(Text('농소차고지 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:55')),
            DataCell(Text('233')),
            DataCell(Text('농소차고지 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('06:50')),
            DataCell(Text('233')),
            DataCell(Text('농소차고지 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:45')),
            DataCell(Text('233')),
            DataCell(Text('농소차고지 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('08:40')),
            DataCell(Text('233')),
            DataCell(Text('농소차고지 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('09:35')),
            DataCell(Text('233')),
            DataCell(Text('농소차고지 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10:30')),
            DataCell(Text('233')),
            DataCell(Text('농소차고지 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('11:25')),
            DataCell(Text('233')),
            DataCell(Text('농소차고지 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12:20')),
            DataCell(Text('233')),
            DataCell(Text('농소차고지 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('13:15')),
            DataCell(Text('233')),
            DataCell(Text('농소차고지 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('14:10')),
            DataCell(Text('233')),
            DataCell(Text('농소차고지 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('15:05')),
            DataCell(Text('233')),
            DataCell(Text('농소차고지 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16:00')),
            DataCell(Text('233')),
            DataCell(Text('농소차고지 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16:55')),
            DataCell(Text('233')),
            DataCell(Text('농소차고지 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('17:50')),
            DataCell(Text('233')),
            DataCell(Text('농소차고지 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18:45')),
            DataCell(Text('233')),
            DataCell(Text('농소차고지 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('19:40')),
            DataCell(Text('233')),
            DataCell(Text('농소차고지 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('20:35')),
            DataCell(Text('233')),
            DataCell(Text('농소차고지 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('22:40')),
            DataCell(Text('233')),
            DataCell(Text('농소차고지 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:45')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('06:20')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('06:55')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:25')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('08:05')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('08:50')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('09:20')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10:05')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10:35')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('11:10')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('11:50')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12:20')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12:55')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('13:40')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('14:10')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('14:50')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('15:20')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16:00')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16:50')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('17:20')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18:00')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18:35')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('19:20')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('20:15')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('20:50')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('21:30')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('22:05')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('22:35')),
            DataCell(Text('743')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:20')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:50')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('06:10')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('06:35')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('06:55')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:15')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:35')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:50')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('08:05')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('08:20')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('08:40')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('09:00')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('09:20')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('09:50')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10:20')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10:55')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('11:25')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('11:45')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12:00')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12:15')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12:30')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12:45')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('13:05')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('13:25')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('13:40')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('14:05')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('14:35')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('15:10')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('15:45')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16:15')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16:30')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16:45')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('17:00')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('17:20')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('17:45')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18:15')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18:45')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('19:15')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('19:50')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('20:30')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('20:50')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('21:10')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('21:30')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('21:50')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('22:10')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('22:25')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('22:40')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('22:55')),
            DataCell(Text('133')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('울산터미널, 구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('05:40')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('06:00')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('06:40')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:20')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('07:50')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('08:30')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('09:00')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('09:30')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10:20')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10:40')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('11:10')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('11:50')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12:20')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12:50')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('13:50')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('14:40')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('15:20')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('15:50')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16:30')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('17:30')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18:20')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('19:00')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('19:40')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('20:10')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('21:20')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('21:30')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('22:00')),
            DataCell(Text('733')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('공업탑, 구영리, 신복로터리, 울산대')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('21:15')),
            DataCell(Text('233')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('22:20')),
            DataCell(Text('233')),
            DataCell(Text('울산과학기술원 방면')),
            DataCell(Text('구영리')),
          ],
        ),
      ],
    );
  }
}
