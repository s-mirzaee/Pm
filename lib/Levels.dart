import 'package:bustem2/LogoScreen.dart';
import 'package:bustem2/wagerAlert.dart';
import 'cards.dart';
import 'main.dart';
import 'package:flutter/cupertino.dart';

class Levels {
  List<Cards> chooseCards;

  Levels(this.chooseCards);

  Widget levelUp(int level) {


    switch (level) {
      case 0:
        {
          oddCalculator.oddCalculator(chooseCards);
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
          oddCalculator.oddCalculator(chooseCards);
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
          oddCalculator.oddCalculator(chooseCards);
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
          oddCalculator.oddCalculator(chooseCards);
          staticValues.setPhaseName('Result');

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
      case 4:
        {
          oddCalculator.oddCalculator(chooseCards);
          staticValues.setPhaseName('Play Again');
          return logoScreen();
        }
        break;
    }

  }
}
