
import 'GameScreen.dart';
import 'main.dart';
import 'package:bustem2/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MenuScreen.dart';

//void main() => (runApp(first()));
class logoScreen extends StatefulWidget {
  @override
  _logoScreenState createState() => _logoScreenState();
}

class _logoScreenState extends State<logoScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    var width = queryData.size.width;
    var height = queryData.size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Stack(children: <Widget>[
        Container(
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/katie-harp-Em96eDRJPD8-unsplash.jpg'),fit: BoxFit.cover)
            )
        ),
        Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You Wone:',
                style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'MTCORSVA',
              decoration: TextDecoration.none),),
              Text('${staticValues.totalReturn()-staticValues.totalWager()}',  style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'MTCORSVA',
                  decoration: TextDecoration.none),),
              Text ('in this game',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'MTCORSVA',
                    decoration: TextDecoration.none),),
              InkWell(
                onTap: (){
                  newGame();
                  Route route = MaterialPageRoute(builder: (context) => MenuScreen());
                  Navigator.push(context, route);
                },
                child: Container(
                    child:Text('Play Again',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'MTCORSVA',
                          decoration: TextDecoration.none),)
                ),
              ),
            ],
          ),

        ),

/*        Container(
          color: Colors.red,
          margin: EdgeInsets.only(left: width/10,right: width/8,top: height/4),
          child: Image.asset('assets/images/spades.png'),
        ),
        Container(
          margin: EdgeInsets.only(left: width/2.7 ,top: height/2.75),
          child: Text('Bust\n  em\npoker', style: TextStyle(fontSize: 50,fontWeight: FontWeight.normal, color: Color.fromRGBO(223, 177, 54,1) ,fontFamily: 'MTCORSVA', decoration: TextDecoration.none),
          ),)*/
      ],
      ),
    );

  }
}
