import 'dart:math';

import 'package:flame/components.dart';

import 'game.dart';

class Background extends SpriteGroupComponent<int>
    with HasGameRef<SpaceWalkerGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await _loadBackgroundImages();
    changeWorld();
  }

  Future<void> _loadBackgroundImages() async {
    sprites = <int, Sprite>{
      1: await gameRef.loadSprite('worlds/world-1.png'),
      2: await gameRef.loadSprite('worlds/world-2.png'),
      3: await gameRef.loadSprite('worlds/world-3.png'),
      4: await gameRef.loadSprite('worlds/world-4.png'),
    };
  }

  void changeWorld() {
    int randomWorldNumber;
    do {
      randomWorldNumber = Random().nextInt(4) + 1;
    } while (current == randomWorldNumber);
    current = randomWorldNumber;
  }
}
