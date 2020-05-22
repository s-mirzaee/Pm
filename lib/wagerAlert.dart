import 'package:bustem2/GameScreen.dart';
import 'package:bustem2/odds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'returnMoney.dart';
import 'main.dart';
import 'package:flutter/material.dart';

returnMoney returns = new returnMoney();
double Max;
bool beInRange = true;
int enterNumber = 0;
bool showKeyboard = false;
Color boxColor = Color.fromRGBO(240, 205, 95, 1);
bool showBox = true;
bool boxShow = true;


class wagerAlert extends StatefulWidget {
  int i = staticValues.getSelect();

  wagerAlert() {
    Max = staticValues.getMoney();
    //print("0" + "==========" + Max.toString());
    if ( Max==0 ) {
      beInRange = false;
      boxShow = false;
    }
  }

  @override
  _wagerAlertState createState() => _wagerAlertState(i);
}

class _wagerAlertState extends State<wagerAlert> {
  int i;

  _wagerAlertState(this.i);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var width = queryData.size.width;
    var height = queryData.size.height;
    return Stack(children: [
      if (showBox && boxShow)
        InkWell(
          child: Container(
            width: 70,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border(
                  top: BorderSide(
                      width: 5, color: boxColor),
                  right: BorderSide(
                      width: 5, color: boxColor),
                  left: BorderSide(
                      width: 5, color: boxColor),
                  bottom: BorderSide(
                      width: 5, color: boxColor)),
            ),
            child: Text(
              '${enterNumber}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(240, 205, 95, 1),
                  fontFamily: 'MTCORSVA',
                  decoration: TextDecoration.none),
            ),
            margin: EdgeInsets.only(left: 10, top: height / 2),
            padding: EdgeInsets.all(5),
            //width: 75,
            //height: 35,
          ),
          onTap: () {
            setState(() {
              boxColor = Color.fromRGBO(240, 205, 95, 1);
              showKeyboard = !showKeyboard;
            });
          },
        )
      else if(showBox==false)
        Container(
          margin: EdgeInsets.only(top: 250, left: 320), //color: Colors.white,
          width: 70,
          height: 60,
          child: Column(children: [
            Container(
              child: Text(
                'w :' + '${values.getValue(i).round()}',
                //textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(240, 205, 95, 1),
                    fontFamily: 'MTCORSVA',
                    decoration: TextDecoration.none),
              ),
              height: 25,
              width: 70,
            ),
            Container(
              child: Text(
                'r :' +
                    '${returns.returnCalculator(oddCalculator.getOdd(i), values.getValue(i)).round()}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(240, 205, 95, 1),
                    fontFamily: 'MTCORSVA',
                    decoration: TextDecoration.none),
              ),
              height: 25,
              width: 70,
            ),
          ]),
        ),
      Container(
        margin: EdgeInsets.only(top: width / 3.5), //color: Colors.white,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            beInRange
            //if be in range
                ? showKeyboard
                ? Container(
              height: 60,
              margin: EdgeInsets.only(top: 60, left: 8),
              //color: Colors.lightBlue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  for (int i = 0; i < 10; i++)
                    (Container(
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(15)),
                          color: Color.fromRGBO(240, 205, 95, 1)),
                      child: InkWell(
                        child: Center(
                          child: Text(
                            '$i',
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'MTCORSVA'),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            enterNumber = (enterNumber * 10) + i;
                          });
                        },
                      ),
                      width: 44,
                      height: 40,
                    )),
                  Container(
                    margin: EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(15)),
                        color: Color.fromRGBO(240, 205, 95, 1)),
                    child: InkWell(
                      child: Center(
                        child: Icon(Icons.backspace),
                      ),
                      onTap: () {
                        setState(() {
                          enterNumber = (enterNumber / 10).toInt();
                        });
                      },
                    ),
                    width: 44,
                    height: 40,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(15)),
                        color: Color.fromRGBO(240, 205, 95, 1)),
                    child: InkWell(
                      child: Center(
                        child: Icon(Icons.done),
                      ),
                      onTap: () {
                        setState(() {
                          if (enterNumber <= Max) {
                            staticValues.setMoney(
                                (staticValues.getMoney()) - enterNumber );
                            staticValues.setIsClick();
                            staticValues.setReturn(i,( staticValues.getReturn(i)+ returns.returnCalculator(odds.handOddes[i], enterNumber.toDouble())).round());
                            staticValues.setWager(
                                i, staticValues.getWager(i)+enterNumber.round());
                            enterNumber = 0;
                            Max =staticValues.getMoney();
                            showKeyboard = !showKeyboard;
                            main();
                          } else if(enterNumber > Max) {
                            setState(() {
                              boxColor = Colors.red;
                              showKeyboard = !showKeyboard;
                              enterNumber = 0;
                            });
                          }
                        });
                      },
                    ),
                    width: 44,
                    height: 40,
                  ),
                ],
              ),
            )
            //else show keyboard
                : Container(
              margin: EdgeInsets.only(top: 53), //color: Colors.white,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 0),
                    width: 300,
                    child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          //trackHeight: 1.0,
                        ),
                        child: Slider(
                          onChangeEnd: (double m) {
                            showBox = true;
                            staticValues.setMoney(
                                (staticValues.getMoney()) - m.round());
                            staticValues.setIsClick();
                            staticValues.setWager(i, staticValues.getWager(i)+m.round());
                            staticValues.setReturn(i,( staticValues.getReturn(i)+ returns.returnCalculator(odds.handOddes[i], m)).round());
                            setState(() {
                              values.setValue(i, 0);
                              Route route = MaterialPageRoute(builder: (context) => StartGame());
                              Navigator.pushReplacement(context, route);
                            });
                          },
                          value: values.getValue(i),
                          min: 0,
                          max: Max,
                          divisions: 10000,
                          activeColor:
                          Color.fromRGBO(240, 205, 95, 1),
                          inactiveColor:
                          Color.fromRGBO(240, 205, 100, 0.9),
                          onChanged: (double newValue) {
                            boxColor = Color.fromRGBO(240, 205, 95, 1);
                            showBox = false;
                            setState(() {
                              //boxColor = Colors.white;
                              values.setValue(i, newValue);
                            });
                          },
                        )),
                  ),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 25,
                        width: 200,
                        child: Text(
                          "min : 0 " ,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(240, 205, 95, 1),
                              fontFamily: 'MTCORSVA',
                              decoration: TextDecoration.none),
                        ),
                        margin: EdgeInsets.only(left: 120),
                      ),
                      Container(
                        height: 25,
                        width: 200,
                        child: Text(
                          "max :" + (Max.round()).toString(),
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(240, 205, 95, 1),
                              fontFamily: 'MTCORSVA',
                              decoration: TextDecoration.none),
                        ),
                        margin: EdgeInsets.only(left: 120),
                      ),
                    ],
                  ),
                ],
              ),
            )

                : Container(child: Text(
              "No Enough Money",
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 220, 75, 1),
                  fontFamily: 'MTCORSVA',
                  decoration: TextDecoration.none),
            ),
              margin: EdgeInsets.only(top: 60,left: 230),
            ),
          ],
        ),
      ),
    ]);
  }
}