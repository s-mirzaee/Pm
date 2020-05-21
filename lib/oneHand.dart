import 'package:bustem2/StaticValues.dart';
import 'package:flutter/cupertino.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'cards.dart';
import 'odds.dart';
import 'returnMoney.dart';
import 'size.dart';
import 'wagerAlert.dart';

//olgo koli yek daste ke do ta card to yek container va darsad ham zireshe


class Hand extends StatefulWidget {
  int i;
  List<Cards> CardList;

  Hand(this.i, this.CardList);

  @override
  _HandState createState() => _HandState(i, CardList);
}

class _HandState extends State<Hand> {
  returnMoney returns = new returnMoney();
  int i;
  List<Cards> CardList;

  _HandState(this.i, this.CardList);
  odds oddPercent = new odds();
  double handSize = 50;



  @override
  Widget build(BuildContext context) {
    int n = ((CardList.length - 5) / 2).toInt();
    size Size = new size(n);
    List<double> lefts = Size.lefts();
    List<double> tops = Size.tops();
    Color boxColor = Color.fromRGBO(240, 205, 95, 1);
    MediaQueryData queryData = MediaQuery.of(context);
    double height = queryData.size.height;
    double width = queryData.size.width;

    return Container(

//bayaf full screen bashe
        width: 670,
        height: 400,
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: width*lefts[i], top: height*tops[i]),
              child: InkWell(
                onTap: () {

                  staticValues.setSelect(i);
                  setState(() {
                    staticValues.setIsClick();
                  });
                },
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      if (i > (StaticValues.playerNo/2)-1 && StaticValues.isClick == true)
                        (Stack(
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                  'assets/images/${CardList[2 * i].id}.png'),
                              margin: EdgeInsets.only(left: 12, bottom: 18),
                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color.fromRGBO(220, 220, 220, 1),blurRadius: 5.5,offset: Offset(0, 0),spreadRadius: 6)],),
                            ),
                            Container(
                              child: Image.asset(
                                  'assets/images/${CardList[(2 * i) + 1].id}.png'),
                              margin: EdgeInsets.only(right: 12, top: 18),
                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color.fromRGBO(220, 220, 220, 1),blurRadius: 5.5,offset: Offset(-6, 4),spreadRadius: 2.5)],),
                            ),
                          ],
                        ))
                      else if(i> (StaticValues.playerNo/2)-1 && StaticValues.isClick == false)(Stack(
                        children: <Widget>[
                          Container(
                            child: Image.asset(
                                'assets/images/${CardList[2 * i].id}.png'),
                            margin: EdgeInsets.only(left: 12, bottom: 18),

                          ),
                          Container(
                            child: Image.asset(
                                'assets/images/${CardList[(2 * i) + 1].id}.png'),
                            margin: EdgeInsets.only(right: 12, top: 18),

                          ),
                        ],
                      ))
                      else if(i< StaticValues.playerNo/2 && StaticValues.isClick == true)(Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color.fromRGBO(220, 220, 220, 1),blurRadius: 5.5,offset: Offset(0, 0),spreadRadius: 6)],),
                              child: Image.asset(
                                  'assets/images/${CardList[2 * i].id}.png'),
                              margin: EdgeInsets.only(right: 12, bottom: 18),
                            ),
                            Container(
                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color.fromRGBO(220, 220, 220, 1),blurRadius: 5.5,offset: Offset(6, 4),spreadRadius: 2.5)],),
                              child: Image.asset(
                                  'assets/images/${CardList[(2 * i) + 1].id}.png'),
                              margin:  EdgeInsets.only(left: 12, top: 18),
                            ),
                          ],
                        ))
                        else
                          (Stack(
                            children: <Widget>[
                              Container(
                                child: Image.asset(
                                    'assets/images/${CardList[2 * i].id}.png'),
                                margin:
                                const EdgeInsets.only(right: 12, bottom: 18),
                              ),
                              Container(
                                child: Image.asset(
                                    'assets/images/${CardList[(2 * i) + 1].id}.png'),
                                margin: const EdgeInsets.only(left: 12, top: 18),
                              ),
                            ],
                          ))
                    ],
                  ),
                  width: handSize + 12,
                  height: handSize + 38,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: width*lefts[i] - 18, top: height*tops[i] + 46),
              width: handSize + 53,
              height: handSize + 7,
              child: Container(
                child: Column(children: <Widget>[
                  Container(child: Center(child: Text("Odds :" +oddPercent.getOdd(i).toStringAsFixed(2),
                    style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'MTCORSVA',
                        decoration: TextDecoration.none),),),
                      margin: EdgeInsets.only(top: 1.5,),
                      /*height: handSize -31,color: boxColor,*/
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(8),topLeft: Radius.circular(8)),color: boxColor)//,boxShadow: [BoxShadow(color: Colors.black,spreadRadius: 0.7)]),
                  ),
                  Container(child: Center(child: Text("Wager :" +staticValues.getWager(i).toString(),
                    style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'MTCORSVA',
                        decoration: TextDecoration.none),),),
                    height: handSize -31,color: boxColor,
                    margin: EdgeInsets.only(top: 0.3,bottom: 0.3),
                    //decoration: BoxDecoration(/*borderRadius: BorderRadius.all(Radius.circular(0)),*/color: boxColor,boxShadow: [BoxShadow(color: Colors.black,spreadRadius: 0.7)]),
                  ),
                  Container(child: Center(child: Text("Return :" +staticValues.getReturn(i).toString(),
                    style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'MTCORSVA',
                        decoration: TextDecoration.none),),),
                      /*height: handSize -31,color: boxColor,*/
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8),),color: boxColor,)//boxShadow: [BoxShadow(color: Colors.black,spreadRadius: 0.7)]),
                  ),
                ],),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.black,
                ),
                ///width: handSize + 100,
              ),
            ),
            level<3&&(staticValues.wagerCounter()<((staticValues.getPlayerNo()/2).round())||staticValues.getWager(i)!=0) ?Container(
              child: staticValues.getIsClick() ? wagerAlert() : Text(""),
              margin: EdgeInsets.only(top: 100),
            ):Text(''),
          ],
        ));
  }
}
