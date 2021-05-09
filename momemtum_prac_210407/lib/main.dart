import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      body: BackGround(
        imagePath: 'images/mountains-6043079.jpg',
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
                alignment: Alignment.center,
                child: Clock(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Quotes(),
              ),

              Align(
                alignment: FractionalOffset(0.5, 0.8),
                child : Focus(),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Todo(),
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

class BackGround extends StatelessWidget {
  final Widget child;
  final String imagePath;

  BackGround({this.child, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          )
      ),
      child: child,
    );
  }
}

class Links extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Links"),
        Container(height: 0, width: 10,),
        Icon(Icons.search, color: Colors.white,),
      ],
    );
  }
}

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.wb_sunny_outlined, color: Colors.white,),
        Container(height: 0, width: 10,),
        Column(
          mainAxisSize: MainAxisSize.min,
            children: [
              Text("14º", style: TextStyle(fontSize: 20),),
              Text("Seoul", style: TextStyle(fontSize: 10),),
            ],
        )
      ],
    );
  }
}

/*
class Clock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*return Column(
      children: [
        Flexible(child: Container(),),
        Text("15:49", style: TextStyle(fontSize: 150,),),
        Flexible(child: Center(child: Focus())),
      ],
    );*/
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

  String _formatDateTime(DateTime dateTime){
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  void _getTime(){
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    _timer = Timer.periodic(Duration(milliseconds: 100), (Timer t) => _getTime());
    
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Text(_timeString, style: TextStyle(fontSize: 150),);
  }
}

/*
class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //PopupMenuButton(itemBuilder: itemBuilder),
        Icon(Icons.settings, color: Colors.white,)
      ],
    );
  }
}*/


class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  /*void showPopup(){
    showDialog(context: context, builder: (_) => PopUp());
  }*/

  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //Icon(Icons.settings, color:Colors.white),
        Row(
          children: [
            AnimatedOpacity(
              opacity: _visible? 1: 0,
              duration: Duration(milliseconds: 300),
              child: Visibility(
                child: SettingBox(),
                visible: _visible,
              ),
            ),
          ],
        ),

        Row(
          children: [
            IconButton(
              //focusColor: Color(0x00000000),
              onPressed: (){
                setState(() {
                  _visible = !_visible;
                });
                //showPopup,
              },
              //backgroundColor: Color(0x00000000),
              //shape: ,
              icon: Icon(Icons.settings, color: Colors.white,),
            ),
          ],
        ),
      ],
    );
  }
}

class SettingBox extends StatefulWidget {
  @override
  _SettingBoxState createState() => _SettingBoxState();
}

class _SettingBoxState extends State<SettingBox> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      height: 500,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Icon(Icons.cloud, size: 100,),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.icecream, size:100,),
              Icon(Icons.wb_sunny, size:100,),
              /*OutlinedButton(
                onPressed: (){
                  Navigator.of(context).restorablePush(_dialogBuilder);
                },

                child: Container(
                  child: Text('Open Dialog'),
                  color: Colors.red,
                ),
              ),*/

            ],
          ),
        ],
      ),
    );
  }
}


/*
class PopUp extends StatefulWidget {
  @override
  _PopUpState createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> with TickerProviderStateMixin {
  AnimationController controller;
  double _bottom = 100, _fromTop=200, _screenHeight, _containerHeight = 300;
  bool _visible = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this)
      ..addListener(() {
        Timer.periodic(Duration(milliseconds: 50), (timer) {
          if(_bottom < _screenHeight - _fromTop - _containerHeight){
            _bottom += 1;
            setState(() {});
          }
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    return /*Center(
      child: AnimatedOpacity(
        opacity: _visible?1.0:0.0,
        duration: Duration(milliseconds: 100),
        child: Container(
          width: 200,
          height: ,
        ),
      ),
    ) ;*/

      SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned(
            bottom: _bottom,
            left: 0,
            right: 0,
            child: Container(
              child: Icon(Icons.cloud, size: 100, color: Colors.white,),
              height: _containerHeight,
              color: Colors.blue,
            )
          )
        ],
      ),
      //color: Colors.blue,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}
*/


class Quotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('"Always walk through life as if you have something new to learn nad you will."');
  }
}

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  bool _todoVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Container(),),
            AnimatedOpacity(
              opacity: _todoVisible?1:0,
              duration: Duration(milliseconds: 300),
              child: Visibility(
                child: TodoBox(),
                visible: _todoVisible,
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Container(),),
            FlatButton(
              onPressed: (){
                setState(() {
                  _todoVisible = !_todoVisible;
                });
              },
              //color: Colors.black,
              minWidth: 0,
              child: Text("Todo", style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ],
    );
  }
}

