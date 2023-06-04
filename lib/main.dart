import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import 'game.dart';

void main() {
  runApp(
    const GameWidget<SpaceWalkerGame>.controlled(
      gameFactory: SpaceWalkerGame.new,
    ),
  );
}
