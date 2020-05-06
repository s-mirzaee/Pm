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
StaticValues staticValues=new StaticValues();
sliderValue values=new sliderValue();
odds oddCalculator=new odds();
int level = 0;
CardList handCard = new CardList();
List<Cards> chooseCards = handCard.cardlist(staticValues.getPlayerNo());
board Board = new board(chooseCards);
Levels levels = new Levels(chooseCards);
void newGame() {
  level = 0;
  handCard = new CardList();
  chooseCards = handCard.cardlist(staticValues.getPlayerNo());
  levels = new Levels(chooseCards);
  staticValues.createWager(staticValues.getPlayerNo());

}


class RunApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "bustemHoldem",
      initialRoute: '/',
      routes: {
        '/': (context) => MenuScreen(),
        '/Game': (context) => StartGame(),
        '/Desk': (context)=>GameDesk(),
        '/End': (context)=>logoScreen(),

      },
    );
  }
}






