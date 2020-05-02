import 'package:bustem2/GameScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'returnMoney.dart';
import 'sliderValue.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

returnMoney returns = new returnMoney();
double Min;
double Max;
bool beInRange = true;
int enterNumber = 0;
bool showKeyboard = false;
Color boxColor=Colors.white;

class wagerAlert extends StatefulWidget {
  int i = staticValues.getSelect();

  wagerAlert() {
    Min = staticValues.getMin(i);
    Max = Min + staticValues.getMoney();
    print(Min.toString() + "==========" + Max.toString());
    if (Min >= Max || values.getValue(i) < Min || values.getValue(i) > Max) {
      beInRange = false;
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
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      InkWell(
        child: Container(
          color:boxColor,
          child: Text(
            '${enterNumber}',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100,
                color: Colors.black,
                fontFamily: 'MTCORSVA',
                decoration: TextDecoration.none),
          ),
          margin: EdgeInsets.only(right: 490, bottom: 30),
          width: 65,
          height: 35,
        ),
        onTap: () {
          setState(() {
            boxColor=Colors.white;
            showKeyboard = !showKeyboard;
          });
        },
      ),
      Container(
        height: 70,
        width: 660,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'w:' + '${values.getValue(i).round()}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 220, 80, 1),
                    fontFamily: 'MTCORSVA',
                    decoration: TextDecoration.none),
              ),
              Text(
                'r:' +
                    '${returns.returnCalculator(oddCalculator.getOdd(i), values.getValue(i)).round()}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 220, 80, 1),
                    fontFamily: 'MTCORSVA',
                    decoration: TextDecoration.none),
              ),
            ]),

            beInRange
                //if be in range
                ? showKeyboard
                    ? Container(
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  shape: BoxShape.rectangle),
                              child: InkWell(
                                child: Center(
                                  child: Text('1'),
                                ),
                                onTap: () {
                                  setState(() {
                                    enterNumber = (enterNumber * 10) + 1;
                                  });
                                },
                              ),
                              width: 50,
                              height: 50,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  shape: BoxShape.rectangle),
                              child: InkWell(
                                child: Center(
                                  child: Text('2'),
                                ),
                                onTap: () {
                                  setState(() {
                                    enterNumber = (enterNumber * 10) + 2;
                                  });
                                },
                              ),
                              width: 50,
                              height: 50,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  shape: BoxShape.rectangle),
                              child: InkWell(
                                child: Center(
                                  child: Text('3'),
                                ),
                                onTap: () {
                                  setState(() {
                                    enterNumber = (enterNumber * 10) + 3;
                                  });
                                },
                              ),
                              width: 50,
                              height: 50,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  shape: BoxShape.rectangle),
                              child: InkWell(
                                child: Center(
                                  child: Text('4'),
                                ),
                                onTap: () {
                                  setState(() {
                                    enterNumber = (enterNumber * 10) + 4;
                                  });
                                },
                              ),
                              width: 50,
                              height: 50,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  shape: BoxShape.rectangle),
                              child: InkWell(
                                child: Center(
                                  child: Text('5'),
                                ),
                                onTap: () {
                                  setState(() {
                                    enterNumber = (enterNumber * 10) + 5;
                                  });
                                },
                              ),
                              width: 50,
                              height: 50,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  shape: BoxShape.rectangle),
                              child: InkWell(
                                child: Center(
                                  child: Text('6'),
                                ),
                                onTap: () {
                                  setState(() {
                                    enterNumber = (enterNumber * 10) + 6;
                                  });
                                },
                              ),
                              width: 50,
                              height: 50,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  shape: BoxShape.rectangle),
                              child: InkWell(
                                child: Center(
                                  child: Text('7'),
                                ),
                                onTap: () {
                                  setState(() {
                                    enterNumber = (enterNumber * 10) + 7;
                                  });
                                },
                              ),
                              width: 50,
                              height: 50,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  shape: BoxShape.rectangle),
                              child: InkWell(
                                child: Center(
                                  child: Text('8'),
                                ),
                                onTap: () {
                                  setState(() {
                                    enterNumber = (enterNumber * 10) + 8;
                                  });
                                },
                              ),
                              width: 50,
                              height: 50,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  shape: BoxShape.rectangle),
                              child: InkWell(
                                child: Center(
                                  child: Text('9'),
                                ),
                                onTap: () {
                                  setState(() {
                                    enterNumber = (enterNumber * 10) + 9;
                                  });
                                },
                              ),
                              width: 50,
                              height: 50,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  shape: BoxShape.rectangle),
                              child: InkWell(
                                child: Center(
                                  child: Text('0'),
                                ),
                                onTap: () {
                                  setState(() {
                                    enterNumber = (enterNumber * 10) + 0;
                                  });
                                },
                              ),
                              width: 50,
                              height: 50,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  shape: BoxShape.rectangle),
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
                              width: 50,
                              height: 50,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  shape: BoxShape.rectangle),
                              child: InkWell(
                                child: Center(
                                  child: Icon(Icons.done),
                                ),
                                onTap: () {
                                  setState(() {
                                    if(enterNumber >= staticValues.getWager(i) && enterNumber <= Max){
                                      staticValues.setMoney(
                                          (staticValues.getMoney()) -
                                              (enterNumber-staticValues.getWager(i)));
                                      staticValues.setIsClick();
                                      staticValues.setMin(
                                          i, enterNumber.toDouble());
                                      staticValues.setWager(
                                          i, enterNumber.round());
                                      values.setValue(i, enterNumber.toDouble());
                                      enterNumber = 0;
                                      Min = staticValues.getMin(i);
                                      Max = Min + staticValues.getMoney();
                                      showKeyboard = !showKeyboard;
                                      main();
                                    }else{

                                      setState(() {
                                        boxColor=Colors.redAccent;
                                        showKeyboard=!showKeyboard;
                                        enterNumber = 0;
                                      });
                                    }


                                  });
                                },
                              ),
                              width: 50,
                              height: 50,
                            ),
                          ],
                        ),
                      )
                    //else show keyboard
                    : Container(
                        width: 500,
                        child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 6.0,
                            ),
                            child: Slider(
                              onChangeEnd: (double m) {
                                staticValues.setMoney(
                                    (staticValues.getMoney()) -
                                        (m.round() - staticValues.getWager(i)));
                                staticValues.setIsClick();
                                staticValues.setMin(i, m);
                                staticValues.setWager(i, m.round());

                                setState(() {
                                  Min = staticValues.getMin(i);
                                  Max = Min + staticValues.getMoney();
                                  main();
                                });
                              },
                              value: values.getValue(i),
                              min: Min,
                              //TODO set max money
                              max: Max,
                              divisions: 10000,
                              activeColor: Colors.amber,
                              inactiveColor: Colors.grey,
                              onChanged: (double newValue) {
                                setState(() {
                                  boxColor=Colors.white;
                                  values.setValue(i, newValue);
                                });
                              },
                            )),
                      )
                //else be in range
                : Text(
                    "NoEnoughMoney",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 220, 75, 1),
                        fontFamily: 'MTCORSVA',
                        decoration: TextDecoration.none),
                  ),
            //Text(ranges.getMax(i).toString())
          ],
        ),
      )
    ]);
  }
}
