import 'package:flame/game.dart';
import 'package:flappybird_flutter_flame/screens/game_over.dart';
import 'package:flappybird_flutter_flame/screens/menu_screen.dart';
import 'package:flutter/material.dart';

import 'game/flappy_bird.dart';

void main() {

  final game = FlappyBirdGame();

  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const [MainMenu.id],
      overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenu(game: game),
        'gameOver': (context, _) => GameOver(game: game),
      },
    ),
  );
}

