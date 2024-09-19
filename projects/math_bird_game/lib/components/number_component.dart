import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:math_bird_game/components/bird.dart';
import 'package:math_bird_game/game/configuration.dart';
import 'package:math_bird_game/game/math_bird_game.dart';

class NumberComponent extends TextComponent
    with HasGameRef<MathBirdGame>, CollisionCallbacks {
  final int number;
  final String operator;
  final double _height;

  bool _scoreUpdated = false; // Track if score has been updated

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

    if (other is Bird && !_scoreUpdated) {
      _updateScore();
      _scoreUpdated = true; // Ensure score is only updated once
      _updateAppearance(); // Change appearance to indicate collision
      Future.delayed(const Duration(milliseconds: 100), () {
        removeFromParent(); // Remove the component after a delay
      });
    }
  }

  void _updateAppearance() {
    // Change appearance based on collision state
    textRenderer = TextPaint(
      style: TextStyle(
        fontSize: 30,
        color: _scoreUpdated
            ? Colors.grey
            : (operator == '+' || operator == '*' ? Colors.green : Colors.red),
        fontWeight: _scoreUpdated ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  void _updateScore() {
    if (number == 0) return; // Avoid division by zero

    print('Applying $operator $number');

    // Get current score before applying effect
    int currentScore = gameRef.bird.score;

    switch (operator) {
      case '+':
        gameRef.bird.score = currentScore + number;
        break;
      case '-':
        gameRef.bird.score = currentScore - number;
        break;
      case '*':
        gameRef.bird.score = currentScore * number;
        break;
      case '/':
        if (number != 0) {
          gameRef.bird.score = currentScore ~/ number;
        }
        break;
    }

    // Debugging line to check score changes
    print('Score Updated: ${gameRef.bird.score}');
  }
}
