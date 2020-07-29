
import 'package:bustem2/cardsList.dart';
import 'package:bustem2/main.dart';
import 'package:bustem2/oddCalculator/modifiedHand.dart';
import 'package:bustem2/oddCalculator/winnerHand.dart';
import '../cards.dart';

class oddsEmulator {
  int rapidTime = 100000;
  winnerHand winnerCalculator = new winnerHand();
  CardList cardList = new CardList();
  winnerHand wh = new winnerHand();
  List<modifideHand> H;


  void emulator() {
    List<int> results = new List(staticValues.getPlayerNo());
    results.fillRange(0, staticValues.getPlayerNo(), 0);
print(staticValues.getPlayerNo());
    if (level == 0) {
      List newList = List.from(staticValues.getShuffle());
      newList.removeRange(0, staticValues.getPlayerNo() * 2);
      List<Cards> handCards = [];
      for (int x = 0; x < staticValues.getPlayerNo() * 2; x++) {
        handCards.add(cardList.cards[staticValues.getShuffle()[x]]);
      }

      for (int i = 0; i < rapidTime; i++) {
        newList.shuffle();
        List<Cards> selectedCards = [
          cardList.cards[newList[0]],
          cardList.cards[newList[1]],
          cardList.cards[newList[2]],
          cardList.cards[newList[3]],
          cardList.cards[newList[4]],
        ];

        List<Cards> list = [...handCards, ...selectedCards];
        H = winnerCalculator.winner(list);
      }
      for (int z = 0; z < staticValues.getPlayerNo(); z++) {
        print("w:"+staticValues.getTotalWin(z) .toString());
        print("w:"+staticValues.getTotalTie(z) .toString());

        oddCalculator.setOdd(z, (staticValues.getTotalWin(z) / rapidTime) * 100);
        oddCalculator.setTie(z, (staticValues.getTotalTie(z) *100)/ rapidTime);
      }

      staticValues.resetTotalTie();
      staticValues.resetTotalWin();
    } else if (level == 1) {
      List newList = List.from(staticValues.getShuffle());
      newList.removeRange(0, ((staticValues.getPlayerNo() * 2) + 3));
      List<Cards> handCards = [];
      for (int x = 0; x < (staticValues.getPlayerNo() * 2) + 3; x++) {
        handCards.add(cardList.cards[staticValues.getShuffle()[x]]);
      }
        //49=52-3
        int cartCount=49-(staticValues.getPlayerNo()*2);
      int test=0;
        for(int x=0;x<cartCount;x++){
          for(int y=x+1;y<cartCount;y++){
            test++;
            List<Cards> selectedCards = [
              cardList.cards[newList[x]],
              cardList.cards[newList[y]],
            ];

            List<Cards> list = [...handCards, ...selectedCards];
            H = winnerCalculator.winner(list);
          }
        }

        print(test);
      for (int z = 0; z < staticValues.getPlayerNo(); z++) {
        oddCalculator.setOdd(z, (staticValues.getTotalWin(z) / (cartCount*(cartCount-1)/2)) * 100);
        oddCalculator.setTie(z, (staticValues.getTotalTie(z) *100)/ rapidTime);
      }
      staticValues.resetTotalWin();
      staticValues.resetTotalTie();

    } else if (level == 2) {
      List newList = List.from(staticValues.getShuffle());
      newList.removeRange(0, ((staticValues.getPlayerNo() * 2) + 4));
      List<Cards> handCards = [];
      for (int x = 0; x < (staticValues.getPlayerNo() * 2) + 4; x++) {
        handCards.add(cardList.cards[staticValues.getShuffle()[x]]);
      }
      int cartCount=48-(staticValues.getPlayerNo()*2);
      for (int i = 0; i <cartCount; i++) {
        List<Cards> selectedCards = [
          cardList.cards[newList[i]],
        ];
        List<Cards> list = [...handCards, ...selectedCards];
        H = winnerCalculator.winner(list);
      }
      for (int z = 0; z < staticValues.getPlayerNo(); z++) {
        oddCalculator.setOdd(
            z, (staticValues.getTotalWin(z) / cartCount) * 100);
        oddCalculator.setTie(z, (staticValues.getTotalTie(z) *100)/ rapidTime);
      }
      staticValues.resetTotalWin();
      staticValues.resetTotalTie();
    } else if (level == 3) {
      H = winnerCalculator.winner(chooseCards);

      for (int i = 0; i < staticValues.getPlayerNo(); i++) {
        oddCalculator.setOdd(i, 0);
      }
      for (int z = 0; z < staticValues.getPlayerNo(); z++) {
        print(staticValues.getTotalWin(z));
        print(staticValues.getTotalTie(z));
        oddCalculator.setOdd(z, (staticValues.getTotalWin(z)) * 100);
        oddCalculator.setTie(z, (staticValues.getTotalTie(z)) * 100);
      }
      staticValues.resetTotalWin();
      staticValues.resetTotalTie();
    }
  }
}
