import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'move_button.dart';
import 'player.dart';
import 'background.dart';

class SpaceWalkerGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  SpaceWalkerGame({super.children});

  late Player _player;
  late final CameraComponent _camera;

  final _world = World();
  final _background = Background();

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

    _player = Player();
    await _world.add(_player);

    await _world.add(MoveButton());
    await _world.add(_background);
  }

  void movePlayer() => _player.move();
  void stopPlayer() => _player.stop();
}
