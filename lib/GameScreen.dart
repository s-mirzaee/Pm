import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'oddCalculator/oddsEmulator.dart';
import 'table.dart';
import 'package:flutter/material.dart';
import 'cardsList.dart';



CardList handCard = new CardList();
oddsEmulator oddEmulator=new oddsEmulator();
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
                padding: EdgeInsets.only(top: 350, left: 598),
                child: InkWell(highlightColor: Colors.white,
                  onTap: () {
                      if(level==0){
                        if(staticValues.totalWager()!=0){
                          setState(() {
                            level++;
                            oddEmulator.emulator();

                          });
                        }else{
                          setState(() {
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(backgroundColor: Color.fromRGBO(255, 220, 80, 1),

                                    content: Container(width: 230,height: 30,child: Center(child: Text('bet at least on a hand',style:
                                    TextStyle(fontFamily: 'MTCORSVA',fontSize: 25,fontWeight: FontWeight.w600),),)
                                    )
                                );
                              },
                            );
                          });
                        }}else{
                        setState(() {
                          level++;
                          oddEmulator.emulator();
                        });
                      }

                  },
                  child:level<4?Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12)),border: Border(top: BorderSide(width: 5,color: Color.fromRGBO(240, 205, 95, 1)),right: BorderSide(width: 5,color: Color.fromRGBO(240, 205, 95, 1)),left: BorderSide(width: 5,color: Color.fromRGBO(240, 205, 95, 1)),bottom: BorderSide(width: 5,color: Color.fromRGBO(240, 205, 95, 1))),),
                      child: Container(padding: EdgeInsets.only(left: 2,right: 6,bottom: 5),//color: Colors.white,
                        child: Text(
                          "${staticValues.getPhaseName()}",textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 220, 80, 1),
                              fontSize: 27.5,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'MTCORSVA',
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(1.5, 1.5),
                                  blurRadius: 0,
                                  color: Color.fromRGBO(255, 220, 80, 0.5),
                                ),
                              ],
                              decoration: TextDecoration.none),),))
                      :Text(''),

                )),
          ],
          )),
    );
  }
}