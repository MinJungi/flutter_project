import 'package:flutter/material.dart';
import 'main_Component.dart';
import 'sub.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();

  static setNumEntry(int numEntry){
    _MainPageState.numEntry = numEntry;
  }

  static setSubject(String subject){
    _MainPageState.subject = subject;
  }

  static setSpyMode(bool isSpyMode){
    _MainPageState.isSpyMode = isSpyMode;
  }
}

class _MainPageState extends State<MainPage> {

  static int numEntry = 3;
  static String subject = "";
  static bool isSpyMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 150,
                width: 150,
                color: Colors.brown,
              ),
              SizedBox(height: 30,),
              Text(
                "Liar Game",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.brown),
              ),
              SizedBox(height: 30,),
              Container(
                height: 65,
                width: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("참가인원 : ",),
                    NumEntry(),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: 85,
                width: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("게임주제: "),
                    SearchButton(),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: 65,
                width: 220,
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1,
                ),
              ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("스파이 모드",),
                    SizedBox(width: 5,),
                    OnOffButton(),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Sub(numEntry, subject, isSpyMode)));
                },
                child: Container(
                  height: 50,
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Start Game", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                      Icon(Icons.forward, color: Colors.white,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
