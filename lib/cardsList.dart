import 'cards.dart';


//faghat list card hast
class CardList {
  List<Cards> cards = [
    //heart
    Cards('1', 'heart', 'Ah'),
    Cards('2', 'heart', '2h'),
    Cards('3', 'heart', '3h'),
    Cards('4', 'heart', '4h'),
    Cards('5', 'heart', '5h'),
    Cards('6', 'heart', '6h'),
    Cards('7', 'heart', '7h'),
    Cards('8', 'heart', '8h'),
    Cards('9', 'heart', '9h'),
    Cards('10', 'heart', '10h'),
    Cards('jack', 'heart', 'Jh'),
    Cards('queen', 'heart', 'Qh'),
    Cards('king', 'heart', 'Kh'),
    //spade
    Cards('1', 'spade', 'As'),
    Cards('2', 'spade', '2s'),
    Cards('3', 'spade', '3s'),
    Cards('4', 'spade', '4s'),
    Cards('5', 'spade', '5s'),
    Cards('6', 'spade', '6s'),
    Cards('7', 'spade', '7s'),
    Cards('8', 'spade', '8s'),
    Cards('9', 'spade', '9s'),
    Cards('10', 'spade', '10s'),
    Cards('jack', 'spade', 'Js'),
    Cards('queen', 'spade', 'Qs'),
    Cards('king', 'spade', 'Ks'),
    //diamond
    Cards('1', 'diamond', 'Ad'),
    Cards('2', 'diamond', '2d'),
    Cards('3', 'diamond', '3d'),
    Cards('4', 'diamond', '4d'),
    Cards('5', 'diamond', '5d'),
    Cards('6', 'diamond', '6d'),
    Cards('7', 'diamond', '7d'),
    Cards('8', 'diamond', '8d'),
    Cards('9', 'diamond', '9d'),
    Cards('10', 'diamond', '10d'),
    Cards('jack', 'diamond', 'Jd'),
    Cards('queen', 'diamond', 'Qd'),
    Cards('king', 'diamond', 'Kd'),
    //club
    Cards('1', 'club', 'Ac'),
    Cards('2', 'club', '2c'),
    Cards('3', 'club', '3c'),
    Cards('4', 'club', '4c'),
    Cards('5', 'club', '5c'),
    Cards('6', 'club', '6c'),
    Cards('7', 'club', '7c'),
    Cards('8', 'club', '8c'),
    Cards('9', 'club', '9c'),
    Cards('10', 'club', '10c'),
    Cards('jack', 'club', 'Jc'),
    Cards('queen', 'club', 'Qc'),
    Cards('king', 'club', 'Kc')
  ];

//list card haye random ro mide
  List cardlist(int palyerNo) {
    int n = (2 * palyerNo) + 5;
    var list = new List<int>.generate(52, (int index) => index);
    list.shuffle();
    print(list);
    List<Cards> handList = new List();
    for (int i = 0; i < n; i++) {
      handList.add(cards[list[i]]);
    }
    return handList;
  }
}
