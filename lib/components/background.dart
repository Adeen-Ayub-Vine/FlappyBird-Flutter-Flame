import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappybird_flutter_flame/game/assets.dart';
import 'package:flappybird_flutter_flame/game/flappy_bird.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame>{
  Background();
  
  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}