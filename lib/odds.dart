//TODO odds calculator
//odds ro mohasebe mikone

import 'package:bustem2/main.dart';
import 'package:bustem2/oddCalculator/winnerHand.dart';

import 'cards.dart';
class odds{
  winnerHand wh=new winnerHand();
  static List<double> handOddes=[];
  void oddCalculator(List<Cards> cards){
    List<int> winners=wh.winner(cards);

    int n=((cards.length-5)/2).toInt();
    for(int i=0;i<n;i++){
      handOddes.add(100/n);
    }
    if(level==3){
      for(int j=0;j<winners.length;j++){
        handOddes[winners[j]]=100;
      }}


  }
  double getOdd(int i){
    return handOddes[i];
  }
}