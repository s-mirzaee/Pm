import 'main.dart';
import 'oneHand.dart';
import 'package:flutter/material.dart';
import 'cards.dart';
import 'size.dart';

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
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Text(
                        'Stack : \$ ${staticValues.getMoney().round()} ',
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 220, 75, 1),
                            fontFamily: 'MTCORSVA',
                            decoration: TextDecoration.none),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 290),
                      child: Text(
                        'Total Wager :\$ ${staticValues.totalWager()} ',
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 220, 70, 1),
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
    return // Transform.rotate(angle: math.pi/2, child:
      Container(height: 53.5, margin: const EdgeInsets.only(left: 230, top: 160),
        child: Row(
          children: <Widget>[
            Image.asset('assets/images/${list[n].id}.png'),
            Container(
              width: 5,
            ),
            Image.asset('assets/images/${list[n + 1].id}.png'),
            Container(
              width: 5,
            ),
            Image.asset('assets/images/${list[n + 2].id}.png'),
          ],
        ),
      );
  }

  Widget turn() {
    int n = list.length;
    return Container(

      height: 53.5,
      margin: const EdgeInsets.only(left: 365, top: 160),
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

      height: 53.5,
      margin: const EdgeInsets.only(left: 413, top: 160),
      child: Row(
        children: <Widget>[
          Image.asset('assets/images/${list[n-1].id}.png'),
        ],
      ),
    );
  }
}