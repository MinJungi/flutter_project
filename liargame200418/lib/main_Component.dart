import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'data.dart';
import 'main.dart';

class NumEntry extends StatefulWidget {
  @override
  _NumEntryState createState() => _NumEntryState();
}

class _NumEntryState extends State<NumEntry> {

  int numEntry = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text("$numEntry 명"),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: increaseNumEntry,
                child: Icon(
                    Icons.expand_less
                ),
              ),
              GestureDetector(
                onTap: decreaseNumEntry,
                child: Icon(
                    Icons.expand_more
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void increaseNumEntry(){
    if(numEntry < 15){
      setState(() {
        numEntry ++;
        MainPage.setNumEntry(numEntry);
      });
    }
  }

  void decreaseNumEntry(){
    if(numEntry>3){
      setState(() {
        numEntry--;
        MainPage.setNumEntry(numEntry);
      });
    }
  }
}

class OnOffButton extends StatefulWidget {
  @override
  _OnOffButtonState createState() => _OnOffButtonState();
}

class _OnOffButtonState extends State<OnOffButton> {

  bool currentState = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeState,
      child: Container(
        child: currentState?onButton():offButton(),
      ),
    );
  }

  Widget onButton(){
    return Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Center(
        child: Text("ON", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      ),
    );
  }

  Widget offButton(){
    return Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Center(
        child: Text("OFF", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      ),
    );
  }

  void changeState(){
    setState(() {
      currentState = !currentState;
      MainPage.setSpyMode(currentState);
    });
  }
}

class SearchButton extends StatefulWidget {
  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {

  final List<DropdownMenuItem> subjectList = [];
  String currentSubject;

  @override
  void initState() {
    for(String s in subjectMap.keys){
      subjectList.add(
        DropdownMenuItem(
          child: Text(s),
          value: s,
        )
      );
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SearchableDropdown(
              items: subjectList,
              hint: "select",
              searchHint: "select subject one",
              value: currentSubject,
              onChanged: (subject){
                setState(() {
                  currentSubject = subject;
                  MainPage.setSubject(subject);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

