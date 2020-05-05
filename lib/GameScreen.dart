import 'package:flutter/cupertino.dart';

import 'main.dart';
import 'table.dart';
import 'package:flutter/material.dart';
import 'cards.dart';
import 'board.dart';
import 'cardsList.dart';
import 'package:flutter_shine/flutter_shine.dart';


CardList handCard = new CardList();
List<Cards> chooseCards = handCard.cardlist(staticValues.getPlayerNo());
board Board = new board(chooseCards);

class StartGame extends StatefulWidget {
  @override
  _StartGameState createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {
  @override
  Widget build(BuildContext context) {
    return GameDesk();

  }
}




class GameDesk extends StatefulWidget {
  @override
  _GameDeskState createState() => _GameDeskState();
}

class _GameDeskState extends State<GameDesk> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GameScreen',
      home: Scaffold(
          body: Stack(children: <Widget>[
            table(),
            levels.levelUp(level),
            Container(
                padding: EdgeInsets.only(top: 60, left: 600),
                child: InkWell(highlightColor: Colors.white,
                  onTap: () {
                    if (level == 4) {
                      //TODO
                      newGame();
                    } else {
                      if(level==0){
                      if(staticValues.totalWager()!=0){
                        setState(() {
                          level++;
                        });
                      }else{
                        setState(() {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(backgroundColor: Color.fromRGBO(255, 220, 80, 1),

                                content: Container(width: 230,height: 30,child: Center(child: Text('at least,bet on a hand',style:
                                TextStyle(fontFamily: 'MTCORSVA',fontSize: 25,fontWeight: FontWeight.w500),),)
                                )
                              );
                            },
                          );
                        });
                      }}else{
                        setState(() {
                          level++;
                        });
                      }
                    }
                  },
                    child:level<4?Container(width: 75,height: 50,margin: EdgeInsets.only(top: 300,),//color: Colors.white,
                      child: Text(
                      "${staticValues.getPaseName()}",textDirection: TextDirection.rtl,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 220, 80, 1),
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MTCORSVA',
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 5.0,
                              color: Color.fromRGBO(255, 220, 80, 1),
                            ),
                          ],
                          decoration: TextDecoration.none),),)
                        :Text(''),

              )),
        ],
      )),
    );
  }
}
