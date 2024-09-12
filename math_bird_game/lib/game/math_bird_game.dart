// import 'package:flame/components.dart';
// import 'package:flame/events.dart';
// import 'package:flame/game.dart';
// import 'package:math_bird/components/background.dart';
// import 'package:math_bird/components/bird.dart';
// import 'package:math_bird/components/ground.dart';
// import 'package:math_bird/components/pipe_group.dart';
// import 'package:math_bird/game/configuration.dart';
// import 'package:flutter/painting.dart';

// class MathBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
//   MathBirdGame();

//   late Bird bird;
//   Timer interval = Timer(Config.pipeInterval, repeat: true);
//   bool isHit = false;
//   late TextComponent score;
//   @override
//   Future<void> onLoad() async {
//     addAll([
//       Background(),
//       Ground(),
//       bird = Bird(),
//       score = buildScore(),
//     ]);

//     interval.onTick = () => add(PipeGroup());
//   }

//   TextComponent buildScore() {
//     return TextComponent(
//         position: Vector2(size.x / 2, size.y / 2 * 0.2),
//         anchor: Anchor.center,
//         textRenderer: TextPaint(
//           style: const TextStyle(
//               fontSize: 40, fontFamily: 'Game', fontWeight: FontWeight.bold),
//         ));
//   }

//   @override
//   void onTap() {
//     bird.fly();
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);
//     interval.update(dt);
//     score.text = 'Score: ${bird.score}';
//   }
// }
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:math_bird/components/background.dart';
import 'package:math_bird/components/bird.dart';
import 'package:math_bird/components/ground.dart';
import 'package:math_bird/components/number_group.dart';
import 'package:flutter/painting.dart';
import 'package:math_bird/game/assets.dart';
import 'package:math_bird/game/configuration.dart';

class MathBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  MathBirdGame();

  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;
  late TextComponent score;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
    ]);

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
        ));
  }

  @override
  void onTap() {
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    print("${bird.score}");
    score.text = 'Score: ${bird.score}';

    if (bird.score < 0) {
      gameOver();
    }
  }

  void gameOver() {
    FlameAudio.play(Assets.gameOver); // Play game over sound
    isHit = true;
    overlays.add('gameOver');
    pauseEngine();
  }
}
