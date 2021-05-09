import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'data.dart';

class Sub extends StatelessWidget {
  static int entryNum;
  static String subject;
  static bool isSpyMode;

  Sub(int num, String s, bool spy) {
    entryNum = num;
    subject = s;
    isSpyMode = spy;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "게임 주제 ",
                ),
                Text(
                  "$subject",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            CheckWord(),
          ],
        ),
      ),
    );
  }
}

class CheckWord extends StatefulWidget {
  @override
  _CheckWordState createState() => _CheckWordState();
}

class _CheckWordState extends State<CheckWord> {
  String word =
      subjectMap[Sub.subject][Random().nextInt(subjectMap[Sub.subject].length)];
  bool isHide = true;
  int liar = Random().nextInt(Sub.entryNum) + 1;
  int spy = 0;
  int currentNum = 1;

  @override
  void initState() {
    if (Sub.isSpyMode) {
      spy = Random().nextInt(Sub.entryNum - 1);
      if (spy >= liar) {
        spy += 1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return currentNum > Sub.entryNum
        ? Container(
            child: Text("게임을 시작하세요"),
          )
        : isHide ? hideContainer() : checkSubject();
  }

  Widget hideContainer() {
    return GestureDetector(
      onTap: (){
        setState(() {
          isHide = !isHide;
        });
      },
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "$currentNum 번 ",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                  Text("순서가 제시어를 확인할 차례입니다.", style: TextStyle(fontSize: 20),),
                ],
              ),
              Text("제시어 확인하기"),
            ],
          ),
        ),
      ),
    );
  }

  Widget checkSubject() {
    Timer(Duration(seconds: 3), () {
      setState(() {
        isHide = !isHide;
        currentNum++;
      });
    });
    return Container(
      width: double.infinity,
      height: 100,
      child: currentNum == liar
          ? Center(child: Text("라이어 당첨", style: TextStyle(fontSize: 20),))
          : currentNum == spy
              ? Center(child: Text("스파이 당첨, 제시어는 $word 입니다.", style: TextStyle(fontSize: 20),))
              : Center(child: Text("제시어는 $word 입니다.", style: TextStyle(fontSize: 20),)),
    );
  }
}
