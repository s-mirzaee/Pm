import 'size.dart';
//class card ha ba adad va khal va id
class Cards{
  int _rank;
  String _suit;
  String _id;


  Cards(this._rank, this._suit, this._id);


  String get suit => _suit;

  set suit(String value) {
    _suit = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  int get rank => _rank;

  set rank(int value) {
    _rank = value;
  }


}




