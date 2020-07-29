import 'package:bustem2/wagerAlert.dart';
import 'main.dart';
import 'oneHand.dart';
import 'package:flutter/material.dart';
import 'cards.dart';


class board {
  List<Cards> list;

  board(this.list);

  Widget hands() {
    int n = ((list.length - 5) / 2).toInt();
    return Container(
      child: Stack(
        children: <Widget>[
          //header
          Container(
              child: Container(margin: EdgeInsets.only(top: height*0.02),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                  Container(margin: EdgeInsets.only(left: width*0.04),
                   child: Text(
                    'Stack : \$ ${staticValues.getMoney().round()} ',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(240, 205, 95, 1),
                        fontFamily: 'MTCORSVA',
                        decoration: TextDecoration.none),
                  ),
                ),
                 Container(margin: EdgeInsets.only(left: width*0.48),
                  child: Text(
                    'Total Wager :\$ ${staticValues.totalWager()} ',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(240, 205, 95, 1),
                        fontFamily: 'MTCORSVA',
                        decoration: TextDecoration.none),
                  ),
                ),
              ],
            ),
          )),
          for (int i = 0; i < n; i++)
            Stack(
              children: <Widget>[
                Hand(i, list),
              ],
            )
        ],
      ),
    );
  }

  Widget flop() {
    int n = list.length - 5;

    return Container(//color: Colors.cyan,
      height: 61,
      margin:  EdgeInsets.only(left: width*0.3, top: height*0.39),
      child: Row(
        children: <Widget>[
          Image.asset('assets/images/${list[n].id}.png'),
          Container(
            width: 7,
          ),
          Image.asset('assets/images/${list[n + 1].id}.png'),
          Container(
            width: 7,
          ),
          Image.asset('assets/images/${list[n + 2].id}.png'),
        ],
      ),
    );
  }

  Widget turn() {
    int n = list.length;
    return Container(
      height: 61,
      margin:  EdgeInsets.only(left: width*0.5, top: height* 0.39),
      child: Row(
        children: <Widget>[
          Image.asset('assets/images/${list[n - 2].id}.png'),
        ],
      ),
    );
  }

  Widget river() {
    int n = list.length;
    return Container(
      height: 61,
      margin:  EdgeInsets.only(left: width*0.57, top: height*0.39),
      child: Row(
        children: <Widget>[
          Image.asset('assets/images/${list[n - 1].id}.png'),
        ],
      ),
    );
  }
}
