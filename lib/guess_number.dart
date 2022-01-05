// ignore_for_file: avoid_print
import 'dart:io';

import 'package:guess_number/game.dart';

void main() {
    stdout.write(' Maximum Number To Random : ');
    var num = stdin.readLineSync();
    var max = int.tryParse(num!);
    max ??= 100;
    var game = Game(maxRandom: max);
    print('╔════════════════════════════════════════');
    print('║            GUESS THE NUMBER            ');
    print('╟────────────────────────────────────────');

  while(true) {
    stdout.write('║ Guess the number between 1 and $max : ');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);
    if (guess == null) {
      continue;
    }

    var result = game.doGuess(guess);
    if (result == 1) {
      print('║ ➜ $guess is TOO HIGH! ▲');
      print('╟────────────────────────────────────────');
    } else if (result == -1) {
      print('║ ➜ $guess is TOO LOW! ▼');
      print('╟────────────────────────────────────────');
    } else {
      print('║ ➜ $guess is CORRECT ❤, total guesses : ${game.count}');
      print('╟────────────────────────────────────────');
      break;
    }
  }
    print('║                 THE END                ');
    print('╚════════════════════════════════════════');
    stdout.write(' Play Again? (Y/N): ');
    if(game.playAgain()==true) {
      main();
    }else if(Game.myList.length == 1){
      print(' You Have Played : ${Game.myList.length} game');
      print(' Game #1 : ${Game.myList[0]} guesses');
    }else{
      print(' You Have Played : ${Game.myList.length} games');
      for(int i=0; i<Game.myList.length; i++){
        print(' Game #${i+1} : ${Game.myList[i]} guesses');
      }
    }
  }
