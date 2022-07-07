import 'dart:html';
import 'package:flutter/material.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({ Key? key }) : super(key: key);

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  final List<String> _RouteList = ['337(삼남 순환)'];
  final List<String> _MainStation = ['KTX울산역, 구영리, 언양터미널, 울산터미널'];
  final List<String> _TimeTable = ['05:50'];

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
                    child: Text('노선명: '+ _RouteList[0]),
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
              child: Text('주요역: '+ _MainStation[0]),
            ),
            ExpansionTile(
              title: const Text('시간표'),
              children: <Widget>[
                ListTile(title: Text(_TimeTable[0]),)
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
                dataRowColor: MaterialStateColor.resolveWith((states) => Colors.blueAccent.withOpacity(0.1)),
                columns:[
              DataColumn(label: Text('0')),
              DataColumn(label: Text('노선')),
              DataColumn(label: Text('운행중')),
            ], 
             rows: [
              DataRow(cells: [
                DataCell(Text('node_order')),
                DataCell(Text('node_name')),
                DataCell(Text(''))
              ]),
            ])
              ),
            ]
          )
        )
      )
    );
  }
}