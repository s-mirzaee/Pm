import 'package:bustem2/oddCalculator/handRanking.dart';

import '../cards.dart';

class winnerHand{
 rank r=new rank();
 int min=11;
 int minI;
 List<int> equals=[];
 List <int> value=[];
  List<int> winner(List<Cards> list){

    List<Cards> center=[list[list.length-5],list[list.length-4],list[list.length-3],list[list.length-2],list[list.length-1]];
    int n = ((list.length - 5) / 2).toInt();
    value.clear();
    for(int i=0;i<n;i++){
      //print(list[2*i].rank+".."+list[(2*i)+1].rank+"...every hand");
     value.add(r.ranking([list[2*i],list[(2*i)+1]], center));
    }
   // print(value.toString()+"final result");
equals.clear();
    List<int> bySort=List.from(value);
    bySort.sort();
    for(int i=0;i<value.length;i++){
      if(value[i]==bySort[0]){
          equals.add(i);
      }
    }
    if(equals.length==0){
      //equals.add(minI);
    }else{
      //TODO equals

    }
    //print("winners"+equals.toString());
    return equals;
  }

}