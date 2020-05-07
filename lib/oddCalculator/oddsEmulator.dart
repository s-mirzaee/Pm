import 'package:bustem2/cardsList.dart';
import 'package:bustem2/main.dart';
import 'package:bustem2/oddCalculator/winnerHand.dart';

import '../cards.dart';

class oddsEmulator {

  winnerHand winnerCalculator = new winnerHand();
  CardList cardList = new CardList();

  void emulator() {
    int total=0;
    print("staaaarrrrrrttt");
    List<int> results=new List(staticValues.getPlayerNo());
    results.fillRange(0, staticValues.getPlayerNo(),0);
    print("results"+results.toString());
    if (level >= 0) {
      List newList = List.from(staticValues.getShuffle());
      newList.removeRange(0, staticValues.getPlayerNo() * 2);
      List<Cards> handCards = [];
      for (int x = 0; x < staticValues.getPlayerNo() * 2; x++) {
        handCards.add(cardList.cards[staticValues.getShuffle()[x]]);
      }
      print("suffl list:" + newList.toString());
      for (int i = 0; i < 400; i++) {
        print(i.toString());
        newList.shuffle();
        List<Cards> selectedCards = [
          cardList.cards[newList[0]],
          cardList.cards[newList[1]],
          cardList.cards[newList[2]],
          cardList.cards[newList[3]],
          cardList.cards[newList[4]],
        ];

        List<Cards> list=[...handCards,...selectedCards];
        print(list.toString());
        List<int> winners=winnerCalculator.winner(list);
        for(int y=0;y<winners.length;y++){
          total++;
          results[winners[y]]++;
        }
      }
      for(int z=0;z<staticValues.getPlayerNo();z++){
        oddCalculator.setOdd(z, (results[z]/total)*100);
      }
      print("Emolator results+"+results.toString());
    }
  }
}
