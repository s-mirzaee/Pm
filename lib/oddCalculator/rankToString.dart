import 'package:flutter/material.dart';

import '../cards.dart';

class consecutive{
  int stringToInt(Cards c){

      if(c.rank=='1'){
       return 1;
      }
      if(c.rank=='2'){
        return 2;
      }
      if(c.rank=='3'){
        return 3;
      }
      if(c.rank=='4'){
        return 4;
      }
      if(c.rank=='5'){
        return 5;
      }
      if(c.rank=='6'){
        return 6;
      }
      if(c.rank=='7'){
        return 7;
      }
      if(c.rank=='8'){
        return 8;
      }
      if(c.rank=='9'){
        return 9;
      }
      if(c.rank=='10'){
        return 10;
      }
      if(c.rank=='jack'){
        return 11;
      }
      if(c.rank=='queen'){
        return 12;
      }
      if(c.rank=='king'){
        return 13;
      }
  }
  List<int> conse(List<Cards> c){

    List<int> value=[];
    for(int i=0;i<c.length;i++){
      value.add(stringToInt(c[i]));
    }
    value.sort();
    return value;
  }
}