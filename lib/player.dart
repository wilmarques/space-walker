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
  final _velocity = Vector2.zero();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await add(CircleHitbox());
    await _loadCharacterSprites();

    _resetPosition();
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
    current = PlayerState.idle;
    _resetVelocity();
    _resetPosition();
  }

  void _resetVelocity() {
    var Vector2(:x) = Vector2.zero();
    _velocity.x = x;
  }

  void _resetPosition() {
    const gameHeigth = 800;
    position = Vector2(
      100,
      (gameHeigth / 2) - size.y,
    );
  }

  Future<void> _loadCharacterSprites() async {
    sprites = <PlayerState, Sprite>{
      PlayerState.idle: await gameRef.loadSprite('spaceship/idle.png'),
      PlayerState.moving: await gameRef.loadSprite('spaceship/moving.gif'),
    };
  }
}
