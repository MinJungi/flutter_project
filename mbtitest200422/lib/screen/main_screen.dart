import 'package:flutter/material.dart';

import './test_screen.dart';

class MainScreen extends StatelessWidget {
  static const routename = '/main_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'MBTI',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            Text(
              '16 characteristics',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            chooseTestButton(true, context),
            chooseTestButton(false, context),
          ],
        ),
      ),
    );
  }

  Widget chooseTestButton(bool isFullTest, BuildContext context) {
    return OutlineButton(
      onPressed: (){
        Navigator.of(context).pushNamed( //pushReplaceNamed를 하면 뒤로가기 버튼을 눌러도 뒤로 안가짐. 지금은 화면 위에 새로 쌓은거라 뒤로가기 누르면처음 화면으로 돌아감
          TestScreen.routename,
          arguments: isFullTest ? true : false, //arguments라는 변수명을 가진 인자를 다른 함수쪽에 넘겨줌
        );
      },
      child: Text(isFullTest ? 'Full Test': 'Simple Test'),
    );
  }
}
