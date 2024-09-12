import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:math_bird/game/math_bird_game.dart';
import 'package:math_bird/game/configuration.dart';
import 'package:math_bird/components/bird.dart';

class NumberComponent extends TextComponent
    with HasGameRef<MathBirdGame>, CollisionCallbacks {
  final int number;
  final String operator;
  final double _height;

  bool hasCollided = false; // Use hasCollided to prevent multiple collisions

  NumberComponent({
    required this.number,
    required this.operator,
    required double height,
  })  : _height = height,
        super(text: '$operator$number') {
    // Initialize properties here if needed
  }

  @override
  double get height => _height; // Override the height property

  @override
  Future<void> onLoad() async {
    _updateAppearance(); // Set initial appearance based on state
    position = Vector2(gameRef.size.x, _height);
    anchor = Anchor.center;
    size = Vector2(50, 30); // Set appropriate size
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if (position.x < -500) {
      removeFromParent();
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Bird && !hasCollided) {
      hasCollided = true; // Set flag to true to prevent multiple updates
      applyScoreEffect();
      _updateAppearance(); // Change appearance to indicate collision
      Future.delayed(const Duration(milliseconds: 100), () {
        removeFromParent();
      });
    }
  }

  void _updateAppearance() {
    // Change appearance based on collision state
    textRenderer = TextPaint(
      style: TextStyle(
        fontSize: 30,
        color: hasCollided
            ? Colors.grey
            : (operator == '+' || operator == '*' ? Colors.green : Colors.red),
        fontWeight: hasCollided ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  void applyScoreEffect() {
    if (number == 0) return; // Avoid division by zero
    print('$number');

    switch (operator) {
      case '+':
        print('$number');
        gameRef.bird.score += number;
        break;
      case '-':
        gameRef.bird.score -= number;
        break;
      case '*':
        gameRef.bird.score *= number;
        break;
      case '/':
        // Ensure safe division
        gameRef.bird.score ~/= number;
        break;
    }

    // Debugging line to check score changes
    print('Score Updated: ${gameRef.bird.score}');
  }
}
