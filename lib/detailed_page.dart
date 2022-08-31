import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bus_hexa/detailedPageData.dart';
import 'package:bus_hexa/provider/detailedPageProvider.dart';

class detailedPage extends StatefulWidget {
  const detailedPage({Key? key}) : super(key: key);

  @override
  State<detailedPage> createState() => _detailedPageState();
}

class _detailedPageState extends State<detailedPage> {
  @override
  final List<Map<String, dynamic>> detail = [
    {
      "bus": "337(삼남순환)",
      "mainStation": 'KTX울산역, 구영리, 언양터미널, 울산터미널',
      "departTime": ['05:35', '06:05', '06:30'],
      "node_orders":[1,2,3,4,5,6,7],
      "node_names": ['삼남신화', '마산', '웃마산', '마산입구', '벌장', '메가마트', '작천정입구'],
      "poseOfBuses": ['', '', '', '', '', '', "71자2763"]
    }
  ];
  int idx = 0;

//  @override
//  void initState() {
//    super.initState();
//    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//      final det = Provider.of<detailPage>(context, listen: false);
//    });
//  }

  Widget build(BuildContext context) {
// var detail = Provider.of<detailPage>(context).Data();
    return Scaffold(
        appBar: AppBar(
          title: Text('상세페이지'),
        ),
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
          child: Column(children: <Widget>[
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
                    child: Text('노선명: ${detail[idx]["bus"]}'),
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
                child: Text('주요역: ${detail[idx]["mainStation"]}')),
            ExpansionTile(
              title: const Text('시간표'),
              children: <Widget>[
                ListTile(title: Text('${detail[idx]["departTime"].join('  ')}'))
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
                    headingRowColor:
                        MaterialStateColor.resolveWith((states) => Colors.blue),
                    columns: [
                      DataColumn(
                          label:
                              Text('0', style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('노선',
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('운행중',
                              style: TextStyle(color: Colors.white))),
                    ],
                    rows: List<DataRow>.generate(
                      detail[idx]["node_names"].length,
                      (index) => DataRow(
                        color: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (index % 2 == 0) return Colors.transparent;
                          return Colors.blueAccent.withOpacity(0.1);
                        }),
                        cells: [
                          DataCell(Text(detail[idx]["node_orders"][index].toString())),
                          DataCell(Text(detail[idx]["node_names"][index])),
                          DataCell(Text(
                              detail[idx]["poseOfBuses"][index].toString()))
                        ].toList(),
                      ),
                    )))
          ]),
        ))));
  }
}
