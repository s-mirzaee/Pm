
import 'dart:math';

import 'package:bustem2/main.dart';

import 'cards.dart';


//faghat list card hast
class CardList {
  List<Cards> cards = [
    //heart

    Cards(1, 'heart', 'ha'),
    Cards(2, 'heart', 'hb'),
    Cards(3, 'heart', 'hc'),
    Cards(4, 'heart', 'hd'),
    Cards(5, 'heart', 'he'),
    Cards(6, 'heart', 'hf'),
    Cards(7, 'heart', 'hg'),
    Cards(8, 'heart', 'hh'),
    Cards(9, 'heart', 'hi'),
    Cards(10, 'heart', 'hj'),
    Cards(11, 'heart', 'hk'),
    Cards(12, 'heart', 'hl'),
    Cards(13, 'heart', 'hm'),
    //spade

    Cards(1, 'spade', 'sa'),
    Cards(2, 'spade', 'sb'),
    Cards(3, 'spade', 'sc'),
    Cards(4, 'spade', 'sd'),
    Cards(5, 'spade', 'se'),
    Cards(6, 'spade', 'sf'),
    Cards(7, 'spade', 'sg'),
    Cards(8, 'spade', 'sh'),
    Cards(9, 'spade', 'si'),
    Cards(10, 'spade', 'sj'),
    Cards(11, 'spade', 'sk'),
    Cards(12, 'spade', 'sl'),
    Cards(13, 'spade', 'sm'),
    //diamond

    Cards(1, 'diamond', 'da'),
    Cards(2, 'diamond', 'db'),
    Cards(3, 'diamond', 'dc'),
    Cards(4, 'diamond', 'dd'),
    Cards(5, 'diamond', 'de'),
    Cards(6, 'diamond', 'df'),
    Cards(7, 'diamond', 'dg'),
    Cards(8, 'diamond', 'dh'),
    Cards(9, 'diamond', 'di'),
    Cards(10, 'diamond', 'dj'),
    Cards(11, 'diamond', 'dk'),
    Cards(12, 'diamond', 'dl'),
    Cards(13, 'diamond', 'dm'),
    //club

    Cards(1, 'club', 'ca'),
    Cards(2, 'club', 'cb'),
    Cards(3, 'club', 'cc'),
    Cards(4, 'club', 'cd'),
    Cards(5, 'club', 'ce'),
    Cards(6, 'club', 'cf'),
    Cards(7, 'club', 'cg'),
    Cards(8, 'club', 'ch'),
    Cards(9, 'club', 'ci'),
    Cards(10, 'club', 'cj'),
    Cards(11, 'club', 'ck'),
    Cards(12, 'club', 'cl'),
    Cards(13, 'club', 'cm')
  ];

//list card haye random ro mide
  List cardlist(int palyerNo) {
    int n = (2 * palyerNo) + 5;
    List<int> list = new List<int>.generate(52, (int index) => index);
 // list.shuffle();

    var random = new Random();
   for (var i = list.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = list[i];
      list[i] = list[n];
      list[n] = temp;
    }
    list.shuffle();
    staticValues.setShuffle(list);
    print(list);
    List<Cards> handList = new List();
    for (int i = 0; i < n; i++) {
      handList.add(cards[list[i]]);
    }
    return handList;
  }
}
