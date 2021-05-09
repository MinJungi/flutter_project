import 'package:flutter/material.dart';
import 'package:sudoku_api/sudoku_api.dart';

void main() {
  PuzzleOptions puzzleOptions = new PuzzleOptions(patternName: "winter");

  Puzzle puzzle = new Puzzle(puzzleOptions);

  puzzle.generate().then((_) {
    print("=====================================");
    print("Your puzzle, fresh off the press:");
    print("-------------------------------------");
    printGrid(puzzle.board());
    print("=====================================");
    print("Give up? Here's your puzzle solution:");
    print("-------------------------------------");
    printGrid(puzzle.solvedBoard());
    print("=====================================");

    runApp(MyApp(puzzle: puzzle));
  });
}

class MyApp extends StatelessWidget {
  final Puzzle puzzle;

  MyApp({this.puzzle});

  List<List<int>> getPuzzleGrid(Grid grid){
    List<List<int>> numbers = new List.generate(9, (i) => []);
    
    ///////////요기 해야댐
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: sudoku(),
    );
  }
}

class sudoku extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
