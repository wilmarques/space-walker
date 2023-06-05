import 'package:flutter/services.dart';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'game.dart';

enum PlayerState {
  idle,
  moving,
}

class Player extends SpriteGroupComponent<PlayerState>
    with HasGameRef<SpaceWalkerGame>, KeyboardHandler, CollisionCallbacks {
  Player()
      : super(
          anchor: Anchor.center,
          priority: 1,
        );

  var _hAxisInput = 0;
  var _velocity = Vector2.zero();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await add(CircleHitbox());
    await _loadCharacterSprites();

    resetPosition();
    current = PlayerState.idle;
  }

  @override
  void update(double dt) {
    double moveSpeed = 200;
    _velocity.x = _hAxisInput * moveSpeed;

    position += _velocity * dt;
    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyDown = event is RawKeyDownEvent;
    final isHold = event.repeat;
    final isSpace = keysPressed.contains(LogicalKeyboardKey.space);
    final isWKey = keysPressed.contains(LogicalKeyboardKey.keyW);

    if ((isSpace || isWKey) && isHold && isKeyDown) {
      game.movePlayer();
    } else {
      game.stopPlayer();
    }

    return true;
  }

  void move() {
    _hAxisInput = 0;
    current = PlayerState.moving;
    _hAxisInput += 1;
  }

  void stop() {
    current = PlayerState.idle;
    _hAxisInput = 0;
  }

  void reset() {
    _velocity = Vector2.zero();
    current = PlayerState.idle;
    resetPosition();
  }

  void resetPosition() {
    position = Vector2(
      100,
      (800 / 2) - size.y,
    );
  }

  Future<void> _loadCharacterSprites() async {
    final idle = await gameRef.loadSprite('spaceship/idle.png');
    final moving = await gameRef.loadSprite('spaceship/moving.gif');

    sprites = <PlayerState, Sprite>{
      PlayerState.idle: idle,
      PlayerState.moving: moving,
    };
  }
}