class TodoBox extends StatefulWidget {
  @override
  _TodoBoxState createState() => _TodoBoxState();
}

class _TodoBoxState extends State<TodoBox> {
  List<String> todoValues = <String>['Inbox', 'Today', 'Done'];
  String todoValue = 'Inbox';
  int inbox_index = 0;
  List<bool> showingScreen = <bool>[true, false, false];
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 250,
      //color: Colors.green,
      padding: EdgeInsets.fromLTRB(20, 5, 10, 10),
      margin: EdgeInsets.fromLTRB(0,0,0,5),
      decoration: BoxDecoration(
        //border: Border.all(width: 1, color: Colors.grey),
        color: Colors.white,
        borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: DropdownButton<String>(
                value: todoValue,
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.black26, size: 24,),
                style: TextStyle(color: Colors.black),
                //iconSize: 24,
                /*underline: Container(
                  height: 2,
                  color: ,
                ),*/
                onChanged: (String newValue){
                  setState(() {
                    todoValue = newValue;
                    showingScreen[inbox_index] = false;
                    inbox_index = todoValues.indexOf(newValue);
                    showingScreen[inbox_index] = true;
                    print(showingScreen);
                    //print(index);
                  });
                },
                items: <String>['Inbox', 'Today', 'Done']
                    .map<DropdownMenuItem<String>>((String value)  {
                      return DropdownMenuItem<String>(value:value, child: Text(value, ));
                }).toList(),
              ),
            ),

            Align( //inbox screen
              alignment: Alignment.center,
              child: Visibility(
                visible: showingScreen[0],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Add a todo to get started", style: TextStyle(color: Colors.black, fontSize: 15),),
                    Container(height: 10,),
                    Text("Inbox", style: TextStyle(color: Colors.black, fontSize: 15),),
                    Container(height: 10,),
                    Text("New todo", style: TextStyle(color: Colors.black, fontSize: 15),),
                  ],
                ),
              ),
            ),

            Align( //today screen
              alignment: Alignment.center,
              child: Visibility(
                visible: showingScreen[1],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Add a todo to get started", style: TextStyle(color: Colors.black, fontSize: 15),),
                    Container(height: 10,),
                    Text("Today", style: TextStyle(color: Colors.black, fontSize: 15),),
                    Container(height: 10,),
                    Text("New todo", style: TextStyle(color: Colors.black, fontSize: 15),),
                  ],
                ),
              ),
            ),

            Align( //done screen
              alignment: Alignment.center,
              child: Visibility(
                visible: showingScreen[2],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("No completed today yet", style: TextStyle(color: Colors.black, fontSize: 15),),
                    Container(height: 10,),
                    Text("Done", style: TextStyle(color: Colors.black, fontSize: 15),),
                    Container(height: 10,),
                    Text("New todo", style: TextStyle(color: Colors.black, fontSize: 15),),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Container()),
                      IconButton(
                        icon: Icon(Icons.more_horiz),
                        onPressed: (){
                          setState(() {
                            _showMore = !_showMore;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Visibility(child: MoreBox(),visible: _showMore,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreBox extends StatefulWidget {
  @override
  _MoreBoxState createState() => _MoreBoxState();
}

class _MoreBoxState extends State<MoreBox> {
  List<String> moreContent = <String>['Autofocus', 'Add integraion', 'Settings'];
  double _settingHeight = 30, _settingWidth = 110;
  static const double _paddingSize = 5.0;
  int touchedIndex=0;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: _settingHeight* moreContent.length + 2 *_paddingSize,
      width: _settingWidth + 2*_paddingSize,
      //color: Colors.black12,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: const BorderRadius.all(const Radius.circular(_paddingSize)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(_paddingSize),
        child: ListView.builder(
          itemCount: moreContent.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              height: _settingHeight,
              width: _settingWidth,
              //color: Colors.green,
              child: Stack(
                children: [
                  //EachMoreBox(index : index),
                  InkWell(
                    child: Center(child: Text('${moreContent[index]}', style: TextStyle(color: Colors.black),)),
                    onTap: (){
                      touchedIndex = index;

                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class EachMoreBox extends StatefulWidget {
  int index;

  EachMoreBox({Key key, index}) : super(key:key);

  @override
  _EachMoreBoxState createState() => _EachMoreBoxState();
}

class _EachMoreBoxState extends State<EachMoreBox> {
  @override
  Widget build(BuildContext context) {
    return Container();
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
            enabled: true,
            decoration: InputDecoration(
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


