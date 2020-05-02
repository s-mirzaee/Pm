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
    size Size = new size(n);
    List<double> lefts = Size.lefts();
    List<double> tops = Size.tops();

    lefts = Size.lefts();
    tops = Size.tops();

    return Container(
      //color: Color.fromRGBO(0, 0, 0, 0.8),
      child: Stack(
        children: <Widget>[
          //header
          Container(
              //color: Colors.black,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    //TODO PUT WAGER
                    Container(
                      margin: EdgeInsets.only(top: 0, left: 50),
                      child: Text(
                        'Stack : \$ ${staticValues.getMoney()} ',
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 220, 75, 1),
                            fontFamily: 'MTCORSVA',
                            decoration: TextDecoration.none),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0, left: 270),
                      child: Text(
                        'Total Wager :\$ 255 ',
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
          Image.asset('assets/images/${list[1].id}.png'),
        ],
      ),
    );
  }
}
