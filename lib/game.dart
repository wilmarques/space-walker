import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'player.dart';
import 'background.dart';

class SpaceWalkerGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  SpaceWalkerGame({super.children});

  final world = World();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final camera = CameraComponent.withFixedResolution(
      world: world,
      width: 1600,
      height: 800,
    );
    camera.viewfinder.anchor = Anchor.topLeft;
    await addAll([camera, world]);

    await world.add(Player());
    await world.add(Background());
  }
}
