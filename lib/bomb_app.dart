import 'package:bomb_gamber/screen/game_screen.dart';
import 'package:bomb_gamber/screen/start_screen.dart';
import 'package:flutter/material.dart';

class BombApp extends StatefulWidget {
  const BombApp({super.key});

  @override
  State<BombApp> createState() => _BombAppState();
}

class _BombAppState extends State<BombApp> {

  Widget? startScreen;
  int point=0;
  int lastpoint=0;




  void _addAnswers(String gpoint) {
    if(gpoint=='boom'){
      lastpoint=point;
      point=0;
      print(gpoint);
    }
    else{
      var myInt = int.parse(gpoint);
      point+=myInt;
      print(point);
    }
    }






  void switchScreen(List<String> players){
 setState(() {
        startScreen = GameScreen(
          player1Name: players[0],
          player2Name:  players[1],
          onOptionSelected: _addAnswers, stayAway:stayAway
        );
      });




  }

  void stayAway() {
    setState(() {
      startScreen = StartScreen(onPressed: switchScreen);
    });
  }

  @override
  void initState() {
    startScreen=StartScreen(onPressed: switchScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: startScreen,
      ),

    );
  }
}
