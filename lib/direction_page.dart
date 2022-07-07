import 'package:flutter/material.dart';

class Directionpage extends StatefulWidget {
  const Directionpage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<Directionpage> createState() => _DirectionpageState();
}

class _DirectionpageState extends State<Directionpage> {
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shadowColor: Colors.grey,
        title: const Text('버스 방향 기준', style: TextStyle(fontSize: 25)),
      ),
      body: Scrollbar(
        controller: _scrollController,
        radius: Radius.circular(10),
        thickness: 10,
        child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              height: 50,
              width: double.infinity,
              color: const Color.fromARGB(255, 0, 86, 157),
              child: const Text('정류소명 : 울산과학기술원', style: TextStyle(
                fontSize: 20, color: Colors.white)),
            ),
            returnWidget(),
            returnWidget(),
            returnWidget(),
            returnWidget(),
            returnWidget(),
            returnWidget(),
            returnWidget()
          ],
        ),
    ))));
  }
}
Widget returnWidget(){
  return Container(
              margin: const EdgeInsets.only(top: 50, left: 30, right: 30),
              height: 212,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color.fromARGB(255, 157, 203, 225), width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[400]),
                    child: const Center(
                      child: Text('a', style: TextStyle(fontSize: 30, color: Colors.white),),
                      ),
                    ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    child: const Center(
                      child: Text('b',style: TextStyle(fontSize: 30, color: Colors.black),),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300]
                    ),
                    child: const Center(
                      child: Text('c', style: TextStyle(fontSize: 30, color: Colors.black)),
                    ),
                  )
                ],
              ),);
} 