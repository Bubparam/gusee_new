import 'dart:math';
import 'dart:io';

class Game{
  int? _answer;
  static List<int> myList = [];
  int count = 0;
  Game({int maxRandom = 100}){
    var r = Random();
    _answer = r.nextInt(maxRandom)+1;
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
}
