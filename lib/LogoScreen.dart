import 'dart:io';
import 'package:bustem2/GameScreen.dart' as screen;
import 'package:bustem2/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MenuScreen.dart';
import 'board.dart';
import 'dart:math';

class logoScreen extends StatefulWidget {
  @override
  _logoScreenState createState() => _logoScreenState();
}

class _logoScreenState extends State<logoScreen> {
  @override
  Widget build(BuildContext context) {
    var width = staticValues.getWidth();
    var height = staticValues.getHeight();
    var winAmount = staticValues.totalReturn();
    var win=staticValues.totalReturn()-staticValues.totalWager();
    staticValues.saveNumber();
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          child: child,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/katie-harp-Em96eDRJPD8-unsplash.jpg'),
                      fit: BoxFit.cover))),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  win>=0?'You Won :':'you Lose:',
                  style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'MTCORSVA',
                      decoration: TextDecoration.none),
                ),
                Container(
                  child: Text(
                    '\$${win.abs()}',
                    style: TextStyle(
                        fontSize: 39,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'MTCORSVA',
                        decoration: TextDecoration.none),
                  ),
                  margin: EdgeInsets.only(top: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (winAmount > 0)
                            (staticValues
                                .setMoney(staticValues.getMoney() + winAmount));
                        });

                        Route route = MaterialPageRoute(
                            builder: (context) => MenuScreen());
                        Navigator.push(context, route);
                      },
                      child: Container(
                        //color: Colors.black12,
                        child: Center(
                          child: Text(
                            'Play Again',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(240, 195, 85, 1),
                                fontFamily: 'MTCORSVA',
                                decoration: TextDecoration.none),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                spreadRadius: 1.5,
                                offset: Offset(2, 4))
                          ],
                          color: Colors.black,
                        ),
                        margin: EdgeInsets.only(
                            top: height * 0.15, right: width * 0.07),
                        height: 55,
                        width: 165,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (winAmount > 0)
                            (staticValues
                                .setMoney(staticValues.getMoney() + winAmount));
                        });
                        exit(0);
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            'Quit',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(240, 195, 85, 1),
                                fontFamily: 'MTCORSVA',
                                decoration: TextDecoration.none),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                spreadRadius: 1.5,
                                offset: Offset(2, 4))
                          ],
                          color: Colors.black,
                        ),
                        margin: EdgeInsets.only(top: height * 0.15),
                        height: 55,
                        width: 165,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (winAmount > 0)
                            (staticValues
                                .setMoney(staticValues.getMoney() + winAmount));
                        });

                        level = 0;
                        staticValues.createRange(staticValues.getPlayerNo());
                        staticValues.createWager(staticValues.getPlayerNo());
                        staticValues.createReturn(staticValues.getPlayerNo());
                        values.create(staticValues.getPlayerNo());
                        chooseCards = handCard.cardlist(staticValues.getPlayerNo()) ;
                        oddCalculator.oddCalculator(chooseCards);
                        Board = new board(chooseCards);
                        staticValues.totalReturn();
                        //print(chooseCards.length.toString());
                        oddEmulator.emulator();


                        Route route = MaterialPageRoute(
                            builder: (context) => screen.StartGame());
                        Navigator.push(context, route);
                      },
                      child: Container(
                        //color: Colors.black12,
                        child: Center(
                          child: Text(
                            'Repeat',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(240, 195, 85, 1),
                                fontFamily: 'MTCORSVA',
                                decoration: TextDecoration.none),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                spreadRadius: 1.5,
                                offset: Offset(2, 4))
                          ],
                          color: Colors.black,
                        ),
                        margin: EdgeInsets.only(
                            top: height * 0.15, left: width * 0.07),
                        height: 55,
                        width: 165,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
