import 'package:bustem2/MenuScreen.dart';
import 'package:bustem2/wagerAlert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'StaticValues.dart';
import 'main.dart';
import 'oddCalculator/oddsEmulator.dart';
import 'table.dart';
import 'package:flutter/material.dart';
import 'cardsList.dart';

CardList handCard = new CardList();
oddsEmulator oddEmulator = new oddsEmulator();

class StartGame extends StatefulWidget {
  @override
  _StartGameState createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    print(staticValues.getMoney());
    print(staticValues.totalWager());
    (staticValues.getMoney() >= 1 || staticValues.totalWager() >= 1)
        ? print('1')
        : print('2');
    return (staticValues.getMoney() >= 1 || staticValues.totalWager() >= 1)
        ? GameDesk()
        : NoEnough();
  }
}

class GameDesk extends StatefulWidget {
  @override
  _GameDeskState createState() => _GameDeskState();
}

class _GameDeskState extends State<GameDesk> {
  Color boxColor = wagerAlert.boxColor;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return SafeArea(
        top: false,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bust\'em Poker',
          home: Scaffold(
              body: Stack(children: <Widget>[
                table(),
                levels.levelUp(level),
                Container(
                  //color: Colors.cyanAccent,
                  padding:
                      EdgeInsets.only(top: height * 0.86, left: width * 0.86),
                  child: InkWell(
                    highlightColor: Colors.white,
                    onTap: () {
                      StaticValues.isClick = [
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
                      if (level == 0) {
                        if (staticValues.totalWager() != 0) {
                          setState(() {
                            // StaticValues.isClick = [false, false, false, false, false, false, false, false, false, false];
                            boxColor = Color.fromRGBO(240, 205, 95, 1);
                            level++;
                            oddEmulator.emulator();
                          });
                        } else {
                          setState(() {
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    backgroundColor:
                                        Color.fromRGBO(255, 220, 80, 1),
                                    content: Container(
                                        width: 230,
                                        height: 30,
                                        child: Center(
                                          child: Text(
                                            'Bet at least on a hand',
                                            style: TextStyle(
                                                fontFamily: 'MTCORSVA',
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )));
                              },
                            );
                          });
                        }
                      } else {
                        setState(() {
                          Color boxColor = wagerAlert.boxColor;
                          level++;
                          oddEmulator.emulator();
                        });
                      }
                    },
                    child: level < 4
                        ? Container(
                            padding: EdgeInsets.only(
                                left: 2, top: 2, right: 7, bottom: 4),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              border: Border(
                                  top: BorderSide(
                                      width: 5,
                                      color: Color.fromRGBO(240, 205, 95, 1)),
                                  right: BorderSide(
                                      width: 5,
                                      color: Color.fromRGBO(240, 205, 95, 1)),
                                  left: BorderSide(
                                      width: 5,
                                      color: Color.fromRGBO(240, 205, 95, 1)),
                                  bottom: BorderSide(
                                      width: 5,
                                      color: Color.fromRGBO(240, 205, 95, 1))),
                            ),
                            child: Text(
                              "${staticValues.getPhaseName()}",
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 220, 80, 1),
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'MTCORSVA',
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(1.5, 1.5),
                                      blurRadius: 0,
                                      color: Color.fromRGBO(255, 220, 80, 0.5),
                                    ),
                                  ],
                                  decoration: TextDecoration.none),
                            ),
                          )
                        : Text(''),
                  )),
            ],
          )),
        ));
  }
}

class NoEnough extends StatefulWidget {
  @override
  _NoEnoughState createState() => _NoEnoughState();
}

class _NoEnoughState extends State<NoEnough> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                  'Warning:',
                  style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'MTCORSVA',
                      decoration: TextDecoration.none),
                ),
                Container(
                  child: Text(
                    'You Have No Money',
                    style: TextStyle(
                        fontSize: 39,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'MTCORSVA',
                        decoration: TextDecoration.none),
                  ),
                  margin: EdgeInsets.only(top: 10),
                ),
                FlatButton(
                    padding: EdgeInsets.only(top: 20),
                    onPressed: () {
                      staticValues.resetNumber();
                      Route route = MaterialPageRoute(
                          builder: (context) => MenuScreen());
                      Navigator.push(context, route);
                    },
                    child: Container(
                        child: Center(
                          child: Text(
                            'Reste Money',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w100,
                                color: Color.fromRGBO(240, 205, 95, 1),
                                fontFamily: 'MTCORSVA'),
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
                        width: 200,height: 50,
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
