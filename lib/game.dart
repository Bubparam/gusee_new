import 'dart:math';
import 'dart:io';

class Game{
  static const maxRandom = 100;
  int? _answer;
  int count = 0;

  Game(){
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

  bool playAgain(){
    while(true) {
      stdout.write(' Play Again? : ');
      String? input2 = stdin.readLineSync();
      if(input2 == 'y' || input2 == 'Y') {
          return true;
      }else if(input2 == 'n' || input2 == 'N'){
          return false;
      }
    }
  }

  void playGame(){
    const maxRandom = 100;
    print('╔════════════════════════════════════════');
    print('║            GUESS THE NUMBER            ');
    print('╟────────────────────────────────────────');

    while(true) {

      stdout.write('║ Guess the number between 1 and $maxRandom: ');
      var input = stdin.readLineSync();
      var guess = int.tryParse(input!);
      if (guess == null) {
        continue;
      }
      var result = doGuess(guess);
      if (result == 1) {
        print('║ ➜ $guess is TOO HIGH! ▲');
        print('╟────────────────────────────────────────');
      } else if (result == -1) {
        print('║ ➜ $guess is TOO LOW! ▼');
        print('╟────────────────────────────────────────');
      } else {
        print('║ ➜ $guess is CORRECT ❤, total guesses: $count');
        print('╟────────────────────────────────────────');
        break;
      }
    }
    print('║                 THE END                ');
    print('╚════════════════════════════════════════');
    count = 0;
  }

}