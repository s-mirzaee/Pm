class size {
  int playerNo;
//test
  size(this.playerNo);

  List<double> tops() {
    if (playerNo == 10) {
      return [0.3, 0.5, 0.12, 0.57, 0.08, 0.57, 0.08, 0.5, 0.12, 0.3];
    } else if (playerNo == 9) {
      return [0.3, 0.5, 0.12, 0.57, 0.08, 0.57, 0.12, 0.5, 0.3];
    } else if (playerNo == 8) {
      return [0.33, 0.12, 0.08, 0.57, 0.53, 0.53, 0.12, 0.33];
    } else if (playerNo == 7) {
      return [0.33, 0.12, 0.05, 0.55, 0.55, 0.12, 0.33];
    } else if (playerNo == 6) {
      return [0.3, 0.12, 0.05, 0.05, 0.12, 0.3];
    } else if (playerNo == 5) {
      return [0.3, 0.12, 0.08, 0.12, 0.3];
    } else if (playerNo == 4) {
      return [0.45, 0.15, 0.15, 0.45,];
    } else if (playerNo == 3) {
      return [0.3, 0.08, 0.3,];
    } else if (playerNo == 2) {
      return [0.3, 0.3,];
    }
  }

  List<double> lefts() {
    if (playerNo == 10) {
      return [0.05, 0.19, 0.19, 0.365, 0.365, 0.537, 0.537, 0.71, 0.71, 0.85];
    } else if (playerNo == 9) {
      return [0.05, 0.19, 0.24, 0.365, 0.45, 0.537, 0.66, 0.71, 0.85];
    } else if (playerNo == 8) {
      return [0.05, 0.21, 0.45, 0.45, 0.21, 0.69, 0.69, 0.85];
    } else if (playerNo == 7) {
      return [0.05, 0.21, 0.45, 0.32, 0.565, 0.69, 0.85];
    } else if (playerNo == 6) {
      return [0.05, 0.19, 0.363, 0.537, 0.71, 0.85];
    } else if (playerNo == 5) {
      return [0.07, 0.24, 0.45, 0.66, 0.83];
    } else if (playerNo == 4) {
      return [0.13, 0.13, 0.75, 0.75];
    } else if (playerNo == 3) {
      return [0.07, 0.45, 0.83];
    } else if (playerNo == 2) {
      return [0.07, 0.83];
    }
  }
}