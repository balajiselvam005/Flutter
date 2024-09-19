import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:math_bird_game/game/assets.dart';
import 'package:math_bird_game/game/math_bird_game.dart';

class Background extends SpriteComponent with HasGameRef<MathBirdGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.backgorund);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}
