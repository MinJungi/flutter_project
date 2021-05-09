import 'package:flutter/material.dart';
import 'package:flutterapp200516/animation_test.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:math';

class AnimationButton extends StatefulWidget {
  @override
  _AnimationButtonState createState() => _AnimationButtonState();
}

class _AnimationButtonState extends State<AnimationButton> {

  bool isCheck = false;

  var tween = MultiTrackTween([
    Track('rotation').add(Duration(seconds: 1), Tween(begin: -2 * pi, end: 0.0)),
    Track('color').add(Duration(seconds: 1), ColorTween(begin: Colors.white, end: Colors.black)),

    Track('size_sun').add(Duration(seconds: 1), Tween(begin: 0.0, end: 200.0), curve: Interval(0.5, 1.0)),
    Track('size_cloud').add(Duration(seconds: 1), Tween(begin: 200.0, end: 0.0), curve: Interval(0.0, 0.5)),

    Track('paddingLeft').add(Duration(seconds: 1), Tween(begin: 0.0, end: 50.0)),
    Track('back_color').add(Duration(seconds: 1), ColorTween(begin: Colors.black, end: Colors.white)),

    Track('opacity').add(Duration(seconds: 1), Tween(begin: 1.0, end: 0.0)),
  ]);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: ControlledAnimation(
        playback: isCheck? Playback.PLAY_FORWARD : Playback.PLAY_REVERSE,
        tween: tween,
        duration: tween.duration,
        curve: Curves.easeInOut,
        startPosition: isCheck ? 1.0 : 0.0,
        builder: (context, animation){
          return Stack(
            children: <Widget>[
              Transform.rotate(
                angle: animation['rotation'],
                child: Stack(
                  children: <Widget>[
                    Icon(Icons.cloud, size : animation['size_sum'], color: animation['color'],),
                    Icon(Icons.wb_sunny, size: animation['size_cloud'], color: animation['color'],)
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 500,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isCheck = !isCheck;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      height: 50,
                      width: 100,
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
