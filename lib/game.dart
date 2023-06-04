import 'package:flame/experimental.dart' show CameraComponent;
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'player.dart';
import 'world.dart';

class SpaceWalkerGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection, HasTappables {
  SpaceWalkerGame({super.children});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await add(Player());

    var world = World();
    await add(world);

    final camera = CameraComponent.withFixedResolution(
      world: world,
      width: 800,
      height: 600,
    );
  }
}
