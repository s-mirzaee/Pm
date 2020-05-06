import 'package:bustem2/LogoScreen.dart';

import 'wagerAlert.dart';

import 'finish.dart';
import 'cards.dart';
import 'cardsList.dart';
import 'main.dart';
import 'package:flutter/cupertino.dart';

import 'board.dart';

class Levels {
  List<Cards> chooseCards;

  Levels(this.chooseCards);






  Widget levelUp(int level) {
    board Board = new board(chooseCards);

    switch (level) {
      case 0:
        {
          staticValues.setPhaseName('Flop');


          return Stack(
            children: <Widget>[
              Board.hands(),
            ],
          );
        }
        break;
      case 1:
        {
          staticValues.setPhaseName('Turn');

          return Stack(
            children: <Widget>[
              Board.hands(),
              Board.flop(),
            ],
          );
        }
        break;
      case 2:
        {
         staticValues.setPhaseName('River');

          return Stack(
            children: <Widget>[
              Board.hands(),
              Board.flop(),
              Board.turn(),
            ],
          );
        }
        break;
      case 3:
        {
          staticValues.setPhaseName('Finish');

          return Stack(
            children: <Widget>[

              Board.hands(),
              Board.flop(),
              Board.turn(),
              Board.river(),
            ],
          );
        }
        break;
      case 4:{
        staticValues.setPhaseName('Play Again');
        return logoScreen();
      }break;
    }
  }
}
