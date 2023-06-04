import 'package:flutter/services.dart';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';

import 'game.dart';

enum PlayerState {
  idle,
  moving,
}

class Player extends SpriteGroupComponent<PlayerState>
    with
        HasGameRef<SpaceWalkerGame>,
        KeyboardHandler,
        TapCallbacks,
        CollisionCallbacks {
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
      (gameRef.size.y - size.y) / 2,
    );
  }

  @override
  void update(double dt) {
    _velocity.x = (_hAxisInput * 200).toDouble();

    position += _velocity * dt;
    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyDown = event is RawKeyDownEvent;
    final isHold = event.repeat;
    final isSpace = keysPressed.contains(LogicalKeyboardKey.space);

    if (isSpace && isHold && isKeyDown) {
      move();
    } else {
      stop();
    }

    return true;
  }

  @override
  void onTapDown(TapDownEvent event) {
    move();
  }

  @override
  void onTapUp(TapUpEvent event) {
    stop();
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
