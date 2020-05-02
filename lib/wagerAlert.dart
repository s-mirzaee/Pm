import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'returnMoney.dart';
import 'main.dart';
import 'package:flutter/material.dart';


returnMoney returns = new returnMoney();
double Min;
double Max;
bool beInRange = true;
int enterNumber = 0;
bool showKeyboard = false;
Color boxColor = Colors.white;

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
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border(top: BorderSide(width: 5,color: Color.fromRGBO(240, 205, 95, 1)),right: BorderSide(width: 5,color: Color.fromRGBO(240, 205, 95, 1)),left: BorderSide(width: 5,color: Color.fromRGBO(240, 205, 95, 1)),bottom: BorderSide(width: 5,color: Color.fromRGBO(240, 205, 95, 1))),),
          child: Center(child: Text(
            '${enterNumber}',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(240, 205, 95, 1),
                fontFamily: 'MTCORSVA',
                decoration: TextDecoration.none),
          ),),
          margin: EdgeInsets.only(right: 570, bottom: 0),
          width: 65,
          height: 35,
        ),
        onTap: () {
          setState(() {
            boxColor = Colors.white;
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
            Container(//color: Colors.lightBlue,
              width: 60,
              height: 100,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
            ),

            beInRange
                //if be in range
                ? showKeyboard
                    ? Container(height: 50,margin: EdgeInsets.only(top: 25,left: 0),//color: Colors.lightBlue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            for(int i=0; i<10; i++)(
                                Container(margin: EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                      color: Color.fromRGBO(240, 205, 95, 1)),
                                  child: InkWell(
                                    child: Center(
                                      child: Text('$i',style: TextStyle(fontSize: 18),),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        enterNumber = (enterNumber * 10) + i;
                                      });
                                    },
                                  ),
                                  width: 45,
                                  height: 35,
                                )
                            ),
                            Container(margin: EdgeInsets.only(right: 4),
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
                              width: 45,
                              height: 35,
                            ),
                            Container(margin: EdgeInsets.only(right: 4),
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
                                    if (enterNumber >=
                                            staticValues.getWager(i) &&
                                        enterNumber <= Max) {
                                      staticValues.setMoney(
                                          (staticValues.getMoney()) -
                                              (enterNumber -
                                                  staticValues.getWager(i)));
                                      staticValues.setIsClick();
                                      staticValues.setMin(
                                          i, enterNumber.toDouble());
                                      staticValues.setWager(
                                          i, enterNumber.round());
                                      values.setValue(
                                          i, enterNumber.toDouble());
                                      enterNumber = 0;
                                      Min = staticValues.getMin(i);
                                      Max = Min + staticValues.getMoney();
                                      showKeyboard = !showKeyboard;
                                      main();
                                    } else {
                                      setState(() {
                                        boxColor = Colors.redAccent;
                                        showKeyboard = !showKeyboard;
                                        enterNumber = 0;
                                      });
                                    }
                                  });
                                },
                              ),
                              width: 45,
                              height: 35,
                            ),
                          ],
                        ),
                      )
                    //else show keyboard
                    : Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(right: 370),
                                child: Text(
                                  "min:" + Min.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(255, 220, 80, 1),
                                      fontFamily: 'MTCORSVA',
                                      decoration: TextDecoration.none),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "max:" + Max.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(255, 220, 80, 1),
                                      fontFamily: 'MTCORSVA',
                                      decoration: TextDecoration.none),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 500,
                            child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  trackHeight: 6.0,
                                ),
                                child: Slider(
                                  onChangeEnd: (double m) {
                                    staticValues.setMoney((staticValues
                                            .getMoney()) -
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
                                  max: Max,
                                  divisions: 10000,
                                  activeColor: Colors.amber,
                                  inactiveColor: Colors.grey,
                                  onChanged: (double newValue) {
                                    setState(() {
                                      boxColor = Colors.white;
                                      values.setValue(i, newValue);
                                    });
                                  },
                                )),
                          ),
                        ],
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
