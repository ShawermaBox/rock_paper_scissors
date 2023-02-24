import 'dart:io';
import 'dart:math';

enum MoveType { rock, paper, scissors }

void main() {
  final rng = Random();
  while (true) {
    stdout.write('(R)ock, (P)aper or (S)cissors?: ');
    final input = stdin.readLineSync();
    if (input!.toLowerCase() == 'r' ||
        input.toLowerCase() == 'p' ||
        input.toLowerCase() == 's') {
      MoveType? playerMove;
      switch (input.toLowerCase()) {
        case 'r':
          playerMove = MoveType.rock;
          break;
        case 'p':
          playerMove = MoveType.paper;
          break;
        case 's':
          playerMove = MoveType.scissors;
          break;
      }
      print('Your input is: ${playerMove!.name}');
      final random = rng.nextInt(3);
      final aiMove = MoveType.values[random];
      print('AI input is: ${aiMove.name}');
      if (playerMove == aiMove) {
        print('Draw!');
      } else if (playerMove == MoveType.rock && aiMove == MoveType.scissors ||
          playerMove == MoveType.paper && aiMove == MoveType.rock ||
          playerMove == MoveType.scissors && aiMove == MoveType.paper) {
        print('You Won!');
      } else {
        print('AI Won :( Better Luck next time');
      }
    } else if (input == 'q') {
      break;
    } else {
      print('Invalid input');
    }
  }
}
