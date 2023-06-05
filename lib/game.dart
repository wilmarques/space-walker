import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'player.dart';
import 'background.dart';
import 'touch_control.dart';

class SpaceWalkerGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  SpaceWalkerGame({super.children});

  late final CameraComponent _camera;

  final _player = Player();
  final _world = World();
  final _background = Background();
  final _touchControl = TouchControl();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    _camera = CameraComponent.withFixedResolution(
      world: _world,
      width: 1600,
      height: 800,
    );
    _camera.viewfinder.anchor = Anchor.topLeft;
    await addAll([_camera, _world]);

    await _world.add(_player);

    await _world.add(_touchControl);
    await _world.add(_background);
  }

  void movePlayer() => _player.move();
  void stopPlayer() => _player.stop();
}
