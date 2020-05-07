import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'main.dart';
import 'oddCalculator/oddsEmulator.dart';
oddsEmulator oddEmulator=new oddsEmulator();
class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    var width = queryData.size.width;
    var height = queryData.size.height;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'MTCORSVA'),
        home: Container(
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/katie-harp-Em96eDRJPD8-unsplash.jpg'), fit: BoxFit.cover)),
            child: Row(children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: width/4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Transform.rotate(angle: math.pi / 9, child: Container(
                        child: Image.asset('assets/images/ace-of-hearts.png',height: height/8.65),
                      ),),

                      Transform.rotate(angle: -math.pi / 15, child: Container(
                        margin: EdgeInsets.only(top: height/14.5, bottom: height/15),
                        child: Image.asset('assets/images/ace-of-spades.png',height: height/8.65),
                      ),),

                      Transform.rotate(angle: math.pi / 15, child: Container(
                        child: Image.asset('assets/images/playing-cards.png',height: height/8.65),
                      ),)

                    ],)
              ),

              Container(
                margin: EdgeInsets.only(top: height/100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: FlatButton(
                        child: Text('Play', style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none)),
                        textColor: Colors.black,
                        onPressed: () {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return Hands();
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height/9, bottom: height/9.2),
                      child: FlatButton(
                        child: Text('Setting', style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none)),
                        textColor: Colors.black,
                        onPressed: () {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return Setting();
                            },
                          );
                        },
                      ),
                    ),

                    Container(
                      child: FlatButton(
                        child: Text('Help', style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none)
                        ),
                        textColor: Colors.black,
                        onPressed: () {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return Help();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
            )
        )
    );
  }
}

//number of players

bool MusicVolume = true;
bool SoundVolume = true;



class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    var width = queryData.size.width;
    final height = queryData.size.height;
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text('setting:',
        style: TextStyle(fontSize: 40,fontWeight: FontWeight.w100, color: Colors.yellow,fontFamily: 'MTCORSVA', decoration: TextDecoration.none),
      ),
      content: Container(
          color: Colors.black,
          height: height/7,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                Text('Play Sounds:',
                  style: TextStyle(fontSize: 28,fontWeight: FontWeight.w100, color: Colors.yellow,fontFamily: 'MTCORSVA', decoration: TextDecoration.none),
                ),
                CustomSwitch(

                  activeColor: Colors.amberAccent,
                  value: SoundVolume,
                  onChanged: (value) {


                    setState(() {
                      SoundVolume = value;

                    });
                  },
                ),


              ],
              ),
              SizedBox(height: height/35,),

              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                Text('Play Music:',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w100, color: Colors.yellow,fontFamily: 'MTCORSVA')),
                CustomSwitch(
                  activeColor: Colors.amberAccent,
                  value: MusicVolume,
                  onChanged: (value) {
                    setState(() {
                      MusicVolume = value;

                    });
                  },
                ),


              ],
              ),

            ],
          )
      ),
      actions: <Widget>[
        FlatButton(onPressed: () {
          print("PlaySound: $SoundVolume");
          print("PlayMusic : $MusicVolume");
          Navigator.pushNamed(context,'/');

        },
            child: Text('ok', style: TextStyle(fontSize: 30,fontWeight: FontWeight.w100, color: Colors.yellow,fontFamily: 'MTCORSVA'),))
      ],
    );
  }
}

class Hands extends StatefulWidget {
  @override
  _HandsState createState() => new _HandsState();
}

class _HandsState extends State<Hands> {

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    var height = queryData.size.height;
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Center( child:
      Text('Number of Hands:', style: TextStyle(fontSize: 30,fontWeight: FontWeight.w100, color: Colors.yellow,fontFamily: 'MTCORSVA'),),
      ),
      content: Container(
        color: Colors.black,
        height: height/20,
        child: Center(
          child: DropdownButton<int>(
            value: staticValues.getPlayerNo(),
            onChanged: (int value) {
              setState(() {
                staticValues.setPlayerNo(value);
              });
            },
            //maghadir momken baraye bazikonan
            items: <int>[ 2, 3, 4, 5, 6, 7, 8, 9, 10]
                .map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString(), style: TextStyle(fontSize: 27,fontWeight: FontWeight.w500, color: Color.fromRGBO(166, 166, 166,1),fontFamily: 'MTCORSVA'),),
              );
            }).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(onPressed: () {
          staticValues.createRange(staticValues.getPlayerNo());
          staticValues.createWager(staticValues.getPlayerNo());
          staticValues.createReturn(staticValues.getPlayerNo());
          values.create(staticValues.getPlayerNo());
          oddCalculator.oddCalculator(chooseCards);
          oddEmulator.emulator();


          Navigator.pushNamed(context,'/Game');
        },
            child: Text('ok', style: TextStyle(fontSize: 30,fontWeight: FontWeight.w100, color: Colors.yellow,fontFamily: 'MTCORSVA'),
            ))
      ],
    );
  }
}

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    var height = queryData.size.height;
    return AlertDialog(backgroundColor: Colors.black,
      title: Text('How To Play:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,fontFamily: 'MTCORSVA',color: Colors.yellow),),

      content:Container(child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: height/25,
            ),
            Text('Despite the mind-game aspect of poker, usually the highest-value hand determines the winner – unless youre bluffing of course! It’s important to aim to make the strongest poker hand – especially for beginners. The best high hand in most poker formats is a Royal Flush.'
                +'\n' +'Position is everything in poker and all action centres around the Button – except for Stud. Early Position, like the Small and Big Blinds, are to the left of the Button and act first after the flop. Seats to the right of the Button are Late Position (acting last post-flop), and seats in between are Middle Position.'
                +'\n'+'Pre-flop action begins with the player seated left of the BB (Big Blind). Action then continues clockwise with the BB acting last. Pre-flop, players have three courses of action; folding, calling, or raising. Once all players have acted and the pot is right the betting round ends.'
                +'\n'+'The Flop is made up of the first 3 of 5 community cards. Post-flop, players have the option to check (bet nothing), bet, call, fold or raise – depending on their position at the table and any other prior action.'
                +'\n'+'This fourth community card is dealt directly after the post-flop betting round comes to an end. Youll have the same options post-flop as pre-flop; check (bet nothing), bet, call, fold or raise – depending on your position and any prior action.'
                +'\n'+'When you finally arrive at the river – the fifth community card – you should have a hand that can win. Or you might even try a bluff if everyone checks to it to you. Plus, there are no more cards that can beat you!'
                +'\n'+'For a showdown to happen, there have to be at least 2 players left. The winning player must reveal their cards to win the hand. The winner is determined by who has the best 5-card hand. That player gets to scoop in the pot. In Omaha, there are two pots to scoop!'
                +'\n'+'Once the winner has been settled on, it’s time to shuffle up and deal the next round. Whether you’re playing Texas Hold’em, Omaha Hi or Omaha Hi/Lo; Tournaments, Sit & Gos or at the Cash Tables, there’s always a seat with your name on it at 888poker!'
              ,style: TextStyle(fontFamily: 'MTCORSVA',color: Colors.yellow),)
          ],
        ),
      ),
      ),
    );
  }
}