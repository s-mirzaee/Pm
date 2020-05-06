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
bool showBox = true;

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
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var width = queryData.size.width;
    var height = queryData.size.height;
    return Stack( children: [
      if (showBox)
      InkWell(
        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12)),border: Border(top: BorderSide(width: 5,color: Color.fromRGBO(240, 205, 95, 1)),right: BorderSide(width: 5,color: Color.fromRGBO(240, 205, 95, 1)),left: BorderSide(width: 5,color: Color.fromRGBO(240, 205, 95, 1)),bottom: BorderSide(width: 5,color: Color.fromRGBO(240, 205, 95, 1))),),
          child: Center(child: Text(
          '${enterNumber}',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(240, 205, 95, 1),
              fontFamily: 'MTCORSVA',
              decoration: TextDecoration.none),
        ),),
        margin: EdgeInsets.only(left: 10, top: height/2),
        width: 65,
        height: 35,
      ),
      onTap: () {
        setState(() {
          boxColor = Colors.white;
          showKeyboard = !showKeyboard;
        });
      },
      ) else Container(margin: EdgeInsets.only(top: 170,left: 10),//color: Colors.lightBlue,
          width: 60,
          height: 100,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
            'w:' + '${values.getValue(i).round()}',textDirection: TextDirection.rtl,
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

      Container(margin: EdgeInsets.only(top: width/3.5),//color: Colors.white,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            beInRange
                //if be in range
                ? showKeyboard
                    ? Container(height: 60,margin: EdgeInsets.only(top: 60,left: 8),//color: Colors.lightBlue,
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
                                  width: 44,
                                  height: 40,
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
                              width: 44,
                              height: 40,
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
                              width: 44,
                              height: 40,
                            ),
                          ],
                        ),
                      )
                    //else show keyboard
                    : Container(margin: EdgeInsets.only(top: 53),//color: Colors.white,
                    child: Row(
                        children: <Widget>[
                          Container(margin: EdgeInsets.only(left: 0,top: 0),
                            width: 300,
                            child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  //trackHeight: 1.0,
                                ),
                                child: Slider(
                                  //onChangeStart: (),
                                  onChangeEnd: (double m) {
                                    showBox = true;
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
                                  activeColor: Color.fromRGBO(240, 205, 95, 1),
                                  inactiveColor: Color.fromRGBO(240, 205, 100, 0.9),
                                  onChanged: (double newValue) {
                                    showBox = false;
                                    setState(() {
                                      boxColor = Colors.white;
                                      values.setValue(i, newValue);
                                    });
                                  },
                                )),
                          ),
                          Column(//mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(margin: EdgeInsets.only(right: 30),
                                child: Text(
                                  "min:" + Min.toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(240, 205, 95, 1),
                                      fontFamily: 'MTCORSVA',
                                      decoration: TextDecoration.none),
                                ),
                              ),
                              Container(margin: EdgeInsets.only(right: 0,top: 0),
                                child: Text(
                                  "max:" + Max.toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(240, 205, 95, 1),
                                      fontFamily: 'MTCORSVA',
                                      decoration: TextDecoration.none),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),)
                //else be in range
                : Text(
                    "NoEnoughMoney",
                    style: TextStyle(
                        fontSize: 30,
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

