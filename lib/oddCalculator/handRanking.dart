import 'package:bustem2/oddCalculator/modifiedHand.dart';
import 'package:bustem2/oddCalculator/winnerHand.dart';
import '../cards.dart';

winnerHand wh = new winnerHand();

class rank {
  List<Cards> sortById;
  List<int> sortByRank;
  List<int> frequencies;

  rank(this.sortById, this.sortByRank, this.frequencies);

  modifideHand ranking(Cards c1, Cards c2, modifideHand h) {
    List<Cards> s = List.from(sortById);
    List<int> r = List.from(sortByRank);
    List<int> f = List.from(frequencies);
    s.add(c1);
    s.add(c1);
    r.add(c1.rank);
    r.add(c1.rank);
    //sort1
    int j = 5;
    while (j > 0) {
      if ((s[j - 1].id).compareTo(c1.id) < 0) {
        s[j] = s[j - 1];
      } else {
        break;
      }
      j--;
    }

    s[j] = c1;
    f[c1.rank - 1]++;

    //sort2
    int k = 6;
    while (k > 0) {
      if ((s[k - 1].id).compareTo(c2.id) < 0) {
        s[k] = s[k - 1];
      } else {
        break;
      }
      k--;
    }
    s[k] = c2;
    f[c2.rank - 1]++;

    //sort3
    int m = 5;
    while (m > 0) {
      if ((r[m - 1]) < c1.rank) {
        r[m] = r[m - 1];
      } else {
        break;
      }
      m--;
    }
    r[m] = c1.rank;
    //sort4
    int n = 6;
    while (n > 0) {
      if ((r[n - 1]) < c2.rank) {
        r[n] = r[n - 1];
      } else {
        break;
      }
      n--;
    }
    r[n] = c2.rank;
    r = r.toSet().toList();

    //royalflush
    if (s[0].suit == s[4].suit) {
      if (s[4].rank == 9) {
        h.status = 10;
        return h;
      }
    }
    if (s[1].suit == s[5].suit) {
      if (s[5].rank == 9) {
        h.status = 10;
        return h;
      }
    }
    if (s[2].suit == s[6].suit) {
      if (s[6].rank == 9) {
        h.status = 10;
        return h;
      }
    }
    //straightFlush
    if (s[0].suit == s[4].suit) {
      if (s[0].rank - s[4].rank == 4) {
        h.status = 10;
        h.modifiedCard[0] = s[0].rank;
        return h;
      }
    }
    if (s[1].suit == s[5].suit) {
      if (s[1].rank - s[5].rank == 4) {
        h.status = 9;
        h.modifiedCard[0] = s[1].rank;
        return h;
      }
    }
    if (s[2].suit == s[6].suit) {
      if (s[2].rank - s[6].rank == 4) {
        h.status = 10;
        h.modifiedCard[0] = s[2].rank;
        return h;
      }
    }
    if (s[3].suit == s[6].suit) {
      if (s[3].rank == 4) {
        if (s[0].rank == 13) {
          if (s[0].suit == s[3].suit) {
            h.status = 9;
            h.modifiedCard[0] = s[3].rank;
            return h;
          }
        }
        if (s[1].rank == 13) {
          if (s[1].suit == s[3].suit) {
            h.status = 9;
            h.modifiedCard[0] = s[3].rank;
            return h;
          }
        }
        if (s[2].rank == 13) {
          if (s[2].suit == s[3].suit) {
            h.status = 9;
            h.modifiedCard[0] = s[3].rank;
            return h;
          }
        }
      }
      if (s[3].rank == 4) {
        if (s[0].rank == 13) {
          if (s[0].suit == s[3].suit) {
            h.status = 9;
            h.modifiedCard[0] = s[3].rank;
            return h;
          }
        }
        if (s[1].rank == 13) {
          if (s[1].suit == s[3].suit) {
            h.status = 9;
            h.modifiedCard[0] = s[3].rank;
            return h;
          }
        }
        if (s[2].rank == 13) {
          if (s[2].suit == s[3].suit) {
            h.status = 9;
            h.modifiedCard[0] = s[3].rank;
            return h;
          }
        }
      }
    }

    if (s[2].suit == s[5].suit) {
      if (s[2].rank == 4) {
        if (s[0].rank == 13) {
          if (s[0].suit == s[2].suit) {
            h.status = 9;
            h.modifiedCard[0] = s[2].rank;
            return h;
          }
        }
        if (s[1].rank == 13) {
          if (s[1].suit == s[2].suit) {
            h.status = 9;
            h.modifiedCard[0] = s[2].rank;
            return h;
          }
        }
      }
    }

    if (s[0].suit == s[4].suit) {
      if (s[1].rank == 4) {
        if (s[0].rank == 13) {
          h.status = 9;
          h.modifiedCard[0] = s[2].rank;
          return h;
        }
      }
    }
    //four of a kind
    int lr = r.length;
    for (int j = 0; j < lr; j++) {
      if (f[r[j] - 1] == 4) {
        h.status = 8;
        h.modifiedCard[0] = r[j];
        r.remove(j);
        h.modifiedCard[1] = r[0];
        return h;
      }
    }
    //full house
    for (int j = 0; j < lr; j++) {
      if (f[r[j] - 1] == 3) {
        for (int k = 0; k < lr; k++) {
          if (f[r[k] - 1] == 2) {
            h.status = 7;
            h.modifiedCard[0] = r[j];
            h.modifiedCard[1] = r[k];
            return h;
          }
        }
      }
    }
    //flush
    if (s[0].suit == s[4].suit) {
      h.status = 6;
      for (int j = 0; j < 5; j++) {
        h.modifiedCard[j] = s[j].rank;
        return h;
      }
    }
    if (s[1].suit == s[5].suit) {
      h.status = 6;
      for (int j = 0; j < 5; j++) {
        h.modifiedCard[j] = s[j + 1].rank;
      }
      return h;
    }
    if (s[2].suit == s[6].suit) {
      h.status = 6;
      for (int j = 0; j < 5; j++) {
        h.modifiedCard[j] = s[j + 2].rank;
      }
      return h;
    }
    //straight
    if (lr >= 5) {
      if (lr == 7) {
        if (r[0] - r[4] == 4) {
          h.status = 5;
          h.modifiedCard[0] = r[0];
          return h;
        }
        if (r[1] - r[5] == 4) {
          h.status = 5;
          h.modifiedCard[0] = r[1];
          return h;
        }
        if (r[2] - r[6] == 4) {
          h.status = 5;
          h.modifiedCard[0] = r[2];
          return h;
        }
      }
      if (lr == 6) {
        if (r[0] - r[4] == 4) {
          h.status = 5;
          h.modifiedCard[0] = r[0];
          return h;
        }
        if (r[1] - r[5] == 4) {
          h.status = 5;
          h.modifiedCard[0] = r[1];
          return h;
        }
      }
      if (lr == 5) {
        if (r[0] - r[4] == 4) {
          h.status = 5;
          h.modifiedCard[0] = r[0];
          return h;
        }
      }

      if (r[0] == 13) {
        if (r[lr - 4] == 4) {
          h.status = 5;
          h.modifiedCard[0] = 4;
          return h;
        }
      }
    }
    //three of a kind
    for (int j = 0; j < lr; j++) {
      if (f[r[j] - 1] == 3) {
        h.status = 4;
        h.modifiedCard[0] = r[j];
        r.remove(j);
        h.modifiedCard[1] = r[0];
        h.modifiedCard[2] = r[1];
        return h;
      }
    }
    //two pair
    for (int j = 0; j < lr; j++) {
      if (f[r[j] - 1] == 2) {
        for (int k = j + 1; k < lr; k++) {
          if (f[r[k] - 1] == 2) {
            h.status = 3;
            h.modifiedCard[0] = r[j];
            h.modifiedCard[1] = r[k];
            r.remove(j);
            r.remove(k - 1);
            h.modifiedCard[2] = r[0];
            return h;
          }
        }
      }
    }
    //pair
    for (int j = 0; j < lr; j++) {
      if (f[r[j] - 1] == 2) {
        h.status = 2;
        h.modifiedCard[0] = r[j];
        r.remove(j);
        for (int k = 1; k < 3; k++) {
          h.modifiedCard[k] = r[k - 1];
        }
        return h;
      }
    }

    //high card
    h.status = 1;
    for (int j = 0; j < 5; j++) {
      h.modifiedCard[j] = r[j];
    }
    return h;
  }
}
