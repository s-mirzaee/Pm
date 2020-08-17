import 'package:bustem2/LogoScreen.dart';
import 'package:flutter/material.dart';
import 'Levels.dart';
import 'board.dart';
import 'cards.dart';
import 'cardsList.dart';
import 'GameScreen.dart';
import 'odds.dart';
import 'MenuScreen.dart';
import 'sliderValue.dart';
import 'StaticValues.dart';

void main() => (runApp(RunApp()));
StaticValues staticValues = new StaticValues();
sliderValue values = new sliderValue();
odds oddCalculator = new odds();
int level = 0;
CardList handCard = new CardList();
List<Cards> chooseCards = handCard.cardlist(staticValues.getPlayerNo());
Levels levels = new Levels(chooseCards);
board Board = new board(chooseCards);
bool expire=now.isAfter(expireDate);
var now = new DateTime.now();
var expireDate = DateTime(2021, 1, 1);
class RunApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          child: child,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
      debugShowCheckedModeBanner: false,
      title: "BustEmHoldem",
      initialRoute: '/',
      routes: {
        '/': (context) =>expire? Expire(): MenuScreen(),
        '/Game': (context) => StartGame(),
        '/Desk': (context) => GameDesk(),
        '/End': (context) => logoScreen(),
      },
    );
  }
}