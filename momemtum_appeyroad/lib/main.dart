import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Momentum',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        )
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Background(
        imagePath: 'image/background001.jpg',
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Links(),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Weather(),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Todo(),
              ),
              Align(
                alignment: Alignment.center,
                child: Clock(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Quote(),
              ),
              Align(
                alignment: FractionalOffset(0.5, 0.8),
                child : Focus(),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Setting(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {

  final Widget child;
  final String imagePath;

  Background({this.child, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}


class Focus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("What is your main focus for today?", style: TextStyle(fontSize: 30),),
          TextField(
            enabled: false,
            decoration: InputDecoration(
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}


class Quote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('"Always walk through life as if you have something new to learn nad you will."');
  }
}

/*
class Clock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("17:30", style: TextStyle(fontSize: 150),);
  }
}
*/

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {

  String _timeString;
  Timer _timer;
  
  @override
  void initState() {
    _timeString = _formatDateTime( DateTime.now() );
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    //Timer.periodic(duration, (timer) { })
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  String _formatDateTime(DateTime dateTime){
    return DateFormat('HH:mm').format(dateTime);
  }

  void _getTime(){
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState((){
      _timeString = formattedDateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_timeString, style: TextStyle(fontSize: 150),);
  }
}


class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Todo");
  }
}

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _settingVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            AnimatedOpacity(
              opacity: _settingVisible?1:0,
              duration: Duration(milliseconds: 200),
              child: Visibility(
                visible: _settingVisible,
                child: settingContainer(),
              ),
            ),
          ],
        ),
        Row(
          //mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: (){
                setState(() {
                  _settingVisible = !_settingVisible;
                });
              },
              icon: Icon(Icons.settings, color: Colors.white,),
            ),
            //Expanded(child: Container())
          ],
        ),
      ],
    );
  }
}

class settingContainer extends StatefulWidget {
  @override
  _settingContainerState createState() => _settingContainerState();
}

class _settingContainerState extends State<settingContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 1000,
      color: Colors.green,
      child: Icon(Icons.cloud, color:Colors.white, size: 50),
    );
  }
}

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Icon(Icons.wb_sunny_outlined, color: Colors.white,),
        Container(height: 0, width:20,),
        Column(
          mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("14º", ),
            Text("Seoul"),
          ],
        ),
      ],
    );
  }
}


class Links extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Links"),
        Container(height: 0, width: 20,),
        Icon(Icons.search, color: Colors.white,),
      ],
    );
  }
}

