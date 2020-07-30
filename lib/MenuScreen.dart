import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'board.dart';
import 'main.dart';
import 'oddCalculator/oddsEmulator.dart';
import 'package:flutter_circular_text/circular_text.dart';

oddsEmulator oddEmulator = new oddsEmulator();

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
    MediaQueryData queryData = MediaQuery.of(context);

    staticValues.setWidth(queryData.size.width);
    staticValues.setHeight(queryData.size.height);
    var width = staticValues.getWidth();
    var height = staticValues.getHeight();

    return SafeArea(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'MTCORSVA'),
            home: Stack(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/katie-harp-Em96eDRJPD8-unsplash.jpg'),
                        fit: BoxFit.cover)),
                child: Row(
                  children: <Widget>[
                    Container(//color: Colors.black12,
                        margin: EdgeInsets.only(left: width*0.25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Transform.rotate(
                              angle: math.pi / 9,
                              child: Container(
                                child: Image.asset(
                                    'assets/images/ace-of-hearts.png',
                                    height: height*0.122),
                              ),
                            ),
                            Transform.rotate(
                              angle: -math.pi / 15,
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: height / 14.5, bottom: height / 15),
                                child: Image.asset(
                                    'assets/images/ace-of-spades.png',
                                    height: height*0.125),
                              ),
                            ),
                            Transform.rotate(
                              angle: math.pi / 15,
                              child: Container(
                                child: Image.asset(
                                    'assets/images/playing-cards.png',
                                    height: height* 0.125),
                              ),
                            ),
                            Container(child: Transform.rotate(
                              angle: -math.pi / 12,
                              child: Container(
                                child: Image.asset(
                                    'assets/images/ace-of-clubs.png',
                                    height: height *0.125),
                              ),
                            ),
                              margin: EdgeInsets.only(top: 35),
                            )
                          ],
                        )),
                    Container(
                      //margin: EdgeInsets.only(bottom: (height*0.5)-200),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: FlatButton(
                              child: Text('Play',
                                  style: TextStyle(
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      decoration: TextDecoration.none)),
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
                            margin: EdgeInsets.only(top: height*0.07),
                            child: FlatButton(
                              child: Text('Setting',
                                  style: TextStyle(
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      decoration: TextDecoration.none)),
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
                          Container(margin: EdgeInsets.only(top: height*0.076),
                            child: FlatButton(
                              child: Text('Help',
                                  style: TextStyle(
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      decoration: TextDecoration.none)),
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
                          Container(margin: EdgeInsets.only(top: height*0.075),
                            child: FlatButton(
                              child: Text('About us',
                                  style: TextStyle(
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      decoration: TextDecoration.none)),
                              textColor: Colors.black,
                              onPressed: () {
                                return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return About();
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*Stack(children: <Widget>[
                      Container(child:
                        Transform.rotate(angle: 45, child:
                          Text('Business',style: TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize: 35,fontFamily: 'MTCORSVA',),),
                        ),
                        margin: EdgeInsets.only(top: 160,left: 10),
                      ),
                      Container(child:
                        Transform.rotate(angle: -44.9, child:
                          Text('strategy',style: TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize: 35,fontFamily: 'MTCORSVA'),),
                        ),
                        margin: EdgeInsets.only(left: 125,top: 158),
                      ),
                      Container(child:
                        Transform.rotate(angle: 45, child:
                          Text('empowered',style: TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize: 35,fontFamily: 'MTCORSVA'),),
                        ),
                        margin: EdgeInsets.only(left: 125,top: 10),
                      ),
                      Container(child:
                        Transform.rotate(angle: -44.9, child:
                          Text('by poker',style: TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize: 35,fontFamily: 'MTCORSVA'),),
                        ),
                      ),
                    ],
                    ),*/
                  ],
                ),
              ),
              Container(
                child:CircularText(children: [
                  TextItem(
                    text: Text(
                      "strategy empowered by poker",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.black26,
                          fontWeight: FontWeight.bold,fontFamily: 'MTCORSVA'
                      ),
                    ),
                    space: 9.7,
                    startAngle: 180,
                    startAngleAlignment: StartAngleAlignment.center,
                    //direction: CircularTextDirection.clockwise,
                  ),
                ],
                  radius: 110,
                  position: CircularTextPosition.inside,
                  //backgroundPaint: Paint()..color = Colors.grey.shade200,
                ),
                margin: EdgeInsets.only(left: width*0.02,top: height*0.1),
              ),
              Container(child: CircularText(
                children: [
                  TextItem(
                    text: Text(
                      "Business",
                      style: TextStyle(
                          fontSize: 33,
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                          fontWeight: FontWeight.bold,fontFamily: 'MTCORSVA'
                      ),
                    ),
                    space: 33,
                    startAngle: 10,
                    startAngleAlignment: StartAngleAlignment.center,
                    //direction: CircularTextDirection.anticlockwise,
                  ),
                ],
                radius: 58,
                position: CircularTextPosition.inside,
                //backgroundPaint: Paint()..color = Colors.grey.shade200,
              ),
                margin: EdgeInsets.only(left: width*0.45,top: height*0.63),
              ),
              Container(child: CircularText(
                children: [
                  TextItem(
                    text: Text(
                      "Business strategy empowered by poker",
                      style: TextStyle(
                          fontSize: 29,
                          color: Color.fromRGBO(0, 0, 0, 0.17),
                          fontWeight: FontWeight.bold,fontFamily: 'MTCORSVA'
                      ),
                    ),
                    space: 9.5,
                    startAngle: 90,
                    startAngleAlignment: StartAngleAlignment.center,
                    //direction: CircularTextDirection.clockwise,
                  ),
                ],
                radius: 122,
                position: CircularTextPosition.inside,
                //backgroundPaint: Paint()..color = Colors.grey.shade200,
              ),
                margin: EdgeInsets.only(left: width*0.52,top: height*0.03),
              ),
              Container(child: CircularText(
                children: [
                  TextItem(
                    text: Text(
                      "Business strategy empowered by poker",
                      style: TextStyle(
                          fontSize: 40,
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                          fontWeight: FontWeight.bold,fontFamily: 'MTCORSVA'
                      ),
                    ),
                    space: 9.7,
                    //startAngle: 0,
                    startAngleAlignment: StartAngleAlignment.center,
                    //direction: CircularTextDirection.clockwise,
                  ),
                ],
                radius: 160,
                position: CircularTextPosition.inside,
                //backgroundPaint: Paint()..color = Colors.grey.shade200,
              ),
                margin: EdgeInsets.only(left: width*0.65,top: height*0.26),
              ),
            ],)
          /**/
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    //MediaQueryData queryData = MediaQuery.of(context);
    //final height = queryData.size.height;
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text(
        'setting:',
        style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w100,
            color: Colors.yellow,
            fontFamily: 'MTCORSVA',
            decoration: TextDecoration.none),
      ),
      content: Container(
          color: Colors.black,
          height: staticValues.getHeight(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Play Sounds:',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w100,
                        color: Colors.yellow,
                        fontFamily: 'MTCORSVA',
                        decoration: TextDecoration.none),
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
              SizedBox(
                height: staticValues.getHeight() / 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Play Music:',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w100,
                          color: Colors.yellow,
                          fontFamily: 'MTCORSVA')),
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
              FlatButton(
                  padding: EdgeInsets.only(top: 20),
                  onPressed: () {
                    staticValues.resetNumber();
                    Navigator.pushNamed(context, '/');
                  },
                  child: Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Text(
                        'Reste Money',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w100,
                            color: Colors.yellow,
                            fontFamily: 'MTCORSVA'),
                      )))
            ],
          )),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              print("PlaySound: $SoundVolume");
              print("PlayMusic : $MusicVolume");
              Navigator.pushNamed(context, '/');
            },
            child: Text(
              'ok',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w100,
                  color: Colors.yellow,
                  fontFamily: 'MTCORSVA'),
            )),
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
      title: Center(
        child: Text(
          'Number of Hands:',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w100,
              color: Colors.yellow,
              fontFamily: 'MTCORSVA'),
        ),
      ),
      content: Container(
        color: Colors.black,
        height: height / 10,
        child: Center(
          child: DropdownButton<int>(
            value: staticValues.getPlayerNo(),
            onChanged: (int value) {
              setState(() {
                staticValues.setPlayerNo(value);
              });
            },
            //maghadir momken baraye bazikonan
            items: <int>[2, 3, 4, 5, 6, 7, 8, 9, 10]
                .map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(
                  value.toString(),
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(166, 166, 166, 1),
                      fontFamily: 'MTCORSVA'),
                ),
              );
            }).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              level = 0;
              staticValues.createRange(staticValues.getPlayerNo());
              staticValues.createWager(staticValues.getPlayerNo());
              staticValues.createReturn(staticValues.getPlayerNo());
              values.create(staticValues.getPlayerNo());
              chooseCards = handCard.cardlist(staticValues.getPlayerNo());
              oddCalculator.oddCalculator(chooseCards);
              Board = new board(chooseCards);
              //print(chooseCards.length.toString());
              oddEmulator.emulator();
              staticValues.loadNumber();

              Navigator.pushNamed(context, '/Game');
            },
            child: Text(
              'ok',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w100,
                  color: Colors.yellow,
                  fontFamily: 'MTCORSVA'),
            ))
      ],
    );
  }
}

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //MediaQueryData queryData = MediaQuery.of(context);
    //var height = queryData.size.height;
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text(
        'How To Play:',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: 'MTCORSVA',
            color: Color.fromRGBO(240, 205, 95, 1)),
      ),
      content: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: staticValues.getHeight()*0.1,
              ),
              Text(
                'Despite the mind-game aspect of poker, usually the highest-value hand determines the winner – unless youre bluffing of course! It’s important to aim to make the strongest poker hand – especially for beginners. The best high hand in most poker formats is a Royal Flush.' +
                    '\n' +
                    'Position is everything in poker and all action centres around the Button – except for Stud. Early Position, like the Small and Big Blinds, are to the left of the Button and act first after the flop. Seats to the right of the Button are Late Position (acting last post-flop), and seats in between are Middle Position.' +
                    '\n' +
                    'Pre-flop action begins with the player seated left of the BB (Big Blind). Action then continues clockwise with the BB acting last. Pre-flop, players have three courses of action; folding, calling, or raising. Once all players have acted and the pot is right the betting round ends.' +
                    '\n' +
                    'The Flop is made up of the first 3 of 5 community cards. Post-flop, players have the option to check (bet nothing), bet, call, fold or raise – depending on their position at the table and any other prior action.' +
                    '\n' +
                    'This fourth community card is dealt directly after the post-flop betting round comes to an end. Youll have the same options post-flop as pre-flop; check (bet nothing), bet, call, fold or raise – depending on your position and any prior action.' +
                    '\n' +
                    'When you finally arrive at the river – the fifth community card – you should have a hand that can win. Or you might even try a bluff if everyone checks to it to you. Plus, there are no more cards that can beat you!' +
                    '\n' +
                    'For a showdown to happen, there have to be at least 2 players left. The winning player must reveal their cards to win the hand. The winner is determined by who has the best 5-card hand. That player gets to scoop in the pot. In Omaha, there are two pots to scoop!' +
                    '\n' +
                    'Once the winner has been settled on, it’s time to shuffle up and deal the next round. Whether you’re playing Texas Hold’em, Omaha Hi or Omaha Hi/Lo; Tournaments, Sit & Gos or at the Cash Tables, there’s always a seat with your name on it at 888poker!',
                style: TextStyle(fontFamily: 'MTCORSVA', color: Color.fromRGBO(240, 205, 95, 1)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text(
        'Contact us:',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color.fromRGBO(240, 205, 95, 1)),
      ),
      content: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: staticValues.getHeight()*0.001,
              ),
              Text('\nOwner:\n', style: TextStyle( color: Color.fromRGBO(240, 205, 95, 1),fontWeight: FontWeight.bold,),),
               Text('   M. Ala Saadegh-Vaziri', style: TextStyle( color: Color.fromRGBO(240, 205, 95, 1),)),
              Text('      vaziri@optonline.net', style: TextStyle( color: Colors.white70,)),
              Text('\nSupervisor:\n', style: TextStyle( color: Color.fromRGBO(240, 205, 95, 1),fontWeight: FontWeight.bold),),
              Text('    Marzieh Eskandari', style: TextStyle(color: Color.fromRGBO(240, 205, 95, 1),)),
              Text('      marzieh211@yahoo.com', style: TextStyle(color: Colors.white70,)),
              Text('\nDevelopers:\n', style: TextStyle( color: Color.fromRGBO(240, 205, 95, 1),fontWeight: FontWeight.bold),),
              Text('    Diba Rashidi', style: TextStyle( color: Color.fromRGBO(240, 205, 95, 1),)),
              Text('      dibra.1379@gmail.com', style: TextStyle( color: Colors.white70,)),
              Text('      www.linkedin.com/in/d-rashidi', style: TextStyle( color: Colors.white70,)),
              Text('    Salehe Mirzaee', style: TextStyle( color: Color.fromRGBO(240, 205, 95, 1),)),
              Text('      sally.mirz@gmail.com ', style: TextStyle(color: Colors.white70, )),
              //TODO
              Text('      www.linkedin.com/in/d-rashidi', style: TextStyle(color: Colors.white70,)),
            ],
          ),
        ),
      ),
    );
  }
}
