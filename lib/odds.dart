import 'cards.dart';

class odds {
  static List<double> handOddes = [];
  static List<double> handTie = [];
  void oddCalculator(List<Cards> cards) {
    int n = ((cards.length - 5) / 2).toInt();
    for (int i = 0; i < n; i++) {
      handOddes.add(100 / n);
    }
    for (int i = 0; i < n; i++) {
      handTie.add(100 / n);
    }
  }

  double getOdd(int i) {
    return handOddes[i];
  }

  void setOdd(int i, double o) {
    handOddes[i] = o;
  }
  double getTie(int i) {
    return handTie[i];
  }

  void setTie(int i, double o) {
    handTie[i] = o;
  }
}
