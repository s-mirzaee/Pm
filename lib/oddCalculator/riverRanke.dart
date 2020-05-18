import 'package:bustem2/oddCalculator/winnerHand.dart';
import 'package:flutter/material.dart';

import '../cards.dart';


class riverRank {
  int ranking(
      List<Cards> sortById, List<int> sortByRank, List<int> frequencies) {
/*    print("/ID");
    for (int i = 0; i < 7; i++) {
      print(sortById[i].rank.toString() + sortById[i].suit);
    }
    print("/rank");
    print(sortByRank.toString());
    print("/frequencies");
    print(frequencies.toString());*/

    //Royalflush
    if (sortById[0].suit == sortById[4].suit) {
      if (sortById[4].rank == 9) {
        //RoyalFlush
        return 1;
      }
    }
    if (sortById[1].suit == sortById[5].suit) {
      if (sortById[1].rank == 9) {
        //royalflush
        return 1;
      }
    }
    if (sortById[2].suit == sortById[6].suit) {
      if (sortById[2].rank == 1) {
        //royalflush
        return 1;
      }
    }
    //flushs
    bool isFlush = false;
    if (sortById[0].suit == sortById[4].suit) {
      if (sortById[0].rank == 13) {
        if (sortById[1].rank == 4) {
          if (sortById[4].rank == 1) {
            //straight flush
            return 2;
          }
        } else if (sortById[2].rank == 4) {
          if (sortById[5].rank == 1 && sortById[5].suit == sortById[0].suit) {
            //straight flush
            return 2;
          }
        } else if (sortById[3].rank == 4) {
          if (sortById[6].rank == 1 && sortById[6].suit == sortById[0].suit) {
            //straight flush
            return 2;
          }
        }
      } else if (sortById[0].rank - sortById[4].rank == 4) {
        //straight flush
        return 2;
      }
      isFlush = true;
    }

    if (sortById[1].suit == sortById[5].suit) {
      if (sortById[0].rank == 13) {
        if (sortById[2].rank == 4) {
          if (sortById[5].rank == 1) {
            //straight flush
            return 2;
          }
        } else if (sortById[3].rank == 4) {
          if (sortById[6].rank == 1 && sortById[6].suit == sortById[0].suit) {
            //straight flush
            return 2;
          }
        }
      } else if (sortById[0].rank - sortById[4].rank == 4) {
        //straight flush
        return 2;
      }
      isFlush = true;
    }
    if (sortById[2].suit == sortById[6].suit) {
      if (sortById[0].rank == 13) {
        if (sortById[3].rank == 4) {
          if (sortById[6].rank == 1) {
            //straight flush
            return 2;
          }
        }
      } else if (sortById[0].rank - sortById[4].rank == 4) {
        //straight flush
        return 2;
      }
      isFlush = true;
    }
    if (isFlush) {
      return 5;
    }
    //four of a kind
    for (int i = 0; i < sortByRank.length; i++) {
      if (frequencies[sortByRank[i] - 1] == 4) {
        //four of a kind
        return 3;
      }
    }
    //full house
    for (int i = 0; i < sortByRank.length; i++) {
      if (frequencies[sortByRank[i] - 1] == 3) {
        for (int i = 0; i < sortByRank.length; i++) {
          if (frequencies[sortByRank[i] - 1] == 2) {
            //full house
            return 4;
          }
        }
      }
    }
    //straight
    if (sortByRank.length == 7) {
      if (sortByRank[2] - sortByRank[6] == 4) {
        //straight
        return 6;
      }
      if (sortByRank[0] == 13) {
        if (sortByRank[3] == 4) {
          //straight
          return 6;
        }
      }
    }
    if (sortByRank.length >= 6) {
      if (sortByRank[1] - sortByRank[5] == 4) {
        //straight
        return 6;
      }
      if (sortByRank[0] == 13) {
        if (sortByRank[2] == 4) {
          //straight
          return 6;
        }
      }
    }
    if (sortByRank.length >= 5) {
      if (sortByRank[0] == 13) {
        if (sortByRank[1] == 4) {
          //straight
          return 6;
        }
      }
      if (sortByRank[0] - sortByRank[4] == 4) {
        //straight
        return 6;
      }
    }

    //three of a kind
    for (int i = 0; i < sortByRank.length; i++) {
      if (frequencies[sortByRank[i] - 1] == 3) {
        //three of a kind
        return 7;
      }
    }
    //two pair
    int x = 0;
    for (int i = 0; i < sortByRank.length; i++) {
      if (frequencies[sortByRank[i] - 1] == 2) {
        x++;
      }
    }
    if (x > 1) {
      //two pair
      return 8;
    }

    //pair
    for (int i = 0; i < sortByRank.length; i++) {
      if (frequencies[sortByRank[i] - 1] == 2) {
        //pair
        return 9;
      }
    }
    //high card
    return 10;
  }
}
