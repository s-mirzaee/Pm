import 'main.dart';
import 'package:flutter/material.dart';
import 'cards.dart';
import 'odds.dart';
import 'returnMoney.dart';
import 'size.dart';
import 'wagerAlert.dart';

//olgo koli yek daste ke do ta card to yek container va darsad ham zireshe
//TODO fix size******************

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
    return Container(

        //TODO size goshi ro bezan
//bayaf full screen bashe
        width: 670,
        height: 400,
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: lefts[i], top: tops[i]),
              child: InkWell(
                onTap: () {
                  //TODO select shodan dast
                  staticValues.setSelect(i);
                  setState(() {
                    staticValues.setIsClick();
                  });
                },
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      if (i > 5)
                        (Stack(
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                  'assets/images/${CardList[2 * i].id}.png'),
                              margin:
                                  const EdgeInsets.only(left: 10, bottom: 13),
                            ),
                            Container(
                              child: Image.asset(
                                  'assets/images/${CardList[(2 * i) + 1].id}.png'),
                              margin: const EdgeInsets.only(right: 10, top: 13),
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
                                  const EdgeInsets.only(right: 10, bottom: 13),
                            ),
                            Container(
                              child: Image.asset(
                                  'assets/images/${CardList[(2 * i) + 1].id}.png'),
                              margin: const EdgeInsets.only(left: 10, top: 13),
                            ),
                          ],
                        ))
                    ],
                  ),
                  width: handSize + 8,
                  height: handSize + 25,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: lefts[i] - 20, top: tops[i] + 45),
              width: handSize + 48,
              height: handSize + 13,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromRGBO(240, 205, 95, 1)),
              ),
            ),
            Container(
              child: staticValues.getIsClick() ? wagerAlert() : Text(""),
              margin: EdgeInsets.only(top: 100),
            ),
          ],
        ));
  }
}
