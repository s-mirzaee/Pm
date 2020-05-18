import 'package:bustem2/main.dart';
import 'package:bustem2/oddCalculator/handRanking.dart';

import '../cards.dart';

class winnerHand {
  rank r = new rank();
  int min = 11;
  int minI;
  List<int> equals = [];
  List<int> value = [];

  List<int> winner(List<Cards> list) {
    List<int> f = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    List<Cards> center = [
      list[list.length - 5],
      list[list.length - 4],
      list[list.length - 3],
      list[list.length - 2],
      list[list.length - 1],
    ];

    for (int a = 0; a < 5; a++) {
      f[center[a].rank - 1]++;
    }


    value.clear();

    for (int i = 0; i < staticValues.getPlayerNo(); i++) {
      List<Cards> sortById = List.from(center);
      sortById.sort((b, a) => a.id.compareTo(b.id));
      List<int> frequencies = List.from(f);
      sortById.add(list[0]);
      sortById.add(list[0]);
      List<int> sortByRank = [center[0].rank,center[1].rank,center[2].rank,center[3].rank,center[4].rank];
      sortByRank.sort((b, a) => a.compareTo(b));
      sortByRank.add(list[0].rank);
      sortByRank.add(list[0].rank);
      //sort1
      int j = 5;
      while (j > 0) {
        if ((sortById[j - 1].id).compareTo(list[2 * i].id) < 0) {
          sortById[j] = sortById[j - 1];
        } else {
          break;
        }
        j--;
      }
      sortById[j] = list[2 * i];
      frequencies[list[2 * i].rank - 1]++;
      //sort2
      int k = 6;
      while (k > 0) {
        if ((sortById[k - 1].id).compareTo(list[(2 * i) + 1].id) < 0) {
          sortById[k] = sortById[k - 1];
        } else {
          break;
        }
        k--;
      }
      sortById[k] = list[(2 * i) + 1];
      frequencies[list[(2 * i) + 1].rank - 1]++;

      //sort3
      int m = 5;
      while (m > 0) {
        if ((sortByRank[m - 1]) < list[2 * i].rank) {
          sortByRank[m] = sortByRank[m - 1];
        } else {
          break;
        }
        m--;
      }
      sortByRank[m] = list[2 * i].rank;

      //sort4
      int n = 6;
      while (n > 0) {
        if ((sortByRank[n - 1]) < list[(2 * i) + 1].rank) {
          sortByRank[n] = sortByRank[n - 1];
        } else {
          break;
        }
        n--;
      }
      sortByRank[n] = list[(2 * i) + 1].rank;
      sortByRank=sortByRank.toSet().toList();

      int v = r.ranking(sortById, sortByRank, frequencies);
      value.add(v);
    }

    equals.clear();
    List<int> bySort = List.from(value);
    bySort.sort();
    for (int i = 0; i < value.length; i++) {
      if (value[i] == bySort[0]) {
        equals.add(i);
      }
    }
    return equals;
  }
}
