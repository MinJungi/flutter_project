import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  static const routename = '/result_screen';
  static const characterList = [
    ['E', 'I'],
    ['S', 'N'],
    ['T', 'F'],
    ['J', 'P']
  ];

  @override
  Widget build(BuildContext context) {
    List<List<int>> score = ModalRoute.of(context).settings.arguments;
    String result = getResult(score);

    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(result),
            characterBar(score[0], context, 0),
            characterBar(score[1], context, 1),
            characterBar(score[2], context, 2),
            characterBar(score[3], context, 3),
          ],
        )
      ),
    );
  }

  String getResult(List<List<int>> score){
    var result = '';

    for(int i = 0;i<4;i++){
      result += (score[i][0] > score[i][1])
              ? characterList[i][0]
              : characterList[i][1];
    }
    return result;
  }

  Widget characterBar(List<int> score, context, int index){
    var ratio = score[0] / (score[0]+score[1]);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(characterList[index][0],),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width-100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [
                  ratio - 0.05,
                  ratio + 0.05
                ],
                colors: [
                  Colors.red,
                  Colors.yellow,
                ]
              ),
            ),
          ),
          Text(characterList[index][1]),
        ],
      ),
    );
  }
}