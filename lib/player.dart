import 'package:flame/components.dart';

import 'game.dart';

class Player extends SpriteComponent with HasGameRef<SpaceWalkerGame> {
  Player({super.priority});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('spaceship/idle.png');

    position = gameRef.size / 2;
    width = 100;
    height = 150;
    anchor = Anchor.center;
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}
