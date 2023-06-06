import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'player.dart';
import 'portal.dart';
import 'background.dart';
import 'touch_control.dart';

class SpaceWalkerGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  SpaceWalkerGame({super.children});

  final double gameHeight = 800;
  final double gameWidth = 1600;

  late final CameraComponent _camera;

  final _player = Player();
  final _portal = Portal();
  final _world = World();
  final _background = Background();
  final _touchControl = TouchControl();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    _camera = CameraComponent.withFixedResolution(
      world: _world,
      width: gameWidth,
      height: gameHeight,
    );
    _camera.viewfinder.anchor = Anchor.topLeft;
    await addAll([_camera, _world]);

    await _world.add(_player);
    await _world.add(_portal);

    await _world.add(_touchControl);
    await _world.add(_background);
  }

  void movePlayer() => _player.move();
  void stopPlayer() => _player.stop();
}
