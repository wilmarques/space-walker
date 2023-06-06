import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'game.dart';

class Portal extends CircleComponent with HasGameRef<SpaceWalkerGame> {
  Portal()
      : super(
          anchor: Anchor.center,
          priority: 1,
          radius: 50,
          paint: Paint()
            ..color = const Color.fromARGB(255, 238, 231, 34)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 15,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await add(CircleHitbox(radius: 10, collisionType: CollisionType.passive));

    position = Vector2(
      gameRef.gameWidth - 100,
      gameRef.gameHeight / 2,
    );
  }
}
