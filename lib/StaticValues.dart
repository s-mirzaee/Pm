import 'package:bustem2/main.dart';
import 'package:flutter/material.dart';
import 'wagerAlert.dart';

class StaticValues {
  static bool isClick = false;

  bool getIsClick() {
    return isClick;
  }

  void setIsClick() {
    isClick = !isClick;
  }

  static int playerNo = 2;

  int getPlayerNo() {
    return playerNo;
  }

  void setPlayerNo(int p) {
    playerNo = p;
  }

  static String paseName = 'start';

  void setPhaseName(String name) {
    paseName = name;
  }

  String getPaseName() {
    return paseName;
  }

  static double money = 10000.0;

  void setMoney(double m) {
    money = m;
  }

  double getMoney() {
    return money;
  }

  static int selectNo;

  void setSelect(int i) {
    selectNo = i;
  }

  int getSelect() {
    return selectNo;
  }

  static List<int> wagers = [];

  void createWager(int n) {
    wagers.clear();
    for (int i = 0; i < n; i++) {
      wagers.add(0);
    }
  }

  int getWager(int n) {
    return wagers[n];
  }

  void setWager(int i, int wager) {
    wagers[i] = wager;
  }
  int totalWager(){
    int sum=0;
    for(int x=0;x<wagers.length;x++){
      sum=sum+wagers[x];
    }
    return sum;
  }
  int wagerCounter(){
    int count=0;
    for(int x=0;x<wagers.length;x++){
      if(wagers[x]!=0){
        count++;
      }
    }
    return count;
  }
  int totalReturn(){
    int totalMoney=0;
    for(int x=0;x<wagers.length;x++){
      if(oddCalculator.getOdd(x)==100){
        totalMoney=totalMoney+returns.returnCalculator(oddCalculator.getOdd(x), values.getValue(x)).round();
      }
    }
    return totalMoney;
  }

  static List<double> ranges = [];

  void createRange(int n) {
    ranges.clear();
    for (int i = 0; i < n; i++) {
      ranges.add(0);
    }
  }

  double getMin(int n) {
    return ranges[n];
  }

  void setMin(int i, double range) {
    ranges[i] = range;
  }

  List<double> getAllMin() {
    return ranges;
  }

  static MediaQueryData queryData;
  static double width;
  static double height;

  void init(BuildContext context) {
    queryData = MediaQuery.of(context);
    width = queryData.size.width;
    height = queryData.size.height;
  }
}
