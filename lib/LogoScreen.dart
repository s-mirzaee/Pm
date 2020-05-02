import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//void main() => (runApp(first()));
class firstScreen extends StatelessWidget {
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
        Container(
          margin: EdgeInsets.only(left: width/10,right: width/10,top: height/4),
          child: Image.asset('assets/images/spades.png'),
        ),
        Container(
          margin: EdgeInsets.only(left: width/2.7 ,top: height/2.75),
          child: Text('Bust\n  em\npoker', style: TextStyle(fontSize: 50,fontWeight: FontWeight.normal, color: Color.fromRGBO(223, 177, 54,1) ,fontFamily: 'MTCORSVA', decoration: TextDecoration.none),
          ),)
      ],
      ),
    );
  }
}
