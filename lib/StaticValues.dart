import 'package:bustem2/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StaticValues {
  static List<bool> isClick = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  bool getIsClick(int i) {
    return isClick[i];
  }

  void setIsClick(int i) {
    bool x1 = isClick[i];
    for (int x = 0; x < 10; x++) {
      isClick[x] = false;
    }
    isClick[i] = !x1;
   // print(isClick.toString());
  }

  static List<double> totalWin = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  double getTotalWin(int x) {
    return totalWin[x];
  }

  void setTotalwins(int i, double value) {
    totalWin[i] = totalWin[i] + value;
  }

  void resetTotalWin() {
    totalWin = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  }


  static List<double> totalTie = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  double getTotalTie(int x) {
    return totalTie[x];
  }

  void setTotalTie(int i, double value) {
    totalTie[i] = totalTie[i] + value;
  }

  void resetTotalTie() {
    totalTie = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
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

  String getPhaseName() {
    return paseName;
  }

  static int selectNo;

  void setSelect(int i) {
    selectNo = i;
  }

  int getSelect() {
    return selectNo;
  }

  static List<int> returnsList = [];

  void createReturn(int n) {
    returnsList.clear();
    for (int i = 0; i < n; i++) {
      returnsList.add(0);
    }
  }

  int getReturn(int n) {
    return returnsList[n];
  }

  void setReturn(int i, int r) {
    returnsList[i] = r;
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

  int totalWager() {
    int sum = 0;
    for (int x = 0; x < wagers.length; x++) {
      sum = sum + wagers[x];
    }
    return sum;
  }

  int wagerCounter() {
    int count = 0;
    for (int x = 0; x < wagers.length; x++) {
      if (wagers[x] != 0) {
        count++;
      }
    }
    return count;
  }

  int totalReturn() {
    int totalMoney = 0;
    for (int x = 0; x < wagers.length; x++) {
      if (oddCalculator.getOdd(x) != 0&&level>2) {
        totalMoney = totalMoney + getReturn(x);
      }
      if (oddCalculator.getTie(x) != 0&&level>2) {
        totalMoney = totalMoney + getWager(x);
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

  static List<int> shuffles = [];

  void setShuffle(List<int> l) {
    shuffles = l;
  }

  List<int> getShuffle() {
    return shuffles;
  }

  static double money = 10000;

  void setMoney(double m) {
    money = m;
  }

  double getMoney() {
    return money;
  }

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void saveNumber() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setDouble('savedNumber', money);
  }

  void loadNumber() async {
    final SharedPreferences prefs = await _prefs;
    final savedNumber = prefs.getDouble('savedNumber') ?? 10000;
    money = savedNumber;
  }

  void resetNumber() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setDouble('savedNumber', 10000);
  }

  static double height = 0;

  void setHeight(double i) {
    height = i;
  }

  double getHeight() {
    return height;
  }

  static double width = 0;

  void setWidth(double i) {
    width = i;
  }

  double getWidth() {
    return width;
  }
}
