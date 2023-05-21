import 'package:flame/components.dart';

import 'game.dart';

class World extends SpriteComponent with HasGameRef<SpaceWalkerGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('worlds/beautiful/beautiful-1.png');
  }
}
