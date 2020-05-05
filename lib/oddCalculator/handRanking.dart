import '../cards.dart';
import 'rankToString.dart';

List<Cards> samesuit = [];
consecutive conse = new consecutive();
List<Cards> myHand = [
  Cards('4', 'diamond', '8s'),
  Cards('queen', 'club', '9s')
];
List<Cards> centerCard = [
  Cards('8', 'diamond', '9d'),
  Cards('5', 'heart', '10d'),
  Cards('5', 'club', 'Jd'),
  Cards('7', 'club', 'Qd'),
  Cards('9', 'diamond', 'Kd'),
];

class rank {
  int ranking(List<Cards> myHand, List<Cards> centerCard) {
    if (myHand[0].suit == myHand[1].suit) {
      int cardWithSameSuit = 0;
      for (int x = 0; x < 5; x++) {
        if (centerCard[x].suit == myHand[0].suit) {
          samesuit.add(centerCard[x]);
          cardWithSameSuit++;
        }
      }
      if (cardWithSameSuit >= 3) {
        //1.royalFlush
        int highCard = 0;
        for (int i = 0; i < samesuit.length; i++) {
          if ((samesuit[i].rank == '1' ||
              samesuit[i].rank == '10' ||
              samesuit[i].rank == 'jack' ||
              samesuit[i].rank == 'king' ||
              samesuit[i].rank == 'queen')) {
            highCard++;
          }
        }

        if ((myHand[0].rank == '1' ||
                myHand[0].rank == '10' ||
                myHand[0].rank == 'jack' ||
                myHand[0].rank == 'king' ||
                myHand[0].rank == 'queen') &&
            (myHand[1].rank == '1' ||
                myHand[1].rank == '10' ||
                myHand[1].rank == 'jack' ||
                myHand[1].rank == 'king' ||
                myHand[1].rank == 'queen') &&
            highCard == 3) {
          print("RoyalFlush :)))))");
          return 1;
        }
        //2.straightFlush
        List<Cards> allSF = samesuit;
        allSF.add(myHand[0]);
        allSF.add(myHand[1]);
        List<int> allSFInt = conse.conse(allSF);
        if (allSFInt.length == 5) {
          if ((allSFInt[0] - allSFInt[4]) == -4) {
            print('StraightFlush');
            return 2;
          }
        } else if (allSFInt.length == 6) {
          print(allSFInt.toString());
          if ((allSFInt[0] - allSFInt[4]) == -4 ||
              (allSFInt[1] - allSFInt[5]) == -4) {
            print('StraightFlush');
            return 2;
          }
        } else if (allSFInt.length == 7) {
          if ((allSFInt[0] - allSFInt[4]) == -4 ||
              (allSFInt[1] - allSFInt[5]) == -4 ||
              (allSFInt[2] - allSFInt[6]) == -4) {
            print('StraightFlush');
            return 2;
          }
        }
      }
      List<Cards> all = List.from(centerCard);
      all.add(myHand[0]);
      all.add(myHand[1]);
      List<int> allSInt = conse.conse(all);
      List<int> without = [];

      List<int> allTPInt = conse.conse(all);
      List<int> sameRankeTP = [];
      //3.four of a kind
      int x1 = 0;
      for (int i = 0; i < 5; i++) {
        if (myHand[0].rank == centerCard[i].rank) {
          x1++;
        }
      }
      int y1 = 0;
      for (int i = 0; i < 5; i++) {
        if (myHand[1].rank == centerCard[i].rank) {
          y1++;
        }
      }
      if (x1 == 3 || y1 == 3) {
        print("four of a kind");
        return 3;
      }
      //4.full house
      int x2 = 0;
      for (int i = 0; i < 5; i++) {
        if (myHand[0].rank == centerCard[i].rank) {
          x2++;
        }
      }
      int y2 = 0;
      for (int i = 0; i < 5; i++) {
        if (myHand[1].rank == centerCard[i].rank) {
          y2++;
        }
      }
      if ((x2 >= 1 && y2 == 2) || (y2 >= 1 && x2 == 2)) {
        print("full house");
        return 4;
      }
      //5.flush
      if (cardWithSameSuit >= 3) {
        return 5;
      }

      //6.straight
      for (int i = 0; i < allSInt.length; i++) {
        int x = 0;
        for (int j = i + 1; j < allSInt.length; j++) {
          if (allSInt[i] == allSInt[j]) {
            x++;
          }
        }
        if (x == 0) {
          without.add(allSInt[i]);
        }
      }
      if (without.length == 5) {
        if (without[0] - without[4] == 4) {
          print("Straight");
          return 6;
        }
      } else if (without.length == 6) {
        if ((without[0] - without[4] == -4 &&
                conse.stringToInt(myHand[0]) != without[5] &&
                conse.stringToInt(myHand[1]) != without[5]) ||
            (without[1] - without[5] == -4 &&
                conse.stringToInt(myHand[0]) != without[0] &&
                conse.stringToInt(myHand[1]) != without[0])) {
          print("Straight");
          return 6;
        }
      } else if (without.length == 7) {
        if ((without[0] - without[4] == -4 &&
                conse.stringToInt(myHand[0]) != without[5] &&
                conse.stringToInt(myHand[1]) != without[5] &&
                conse.stringToInt(myHand[0]) != without[6] &&
                conse.stringToInt(myHand[1]) != without[6]) ||
            (without[1] - without[5] == -4 &&
                conse.stringToInt(myHand[0]) != without[0] &&
                conse.stringToInt(myHand[1]) != without[0] &&
                conse.stringToInt(myHand[0]) != without[6] &&
                conse.stringToInt(myHand[1]) != without[6]) ||
            (without[2] - without[6] == -4 &&
                conse.stringToInt(myHand[0]) != without[0] &&
                conse.stringToInt(myHand[1]) != without[0] &&
                conse.stringToInt(myHand[0]) != without[1] &&
                conse.stringToInt(myHand[1]) != without[1])) {
          print("Straight");
          return 6;
        }
      }
      //7.three of a kind
      print(allTPInt.toString());
      for (int i = 0; i < allTPInt.length - 2; i++) {
        if (allTPInt[i] - allTPInt[i + 2] == 0) {
          print("three of a kind");
          return 7;
        }
      }

      //8.two pair

      for (int i = 0; i < 6; i++) {
        if (allTPInt[i] == allTPInt[i + 1]) {
          sameRankeTP.add(allTPInt[i]);
        }
      }
      if (sameRankeTP.length >= 2) {
        for (int i = 0; i < sameRankeTP.length; i++) {
          if (sameRankeTP[i] == conse.stringToInt(myHand[0]) ||
              sameRankeTP[i] == conse.stringToInt(myHand[1])) {
            print("two pair");
            return 8;
          }
        }
      }
      //pair
      else if (sameRankeTP.length == 1) {
        print("pair");
        return 9;
      }

      return 10;
    }
    //same ranke
    else if (myHand[0].rank == myHand[1].rank) {
      List<Cards> all = List.from(centerCard);
      all.add(myHand[0]);
      all.add(myHand[1]);

      //3.four of a kind
      List<int> allCenterInt = conse.conse(centerCard);
      List<int> sameRankeFK = [];
      for (int i = 0; i < 4; i++) {
        if (allCenterInt[i] == allCenterInt[i + 1]) {
          sameRankeFK.add(allCenterInt[i]);
        }
      }
      for (int i = 0; i < sameRankeFK.length; i++) {
        if (sameRankeFK[i] == conse.stringToInt(myHand[0])) {
          print("four of a kind");
          return 3;
        }
      }
      //4.full house
      if ((allCenterInt[0] == allCenterInt[1] &&
              allCenterInt[1] == allCenterInt[2]) ||
          (allCenterInt[1] == allCenterInt[2] &&
              allCenterInt[2] == allCenterInt[3]) ||
          (allCenterInt[2] == allCenterInt[3] &&
              allCenterInt[3] == allCenterInt[4])) {
        print("fullHouse");
        return 4;
      } else if (sameRankeFK.length > 0) {
        for (int i = 0; i < 5; i++) {
          if (allCenterInt[i] == conse.stringToInt(myHand[0])) {
            print("fullHouse");
            return 4;
          }
        }
      }

      //7.three of a kind
      for (int i = 0; i < 5; i++) {
        if (centerCard[i].rank == myHand[0].rank) {
          print("three of a kind");
          return 7;
        }
      }
      //8.two pair
      for (int i = 0; i < 4; i++) {
        if (allCenterInt[i] == allCenterInt[i + 1]) {
          print("two pair");
          return 8;
        }
      }
      print("pair");
      return 9;
    } else {
      //4.full house
      int x1 = 0;
      for (int i = 0; i < 5; i++) {
        if (myHand[0].rank == centerCard[i].rank) {
          x1++;
        }
      }
      int y1 = 0;
      for (int i = 0; i < 5; i++) {
        if (myHand[1].rank == centerCard[i].rank) {
          y1++;
        }
      }
      if ((x1 >= 1 && y1 == 2) || (y1 >= 1 && x1 == 2)) {
        print("full house");
        return 4;
      }
      List<Cards> all = List.from(centerCard);
      all.add(myHand[0]);
      all.add(myHand[1]);
      //6.straight
      List<int> allInt = conse.conse(all).toSet().toList();
      if (allInt.length > 4) {
        for (int i = 0; i < allInt.length - 4; i++) {
          if (allInt[i] - allInt[i + 4] == -4 &&
              conse.stringToInt(myHand[0]) <= allInt[i + 4] &&
              conse.stringToInt(myHand[0]) >= allInt[i] &&
              conse.stringToInt(myHand[1]) <= allInt[i + 4] &&
              conse.stringToInt(myHand[1]) >= allInt[i]) {
            print("straight");
            return 6;
          }
        }
      }
      //7.three of a kind
      List<int> allInt1 = conse.conse(all);
      for (int i = 0; i < allInt1.length - 2; i++) {
        if (allInt1[i] - allInt1[i + 2] == 0) {
          print("three of a kind");
          return 7;
        }
      }
      //8.two pair
      List<int> same = [];
      for (int i = 0; i < 6; i++) {
        if (allInt1[i] == allInt1[i + 1]) {
          i++;
          same.add(allInt1[i]);
        }
      }
      for (int i = 0; i < same.length; i++) {
        if (same[i] == conse.stringToInt(myHand[0]) ||
            same[i] == conse.stringToInt(myHand[1])) {
          print("twoPair");
          return 8;
        }
      }

      //9.pair
      for (int i = 0; i < 6; i++) {
        if (allInt1[i] == allInt1[i + 1]) {
          print("pair");
          return 9;
        }
      }
      return 10;
    }
  }
}
