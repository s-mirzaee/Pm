import 'package:bustem2/cardsList.dart';
import 'package:bustem2/main.dart';
import 'package:bustem2/oddCalculator/winnerHand.dart';

import '../cards.dart';

class oddsEmulator {

  winnerHand winnerCalculator = new winnerHand();
  CardList cardList = new CardList();
  winnerHand wh=new winnerHand();

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
      //Stopwatch stopwatch = new Stopwatch()..start();
      for (int i = 0; i < 1500; i++) {

        newList.shuffle();
        List<Cards> selectedCards = [
          cardList.cards[newList[0]],
          cardList.cards[newList[1]],
          cardList.cards[newList[2]],
          cardList.cards[newList[3]],
          cardList.cards[newList[4]],
        ];


        List<Cards> list=[...handCards,...selectedCards];

        List<int> winners=winnerCalculator.winner(list);

        for(int y=0;y<winners.length;y++){
          total++;
          results[winners[y]]++;
        }
      }
      print("********************************");
      //print('time : ${stopwatch.elapsed}');
      for(int z=0;z<staticValues.getPlayerNo();z++){
        oddCalculator.setOdd(z, (results[z]/total)*100);
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
        List<int> winners=winnerCalculator.winner(list);
        for(int y=0;y<winners.length;y++){
          total++;
          results[winners[y]]++;
        }
      }
      for(int z=0;z<staticValues.getPlayerNo();z++){
        oddCalculator.setOdd(z, (results[z]/total)*100);
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
        List<int> winners=winnerCalculator.winner(list);
        for(int y=0;y<winners.length;y++){
          total++;
          results[winners[y]]++;
        }
      }
      for(int z=0;z<staticValues.getPlayerNo();z++){
        oddCalculator.setOdd(z, (results[z]/total)*100);
      }
    }
    else if(level==3){
      List<int> winners=wh.winner(chooseCards);

      for(int i=0;i<staticValues.getPlayerNo();i++){
        oddCalculator.setOdd(i, 0);
      }

      for(int j=0;j<winners.length;j++){
        oddCalculator.setOdd(winners[j], 100);
      }}

  }
}
