import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:math_bird_game/components/background.dart';
import 'package:math_bird_game/components/ground.dart';
import 'package:math_bird_game/components/bird.dart';
import 'package:math_bird_game/components/number_group.dart';
import 'package:math_bird_game/game/configuration.dart';
import 'package:flutter/material.dart';

class MathBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;
  late TextComponent score;
  late TextComponent targetScoreText;
  late int targetScore;

  @override
  Future<void> onLoad() async {
    targetScore = _generateNewTargetScore(); // Initialize target score
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
      targetScoreText = buildTargetScoreText(), // Add target score text
    ]);

    targetScoreText.text = 'Target Score: $targetScore'; // Set initial target score text

    interval.onTick = () => add(NumberGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40,
          fontFamily: 'Game',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  TextComponent buildTargetScoreText() {
    return TextComponent(
      position: Vector2(size.x / 2, size.y / 2 * 0.1),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 30,
          fontFamily: 'Game',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  int _generateNewTargetScore() {
    // Generate a random target score between 50 and 100
    return 50 + (Random().nextInt(51)); // Adjust the range as needed
  }

  @override
  void onTap() {
    if (isHit) {
      resetGame(); // Reset the game if it's hit
    } else {
      bird.fly();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = 'Score: ${bird.score}';

    if (bird.score < 0) {
      gameOver();
    }

    if (bird.score == targetScore) {
      winLevel();
    }
  }

  void gameOver() {
    FlameAudio.play('gameover.wav'); // Play game over sound
    isHit = true;
    overlays.add('gameOver');
    pauseEngine();
  }

  void winLevel() {
    FlameAudio.play('levelup.wav'); // Play level-up sound
    showWinMessage(); // Show win message
    interval.stop(); // Stop the timer for number generation
  }

  void showWinMessage() {
    overlays.add('winMessage'); // Add overlay for win message
  }

  void resetGame() {
    // Remove win message overlay
    overlays.remove('winMessage');
    
    // Remove all components related to Level 1
    final componentsToRemove = children.toList(); // Get all current components
    for (var component in componentsToRemove) {
      remove(component); // Remove each component
    }
    
    bird.reset(); // Reset bird for new level
    
    targetScore = _generateNewTargetScore(); // Set new target score for Level 2
    
    // Add NumberGroup or other components needed for Level 2
    add(NumberGroup());
    targetScoreText.text = 'Target Score: $targetScore'; // Show new target score
  }
}
