class returnMoney {
  double returnCalculator(double percent, double wager) {
    if (percent == 0) {
      return 0;
    } else {
      double returnMoney;
      returnMoney = ((100 * wager) / percent);
      return returnMoney;
    }
  }

//double updateMoney(double won)

}
