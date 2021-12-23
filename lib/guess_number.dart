// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';

import 'package:guess_number/game.dart';

void main() {
  while(true) {
    var game = Game();
    game.playGame();
    if(game.playAgain()==false){
      break;
    }
  }
}
