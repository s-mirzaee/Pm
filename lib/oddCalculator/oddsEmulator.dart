import 'package:bustem2/cardsList.dart';
import 'package:bustem2/main.dart';
import 'package:bustem2/oddCalculator/modifiedHand.dart';
import 'package:bustem2/oddCalculator/winnerHand.dart';

import '../cards.dart';

class oddsEmulator {

  winnerHand winnerCalculator = new winnerHand();
  CardList cardList = new CardList();
  winnerHand wh=new winnerHand();
  List<modifideHand> H;
  void emulator() {

    int total=0;
    List<int> results=new List(staticValues.getPlayerNo());
    results.fillRange(0, staticValues.getPlayerNo(),0);

    if (level == 0 ) {
      List newList = List.from(staticValues.getShuffle());
      newList.removeRange(0, staticValues.getPlayerNo() * 2);
      List<Cards> handCards = [];
      for (int x = 0; x < staticValues.getPlayerNo() * 2; x++) {
        handCards.add(cardList.cards[staticValues.getShuffle()[x]]);
      }
      // Stopwatch stopwatch = new Stopwatch()..start();
      for (int i = 0; i < 20000; i++) {

        newList.shuffle();
        List<Cards> selectedCards = [
          cardList.cards[newList[0]],
          cardList.cards[newList[1]],
          cardList.cards[newList[2]],
          cardList.cards[newList[3]],
          cardList.cards[newList[4]],
        ];

        List<Cards> list=[...handCards,...selectedCards];
        H=winnerCalculator.winner(list);
      }

      for(int z=0;z<staticValues.getPlayerNo();z++){
        //print(z.toString()+"+++++++"+H[z].total.toString());
        oddCalculator.setOdd(z, (H[z].total/15)*100);
      }

    }else if (level == 1 ) {
      List newList = List.from(staticValues.getShuffle());
      newList.removeRange( 0 ,((staticValues.getPlayerNo() * 2) +3));
      List<Cards> handCards = [];
      for (int x = 0; x < (staticValues.getPlayerNo() * 2) +3; x++) {
        handCards.add(cardList.cards[staticValues.getShuffle()[x]]);
      }
      for (int i = 0; i < 20000; i++) {
        newList.shuffle();
        List<Cards> selectedCards = [
          cardList.cards[newList[0]],
          cardList.cards[newList[1]],
        ];

        List<Cards> list=[...handCards,...selectedCards];
        H=winnerCalculator.winner(list);

      }
      for(int z=0;z<staticValues.getPlayerNo();z++){
        oddCalculator.setOdd(z, (H[z].total/1500)*100);
      }
    }else if (level == 2 ) {
      List newList = List.from(staticValues.getShuffle());
      newList.removeRange( 0 ,((staticValues.getPlayerNo() * 2) +4));
      List<Cards> handCards = [];
      for (int x = 0; x < (staticValues.getPlayerNo() * 2) +4; x++) {
        handCards.add(cardList.cards[staticValues.getShuffle()[x]]);
      }

      for (int i = 0; i < 20000; i++) {
        newList.shuffle();
        List<Cards> selectedCards = [
          cardList.cards[newList[0]],
        ];

        List<Cards> list=[...handCards,...selectedCards];
        H=winnerCalculator.winner(list);

      }
      for(int z=0;z<staticValues.getPlayerNo();z++){
        oddCalculator.setOdd(z, (H[z].total/1500)*100);
      }
    }
    else if(level==3){
      H=winnerCalculator.winner(chooseCards);


      for(int z=0;z<staticValues.getPlayerNo();z++){
        oddCalculator.setOdd(z, (H[z].total)*100);
      }}

  }
}