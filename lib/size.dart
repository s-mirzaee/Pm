

class size {
  int playerNo;
//test
  size(this.playerNo);

  List<double> tops() {
    if (playerNo == 10) {
      return [135, 215, 58, 235, 32, 235, 32, 215, 58, 135];
    } else if (playerNo == 9) {
      return [135, 215, 58, 235, 32, 32, 215, 58, 135];
    } else if (playerNo == 8) {
      return [135, 215, 58, 32, 32, 215, 58, 135];
    } else if (playerNo == 7) {
      return [135, 215, 58, 32, 32, 58, 135];
    } else if (playerNo == 6) {
      return [135, 58, 32, 32, 58, 135];
    } else if (playerNo == 5) {
      return [135, 58, 32, 58, 135];
    } else if (playerNo == 4) {
      return [135, 45, 45, 135,];
    } else if (playerNo == 3) {
      return [135, 45, 135,];
    } else if (playerNo == 2) {
      return [135, 135,];
    }
  }

  List<double> lefts() {
    if (playerNo == 10) {
      return [45, 140, 140, 258, 258, 372, 372, 490, 490, 585];
    } else if (playerNo == 9) {
      return [45, 140, 140, 315, 258, 372, 490, 490, 585];
    } else if (playerNo == 8) {
      return [45, 140, 140, 258, 372, 490, 490, 585];
    } else if (playerNo == 7) {
      return [45, 140, 140, 258, 372, 490, 585];
    } else if (playerNo == 6) {
      return [45, 140, 258, 372, 490, 585];
    } else if (playerNo == 5) {
      return [45, 160, 308, 456, 585];
    } else if (playerNo == 4) {
      return [65, 225, 385, 565];
    } else if (playerNo == 3) {
      return [65, 310, 565];
    } else if (playerNo == 2) {
      return [65, 565];
    }
  }
}
