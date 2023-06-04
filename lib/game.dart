import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'player.dart';
import 'world.dart';

  class SpaceWalkerGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  SpaceWalkerGame({super.children});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await add(Player());
    await add(World());
  }
}
