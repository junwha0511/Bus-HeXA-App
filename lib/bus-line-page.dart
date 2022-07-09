import 'package:flutter/material.dart';

class LinePage extends StatefulWidget {
  const LinePage({Key? key}) : super(key: key);

  @override
  State<LinePage> createState() => _LinePageState();
}

class _LinePageState extends State<LinePage> {
  final List<String> bus_num_list = ['337', '304', '743', '133', '233'];
  final List dir_list = [
    ['337(삼남 순환)', '337(삼남신화 방면)', '337(태화강역 방면)'],
    ['304(율리방면)', '304(복합웰컴센터 방면)'],
    ['743(태화강역 방면)', '743(울산과학기술원 방면)'],
    ['133(꽃바위 방면)', '133(울산과학기술원 방면)'],
    ['233(농소차고지 방면)', '233(농소차고지 방면)', '233(울산과학기술원 방면)']
  ];

  @override
  void ShowDirList(context, index) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              itemCount: dir_list[index].length,
              itemBuilder: (BuildContext context, int bus_num) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      '${dir_list[index][bus_num]}',
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
        itemCount: bus_num_list.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              ShowDirList(context, index);
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                '${bus_num_list[index]}',
              ),
            ),
          );
        },
      ),
    );
  }
}
