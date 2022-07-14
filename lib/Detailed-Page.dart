import 'package:flutter/material.dart';

class detailedPage extends StatefulWidget {
  const detailedPage({ Key? key }) : super(key: key);

  @override
  State<detailedPage> createState() => _detailedPageState();
}

class _detailedPageState extends State<detailedPage> {
  final List _routeList = [
    ['337(삼남 순환)', '337(삼남신화 방면)', '337(태화강역 방면)'],
    ['304(율리방면)', '304(복합웰컴센터 방면)'],
    ['743(태화강역 방면)', '743(울산과학기술원 방면)'],
    ['133(꽃바위 방면)', '133(울산과학기술원 방면)'],
    ['233(농소차고지 방면)', '233(농소차고지 방면)', '233(울산과학기술원 방면)']
  ];

  final List _mainStation = [
    'KTX울산역, 구영리, 언양터미널, 울산터미널',
    'KTX울산역, 신복로터리, 언양터미널, 울산대',
    '공업탑, 산단캠, 신복로터리, 울산대, 울산터미널',
    '구영리, 울산터미널',
    '공업탑, 구영리, 신복로터리, 울산대',
    '구영리'
  ];

  List _timeTable = [
    [['05:35','06:05','06:30'],[''],['']],
    [[''],['']],
    [[''],['']],
    [[''],['']],
    [[''],['']],
    [[''],[''],['']]];


   List <dynamic>_busLine = ['삼남신화','마산','웃마산','마산입구'];
  
  int idx = 0;
  int bus_num=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상세페이지'),
      ),
      body: SafeArea(
        child: Center(
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
                    child: Text('노선명: ${_routeList[idx][bus_num]}'),
                  ),
                  ),
            ],
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.black12),
              ),
              child: Text('주요역: ${_mainStation[idx]}')
            ),
            ExpansionTile(
              title: const Text('시간표'),
              children: <Widget>[
                ListTile(title: Text('${_timeTable[idx][bus_num].join('   ')}'))
                ],
                ), 
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(color: Colors.black12),
              ),
              child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith((states)=>Colors.blue),
                columns:[
              DataColumn(label: Text('0')),
              DataColumn(label: Text('노선')),
              DataColumn(label: Text('운행중')),
            ], 
             rows: List<DataRow>.generate(_busLine.length,
              (index) => DataRow(
                color: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (index % 2 == 0)
                                return Colors.transparent;
                              return  Colors.blueAccent.withOpacity(0.1);
                            }),
                           cells: [
                              DataCell(Text((index+1).toString())),
                              DataCell(Text(_busLine[index].toString())),
                              DataCell(Text(''))
                           ].toList(),
                    ),
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}