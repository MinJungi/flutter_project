import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

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
  @override
  String title = "hello";

  void onPress() {
    Toast.show("button clicked", context, duration: Toast.LENGTH_LONG);

//    print("clicked");
//     setState(() {
//      title = "clicked";
//    });
  }

  Widget build(BuildContext context) {
    //String title = "hellO";

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
          width: double.infinity,
          color: Colors.grey[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: onPress,
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ),
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.blue,
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.green,
              ),

              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return generateListItem(index);
                    }),
              )
//            Expanded(
//              child: Container(
//                color: Colors.yellow,
//              ),
//            )
            ],
          )),
    );
  }

  Widget generateListItem(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
      child: Container(
        height: 200,
        width: 200,
        child: Stack(
          children: <Widget>[
            Text("$index"),
            Center(
              child: Icon(Icons.cloud, size: 100,),
            )
          ],
        ),

        //child: Text("$index"),

        //color: Colors.grey[300],
        decoration: BoxDecoration(

          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(45),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.grey[500],
              offset: Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            )
          ],
        ),
      ),
    );
  }
}
