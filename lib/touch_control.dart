import 'package:flame/components.dart';
import 'package:flame/events.dart';

import 'game.dart';

class TouchControl extends CircleComponent
    with HasGameRef<SpaceWalkerGame>, TapCallbacks {

  // Enable touch control from any point of the screen
  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void onTapDown(TapDownEvent event) {
    gameRef.movePlayer();
  }

  @override
  void onTapUp(TapUpEvent event) {
    gameRef.stopPlayer();
  }
}
