import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<List<int>> makeCalendar(int days, int start){ //days는 한달 날짜 수, start는 시작 요일(일요일=0, 월요일=1, ...토요일=6)
    int today = 1;
    List<List<int>> dates = new List.generate(6, (i) => []);

    for(int i = 0; i<6;i++){
      for(int j = 0;j<7;j++){
        if(i==0){
          if(j<start) dates[i].add(0);
          else {
            dates[i].add(today);
            today++;
          }
        }
        else if(today > days){
          if(i==6) break;
          dates[i].add(0);
        }
        else{
          dates[i].add(today);
          today++;
        }
      }
    }
    return dates;
  }

  Widget calendarBox(int date){
    bool check1 = true;
    bool check2 = false;
    bool check3 = false;

    if(date == 0){
      return Container(
        width: 50,
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(),
        ),
      );
    }
    else {
      return Container(
        width: 50,
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Column(
          children: <Widget>[
            Text(
              date != 0 ? date.toString() : '',
              style: TextStyle(fontSize: 15),
            ),
            Row(
              children: <Widget>[
                Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                      child: check1 ? Icon(Icons.check, size: 12,) : Icon(
                        Icons.block, size: 12,),)
                )
              ],
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(makeCalendar(31, 3));
    List<List<int>> calendar = makeCalendar(31, 3);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(6, (i) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(7, (j) => calendarBox(calendar[i][j])),
          )),
        ),
      ),
    );
  }
}
