
import 'package:bustem2/StaticValues.dart';
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
    SystemChrome.setEnabledSystemUIOverlays([]);
    MediaQueryData queryData = MediaQuery.of(context);

    staticValues.setWidth(queryData.size.width);
    staticValues.setHeight(queryData.size.height);
    staticValues.setShortest(queryData.size.shortestSide);
    staticValues.isTablet();
    print('${StaticValues.Tablet}');
    var width = staticValues.getWidth();
    var height = staticValues.getHeight();

    return MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            child: child,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          );
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'MTCORSVA'),
        home: Stack(
            children: <Widget>[
        if(StaticValues.Tablet == false)
          Stack(children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/katie-harp-Em96eDRJPD8-unsplash.jpg'),
                      fit: BoxFit.cover)),
              child: Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: width * 0.25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Transform.rotate(
                            angle: math.pi / 9,
                            child: Container(
                              child: Image.asset(
                                  'assets/images/ace-of-hearts.png',
                                  height: height * 0.125),
                            ),
                          ),
                          Transform.rotate(
                            angle: -math.pi / 15,
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: height / 14.5, bottom: height / 15),
                              child: Image.asset(
                                  'assets/images/ace-of-spades.png',
                                  height: height * 0.125),
                            ),
                          ),
                          Transform.rotate(
                            angle: math.pi / 15,
                            child: Container(
                              child: Image.asset(
                                  'assets/images/playing-cards.png',
                                  height: height * 0.125),
                            ),
                          ),
                          Container(
                            child: Transform.rotate(
                              angle: -math.pi / 12,
                              child: Container(
                                child: Image.asset(
                                    'assets/images/ace-of-clubs.png',
                                    height: height * 0.125),
                              ),
                            ),
                            margin: EdgeInsets.only(top: 35),
                          )
                        ],
                      )),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: FlatButton(
                            child: Text('Play',
                                style: TextStyle(
                                    fontSize: 34,
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
                          margin: EdgeInsets.only(top: height * 0.07),
                          child: FlatButton(
                            child: Text('Setting',
                                style: TextStyle(
                                    fontSize: 34,
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
                        Container(
                          margin: EdgeInsets.only(top: height * 0.076),
                          child: FlatButton(
                            child: Text('Help',
                                style: TextStyle(
                                    fontSize: 34,
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
                        Container(
                          margin: EdgeInsets.only(top: height * 0.075),
                          child: FlatButton(
                            child: Text('About us',
                                style: TextStyle(
                                    fontSize: 34,
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
                ],
              ),
            ),
            Container(
              child: CircularText(
                children: [
                  TextItem(
                    text: Text(
                      "strategy empowered by poker",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.black26,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MTCORSVA'),
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
              margin:
              EdgeInsets.only(left: width * 0.02, top: height * 0.1),
            ),
            Container(
              child: CircularText(
                children: [
                  TextItem(
                    text: Text(
                      "Business",
                      style: TextStyle(
                          fontSize: 33,
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MTCORSVA'),
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
              margin:
              EdgeInsets.only(left: width * 0.45, top: height * 0.63),
            ),
            Container(
              child: CircularText(
                children: [
                  TextItem(
                    text: Text(
                      "Business strategy empowered by poker",
                      style: TextStyle(
                          fontSize: 29,
                          color: Color.fromRGBO(0, 0, 0, 0.17),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MTCORSVA'),
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
              margin:
              EdgeInsets.only(left: width * 0.52, top: height * 0.03),
            ),
            Container(
              child: CircularText(
                children: [
                  TextItem(
                    text: Text(
                      "Business strategy empowered by poker",
                      style: TextStyle(
                          fontSize: 40,
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MTCORSVA'),
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
              margin:
              EdgeInsets.only(left: width * 0.65, top: height * 0.26),
            )
          ],)
         else
           Stack(children: [
             Container(
               decoration: BoxDecoration(
                   image: DecorationImage(
                       image: AssetImage(
                           'assets/images/katie-harp-Em96eDRJPD8-unsplash.jpg'),
                       fit: BoxFit.cover)),
               child: Row(
                 children: <Widget>[
                   Container(
                     //color: Colors.black12,
                       margin: EdgeInsets.only(left: width * 0.25),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         //crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Transform.rotate(
                             angle: math.pi / 9,
                             child: Container(
                               child: Image.asset(
                                   'assets/images/ace-of-hearts.png',
                                   height: height * 0.11),
                             ),
                           ),
                           Transform.rotate(
                             angle: -math.pi / 15,
                             child: Container(
                               margin: EdgeInsets.only(
                                   top: height / 15, bottom: height / 15),
                               child: Image.asset(
                                   'assets/images/ace-of-spades.png',
                                   height: height * 0.11),
                             ),
                           ),
                           Transform.rotate(
                             angle: math.pi / 15,
                             child: Container(
                               child: Image.asset(
                                   'assets/images/playing-cards.png',
                                   height: height * 0.11),
                             ),
                           ),
                           Container(
                             child: Transform.rotate(
                               angle: -math.pi / 12,
                               child: Container(
                                 child: Image.asset(
                                     'assets/images/ace-of-clubs.png',
                                     height: height * 0.11),
                               ),
                             ),
                             margin: EdgeInsets.only(top: height/15),
                           )
                         ],
                       )),
                   Container(
                     margin: EdgeInsets.only(left: height*0.04),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       //crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[
                         Container(
                           child: FlatButton(
                             child: Text('Play',
                                 style: TextStyle(
                                     fontSize: 52,
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
                           margin: EdgeInsets.only(top: height * 0.1),
                           child: FlatButton(
                             child: Text('Setting',
                                 style: TextStyle(
                                     fontSize: 52,
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
                         Container(
                           margin: EdgeInsets.only(top: height * 0.1),
                           child: FlatButton(
                             child: Text('Help',
                                 style: TextStyle(
                                     fontSize: 52,
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
                         Container(
                           margin: EdgeInsets.only(top: height * 0.1),
                           child: FlatButton(
                             child: Text('About us',
                                 style: TextStyle(
                                     fontSize: 52,
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
                 ],
               ),
             ),
             Container(
               child: CircularText(
                 children: [
                   TextItem(
                     text: Text(
                       "strategy empowered by poker",
                       style: TextStyle(
                           fontSize:40,
                           color: Colors.black26,
                           fontWeight: FontWeight.bold,
                           fontFamily: 'MTCORSVA'),
                     ),
                     space: 9.7,
                     startAngle: 180,
                     startAngleAlignment: StartAngleAlignment.center,
                     //direction: CircularTextDirection.clockwise,
                   ),
                 ],
                 radius: 180,
                 position: CircularTextPosition.inside,
                 //backgroundPaint: Paint()..color = Colors.grey.shade200,
               ),
               margin:
               EdgeInsets.only(left: width * 0.01, top: height * 0.1),
             ),
             Container(
               child: CircularText(
                 children: [
                   TextItem(
                     text: Text(
                       "Business",
                       style: TextStyle(
                           fontSize: 33,
                           color: Color.fromRGBO(0, 0, 0, 0.2),
                           fontWeight: FontWeight.bold,
                           fontFamily: 'MTCORSVA'),
                     ),
                     space: 33,
                     startAngle: 10,
                     startAngleAlignment: StartAngleAlignment.center,
                     //direction: CircularTextDirection.anticlockwise,
                   ),
                 ],
                 radius: 78,
                 position: CircularTextPosition.inside,
                 //backgroundPaint: Paint()..color = Colors.grey.shade200,
               ),
               margin:
               EdgeInsets.only(left: width * 0.45, top: height * 0.63),
             ),
             Container(
               child: CircularText(
                 children: [
                   TextItem(
                     text: Text(
                       "Business strategy empowered by poker",
                       style: TextStyle(
                           fontSize: 35,
                           color: Color.fromRGBO(0, 0, 0, 0.17),
                           fontWeight: FontWeight.bold,
                           fontFamily: 'MTCORSVA'),
                     ),
                     space: 9.5,
                     startAngle: 90,
                     startAngleAlignment: StartAngleAlignment.center,
                     //direction: CircularTextDirection.clockwise,
                   ),
                 ],
                 radius: 142,
                 position: CircularTextPosition.inside,
                 //backgroundPaint: Paint()..color = Colors.grey.shade200,
               ),
               margin:
               EdgeInsets.only(left: width * 0.52, top: height * 0.03),
             ),
             Container(
               child: CircularText(
                 children: [
                   TextItem(
                     text: Text(
                       "Business strategy empowered by poker",
                       style: TextStyle(
                           fontSize: 50,
                           color: Color.fromRGBO(0, 0, 0, 0.16),
                           fontWeight: FontWeight.bold,
                           fontFamily: 'MTCORSVA'),
                     ),
                     space: 9.7,
                     //startAngle: 0,
                     startAngleAlignment: StartAngleAlignment.center,
                     //direction: CircularTextDirection.clockwise,
                   ),
                 ],
                 radius: 180,
                 position: CircularTextPosition.inside,
                 //backgroundPaint: Paint()..color = Colors.grey.shade200,
               ),
               margin:
               EdgeInsets.only(left: width * 0.65, top: height * 0.26),
             ),
             Container(
               child: CircularText(
                 children: [
                   TextItem(
                     text: Text(
                       "Business strategy empowered by poker",
                       style: TextStyle(
                           fontSize: 43,
                           color: Color.fromRGBO(0, 0, 0, 0.16),
                           fontWeight: FontWeight.bold,
                           fontFamily: 'MTCORSVA'),
                     ),
                     space: 9.7,
                     //startAngle: 0,
                     startAngleAlignment: StartAngleAlignment.center,
                     //direction: CircularTextDirection.clockwise,
                   ),
                 ],
                 radius: 145,
                 position: CircularTextPosition.inside,
                 //backgroundPaint: Paint()..color = Colors.grey.shade200,
               ),
               margin:
               EdgeInsets.only(left: width * 0.56, top: height * 0.62),
             )
           ],)
            ],
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

    if(StaticValues.Tablet == true)
      return AlertDialog(

        backgroundColor: Colors.black,
        title: Text(
          'setting:',
          style: TextStyle(
              fontSize: 39,
              fontWeight: FontWeight.w100,
              color: Color.fromRGBO(240, 205, 95, 1),
              fontFamily: 'MTCORSVA',
              decoration: TextDecoration.none),
        ),
        content: Container(
            color: Colors.black,
            height: StaticValues.height*0.25,
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: StaticValues.height*0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Play Sounds:',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w100,
                                color: Color.fromRGBO(240, 205, 95, 1),
                                fontFamily: 'MTCORSVA',
                                decoration: TextDecoration.none),
                          ),
                          CustomSwitch(
                            activeColor: Color.fromRGBO(240, 205, 95, 1),
                            value: SoundVolume,
                            onChanged: (value) {
                              setState(() {
                                SoundVolume = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: staticValues.getHeight() / 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Play Music:',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w100,
                                color: Color.fromRGBO(240, 205, 95, 1),
                                fontFamily: 'MTCORSVA')),
                        CustomSwitch(
                          activeColor: Color.fromRGBO(240, 205, 95, 1),
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
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              'Reset Money',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w100,
                                  color: Color.fromRGBO(240, 205, 95, 1),
                                  fontFamily: 'MTCORSVA'),
                            )))
                  ],
                ))),
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
                    fontSize: 39,
                    fontWeight: FontWeight.w100,
                    color: Color.fromRGBO(240, 205, 95, 1),
                    fontFamily: 'MTCORSVA'),
              )),
        ],
      );

    else
      return AlertDialog(

        backgroundColor: Colors.black,
        title: Text(
          'setting:',
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w100,
              color: Color.fromRGBO(240, 205, 95, 1),
              fontFamily: 'MTCORSVA',
              decoration: TextDecoration.none),
        ),
        content: Container(
            color: Colors.black,
            height: staticValues.getHeight(),
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Play Sounds:',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w100,
                              color: Color.fromRGBO(240, 205, 95, 1),
                              fontFamily: 'MTCORSVA',
                              decoration: TextDecoration.none),
                        ),
                        CustomSwitch(
                          activeColor: Color.fromRGBO(240, 205, 95, 1),
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
                                fontSize: 26,
                                fontWeight: FontWeight.w100,
                                color: Color.fromRGBO(240, 205, 95, 1),
                                fontFamily: 'MTCORSVA')),
                        CustomSwitch(
                          activeColor: Color.fromRGBO(240, 205, 95, 1),
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
                              'Reset Money',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w100,
                                  color: Color.fromRGBO(240, 205, 95, 1),
                                  fontFamily: 'MTCORSVA'),
                            )))
                  ],
                ))),
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
                    fontSize: 28,
                    fontWeight: FontWeight.w100,
                    color: Color.fromRGBO(240, 205, 95, 1),
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

    if(StaticValues.Tablet == false)
      return AlertDialog(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Number of Hands:',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w100,
                color: Color.fromRGBO(240, 205, 95, 1),
                fontFamily: 'MTCORSVA'),
          ),
        ),
        content: Container(
          color: Colors.black,
          height: StaticValues.height *0.1,
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
                    fontSize: 28,
                    fontWeight: FontWeight.w100,
                    color: Color.fromRGBO(240, 205, 95, 1),
                    fontFamily: 'MTCORSVA'),
              ))
        ],
      );
    else
      return AlertDialog(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Number of Hands:',
            style: TextStyle(
                fontSize: 39,
                fontWeight: FontWeight.w100,
                color: Color.fromRGBO(240, 205, 95, 1),
                fontFamily: 'MTCORSVA'),
          ),
        ),
        content: Container(
          color: Colors.black,
          height: StaticValues.height / 10,
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
                        fontSize: 38,
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
                    fontSize: 39,
                    fontWeight: FontWeight.w100,
                    color: Color.fromRGBO(240, 205, 95, 1),
                    fontFamily: 'MTCORSVA'),
              ))
        ],
      );
  }
}

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(StaticValues.Tablet == false)
      return AlertDialog(
        backgroundColor: Colors.black,
        title: Text(
          'How To Play:',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              fontFamily: 'MTCORSVA',
              color: Color.fromRGBO(240, 205, 95, 1)),
        ),
        content: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: staticValues.getHeight() * 0.02,
                ),
                Text(
                  'BustEmPoker, Where Poker meets Wall Street!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: 'MTCORSVA',
                      color: Color.fromRGBO(240, 205, 95, 1)),
                ),
                Text(
                  '-      What is BustEmPoker: Business Strategy Empowered by Poker?' +
                      '\n' +
                      'It is said that poker is like life. Nothing is absolute and it is a mix of skill, perseverance, keeping emotion at check, asset (chip) management, knowing people, position and timing, and of course luck. Many on Wall Street count poker as one of their favorite hobbies. BustEmPoker unravels these in a fun game that is as simple as a coin flip or as involved as the stock market!  A game that is exciting, fun, entertaining, dynamic, and great tool for hedging! It is the ultimate poker game that you can use to learn and advance your poker skills, or empower your business strategies, or just have fun!  So, make your choice and experience the excitement!' +
                      '\n' +'\n'+
                      '-      How is BustEmPoker played?' +
                      '\n' +
                      'Hands are dealt like regular poker game. Player can choose between 2 to 10 hands per game. Hands are dealt face up or open. Odds for each hand winning is provided. Player must bet on at least one hand pre-flop. For a k-handed game, player can bet only on at most k/2 hands. Additional bets can be made after flop and turn on the same hand(s) '
                          'with new odds provided, or on some other hands. Here are the steps:' +
                      '\n'+'\n'
                      '-      Choose number of hands.' +
                      '\n'+
                      '-      The odd to Win and the odd to Tie will be appeared for each hand.' +
                      '\n'+
                      '-      Bet on at least one hand.' +
                      '\n'+
                      '-      Flop: odds change and they are provided to the player. Additional bets could be made.' +
                      '\n'+
                      '-      Turn: odds change and they are provided to the player. Additional bets could be made.' +
                      '\n'+
                      '-      River: obviously no more betting as outcome known!' +
                      '\n',
                  style: TextStyle(
                      fontFamily: 'MTCORSVA',fontSize: 25,
                      color: Color.fromRGBO(240, 205, 95, 1)),
                )
              ],
            ),
          ),
        ),
      );
    else
      return AlertDialog(
        backgroundColor: Colors.black,
        title: Text(
          'How To Play:',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              fontFamily: 'MTCORSVA',
              color: Color.fromRGBO(240, 205, 95, 1)),
        ),
        content: Container(
          width: StaticValues.width*0.65,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: staticValues.getHeight() * 0.02,
                ),
                Text(
                  'BustEmPoker, Where Poker meets Wall Street!'+ '\n',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: 'MTCORSVA',
                      color: Color.fromRGBO(240, 205, 95, 1)),
                ),
                Text(
                  '-      What is BustEmPoker: Business Strategy Empowered by Poker?' +
                      '\n' +
                      'It is said that poker is like life. Nothing is absolute and it is a mix of skill, perseverance, keeping emotion at check, asset (chip) management, knowing people, position and timing, and of course luck. Many on Wall Street count poker as one of their favorite hobbies. BustEmPoker unravels these in a fun game that is as simple as a coin flip or as involved as the stock market!  A game that is exciting, fun, entertaining, dynamic, and great tool for hedging! It is the ultimate poker game that you can use to learn and advance your poker skills, or empower your business strategies, or just have fun!  So, make your choice and experience the excitement!' +
                      '\n' +'\n'+
                      '-      How is BustEmPoker played?' +
                      '\n' +
                      'Hands are dealt like regular poker game. Player can choose between 2 to 10 hands per game. Hands are dealt face up or open. Odds for each hand winning is provided. Player must bet on at least one hand pre-flop. For a k-handed game, player can bet only on at most k/2 hands. Additional bets can be made after flop and turn on the same hand(s) '
                          'with new odds provided, or on some other hands. Here are the steps:' +
                      '\n'+'\n'
                      '-      Choose number of hands.' +
                      '\n'+
                      '-      The odd to Win and the odd to Tie will be appeared for each hand.' +
                      '\n'+
                      '-      Bet on at least one hand.' +
                      '\n'+
                      '-      Flop: odds change and they are provided to the player. Additional bets could be made.' +
                      '\n'+
                      '-      Turn: odds change and they are provided to the player. Additional bets could be made.' +
                      '\n'+
                      '-      River: obviously no more betting as outcome known!' +
                      '\n',
                  style: TextStyle(
                      fontFamily: 'MTCORSVA',fontSize: 25,
                      color: Color.fromRGBO(240, 205, 95, 1)),
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
                height: staticValues.getHeight() * 0.001,
              ),
              Text(
                '\nOwner:\n',
                style: TextStyle(
                  color: Color.fromRGBO(240, 205, 95, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('   M. Ala Saadegh-Vaziri',
                  style: TextStyle(
                    color: Color.fromRGBO(240, 205, 95, 1),
                  )),
              Text('      vaziri@optonline.net',
                  style: TextStyle(
                    color: Colors.white70,
                  )),
              Text(
                '\nSupervisor:\n',
                style: TextStyle(
                    color: Color.fromRGBO(240, 205, 95, 1),
                    fontWeight: FontWeight.bold),
              ),
              Text('    Marzieh Eskandari',
                  style: TextStyle(
                    color: Color.fromRGBO(240, 205, 95, 1),
                  )),
              Text('      marzieh211@yahoo.com',
                  style: TextStyle(
                    color: Colors.white70,
                  )),
              Text(
                '\nDevelopers:\n',
                style: TextStyle(
                    color: Color.fromRGBO(240, 205, 95, 1),
                    fontWeight: FontWeight.bold),
              ),
              Text('    Diba Rashidi',
                  style: TextStyle(
                    color: Color.fromRGBO(240, 205, 95, 1),
                  )),
              Text('      dibra.1379@gmail.com',
                  style: TextStyle(
                    color: Colors.white70,
                  )),
              Text('      www.linkedin.com/in/d-rashidi',
                  style: TextStyle(
                    color: Colors.white70,
                  )),
              Text('    Salehe Mirzaie',
                  style: TextStyle(
                    color: Color.fromRGBO(240, 205, 95, 1),
                  )),
              Text('      sally.mirz@gmail.com ',
                  style: TextStyle(
                    color: Colors.white70,
                  )),
              Text('      www.linkedin.com/in/sally-mirzaee',
                  style: TextStyle(
                    color: Colors.white70,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Expire extends StatefulWidget {
  @override
  _ExpireState createState() => _ExpireState();
}

class _ExpireState extends State<Expire> {
  @override
  Widget build(BuildContext context) {
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
                    'Session Expired',
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
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return About();
                        },
                      );
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          'Contact Us',
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
