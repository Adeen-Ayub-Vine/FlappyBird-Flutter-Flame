import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappybird_flutter_flame/components/pipe.dart';
import 'package:flappybird_flutter_flame/game/configuration.dart';
import 'package:flappybird_flutter_flame/game/flappy_bird.dart';
import 'package:flappybird_flutter_flame/game/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();

  final valueRandom = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 150 + valueRandom.nextDouble() * (heightMinusGround / 4);
    final centerY = spacing + valueRandom.nextDouble() * (heightMinusGround - spacing);

    addAll([
      Pipe(pipePosition: PipePosition.top, height: centerY - spacing / 2),
      Pipe(pipePosition: PipePosition.bottom, height: heightMinusGround - (centerY + spacing / 2)),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if (position.x < -10) {
      removeFromParent();
      updateScore();
    }

    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  void updateScore() {
    gameRef.bird.score += 1;
  }
}