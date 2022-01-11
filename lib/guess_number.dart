// ignore_for_file: avoid_print
import 'dart:io';

import 'package:guess_number/game.dart';

void main() {
  while (true) {
    playGame();
    String? input;
    do {
      stdout.write('Play again? (Y/N): ');
      input = stdin.readLineSync();
    } while (input!.toLowerCase() != 'y' && input.toLowerCase() != 'n');

    if (input.toLowerCase() == 'n') break;
  }

  print('\n\nYou\'ve played ${Game.myList.length} games');
  for (var i = 0; i < Game.myList.length; i++) {
    print('Game #${i + 1} : ${Game.myList[i]} guesses');
  }
}

void playGame() {
  stdout.write(' Maximum Number To Random : ');
  var num = stdin.readLineSync();
  var max = int.tryParse(num!);
  max ??= 100;
  var game = Game(maxRandom: max);
  print('╔════════════════════════════════════════');
  print('║            GUESS THE NUMBER            ');
  print('╟────────────────────────────────────────');

  while (true) {
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
  Game.myList.add(game.count);
}
