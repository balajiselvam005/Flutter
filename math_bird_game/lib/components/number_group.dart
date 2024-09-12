import 'dart:math';
import 'package:flame/components.dart';
import 'package:math_bird/components/number_component.dart';
import 'package:math_bird/game/configuration.dart';
import 'package:math_bird/game/math_bird_game.dart';

class NumberGroup extends PositionComponent with HasGameRef<MathBirdGame> {
  final _random = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    final usedHeights = <double>{}; // Track used positions to prevent overlap

    // Generate four random numbers with different operators (+, -, *, /)
    for (int i = 0; i < 4; i++) {
      final number = _random.nextInt(10) + 1;  // Random number from 1 to 10
      final operator = _randomOperator();
      double height;

      // Ensure non-overlapping heights
      do {
        height = _randomHeight();
      } while (usedHeights.any((usedHeight) => (height - usedHeight).abs() < 100));

      usedHeights.add(height);

      add(NumberComponent(number: number, operator: operator, height: height));
    }
  }

  String _randomOperator() {
    const operators = ['+', '-', '*', '/'];
    return operators[_random.nextInt(operators.length)];
  }

  double _randomHeight() {
    return _random.nextDouble() * (gameRef.size.y - Config.groundHeight);
  }
}
