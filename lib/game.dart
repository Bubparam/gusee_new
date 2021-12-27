import 'dart:math';
import 'dart:io';

class Game{
  int? _answer;
  static List<int> myList = [];
  int count = 0;
  Game({int maxRandom = 100}){
    var r = Random();
    _answer = r.nextInt(maxRandom);
  }

  int doGuess(int num){
    count++;
    if(num > _answer!){
      return 1;
    }else if(num < _answer!){
      return -1;
    }else {
      return 0;
    }
  }

  bool playAgain(){
    while(true) {
      String? input2 = stdin.readLineSync();
      myList.add(count);
      count = 0;
      if(input2 == 'y' || input2 == 'Y') {
          return true;
      }else if(input2 == 'n' || input2 == 'N'){
          return false;
      }
    }
  }
}