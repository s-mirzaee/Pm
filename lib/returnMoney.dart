import 'package:flutter/material.dart';
class returnMoney{

  double returnCalculator(double percent,double wager){
    double returnMoney;
    returnMoney=((100*wager)/percent);
    return returnMoney;

  }

}