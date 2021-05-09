import 'package:flutter/material.dart';
import './screen/result_screen.dart';

class Test extends StatefulWidget {
  final List<Map<String, Object>> questions;
  final bool isFullTest;

  Test(this.questions, this.isFullTest);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  int index = 0;
  var score = [
    [0,0],
    [0,0],
    [0,0],
    [0,0]
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.questions[index]['question'],
          ),
          OutlineButton(
            onPressed: () {
              score[widget.questions[index]['type']][0]++;

              setState(() {
                if (index < widget.questions.length - 1)
                  index++;
                else {
                  Navigator.of(context).pushNamed(
                    ResultScreen.routename,
                    arguments: score
                  );
                }
              });
            },
            child: Text(widget.questions[index]['answer1']),
            /*
            child: Container(
              width : 400,
              height : 30,
              
              child : Center(
                child: Text(widget.questions[index]['answer1']),
                ),
              decoration: BoxDecoration(
                color : Colors.grey[300],
              ),
            ),*/
          ),
          OutlineButton(
              onPressed: () {
                score[widget.questions[index]['type']][1]++;
                setState(() {
                  if (index < widget.questions.length - 1)
                    index++;
                  else {
                    Navigator.of(context).pushNamed(
                      ResultScreen.routename,
                      arguments: score
                    );
                  }
                });
              },
              child: Text(widget.questions[index]['answer2'])
          ),
        ],
      ),
    );
  }
}
