class size {
  int playerNo;

  size(this.playerNo);

  List<double> tops() {
    if (playerNo == 10) {
      return [0.29, 0.5, 0.1, 0.57, 0.06, 0.57, 0.06, 0.5, 0.1, 0.29];
    } else if (playerNo == 9) {
      return [0.26, 0.515, 0.09, 0.57, 0.07, 0.57, 0.09, 0.515, 0.26];
    } else if (playerNo == 8) {
      return [0.31, 0.092, 0.054, 0.59, 0.56, 0.56, 0.092, 0.31];
    } else if (playerNo == 7) {
      return [0.33, 0.09, 0.04, 0.57, 0.57, 0.09, 0.33];
    } else if (playerNo == 6) {
      return [0.3, 0.1, 0.05, 0.05, 0.1, 0.3];
    } else if (playerNo == 5) {
      return [0.3, 0.1, 0.08, 0.1, 0.3];
    } else if (playerNo == 4) {
      return [
        0.45,
        0.09,
        0.09,
        0.45,
      ];
    } else if (playerNo == 3) {
      return [
        0.3,
        0.08,
        0.3,
      ];
    } else if (playerNo == 2) {
      return [
        0.3,
        0.3,
      ];
    }
  }

  List<double> lefts() {
    if (playerNo == 10) {
      return [0.05, 0.19, 0.19, 0.372, 0.372, 0.55, 0.55, 0.73, 0.73, 0.87];
    } else if (playerNo == 9) {
      return [0.06, 0.195, 0.25, 0.369, 0.46, 0.548, 0.67, 0.723, 0.86];
    } else if (playerNo == 8) {
      return [0.06, 0.22, 0.46, 0.46, 0.22, 0.7, 0.7, 0.86];
    } else if (playerNo == 7) {
      return [0.06, 0.22, 0.46, 0.33, 0.575, 0.7, 0.86];
    } else if (playerNo == 6) {
      return [0.06, 0.2, 0.373, 0.547, 0.72, 0.86];
    } else if (playerNo == 5) {
      return [0.08, 0.25, 0.46, 0.67, 0.85];
    } else if (playerNo == 4) {
      return [0.13, 0.32, 0.56, 0.76];
    } else if (playerNo == 3) {
      return [0.08, 0.45, 0.85];
    } else if (playerNo == 2) {
      return [0.08, 0.85];
    }
  }
}
