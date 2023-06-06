import 'package:flutter/services.dart';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'game.dart';
import 'portal.dart';

enum PlayerState {
  idle,
  moving,
}

class Player extends SpriteGroupComponent<PlayerState>
    with HasGameRef<SpaceWalkerGame>, KeyboardHandler, CollisionCallbacks {
  Player()
      : super(
          anchor: Anchor.center,
          priority: 2,
        );

  var _hAxisInput = 0;
  final _velocity = Vector2.zero();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await add(RectangleHitbox(size: Vector2(90, 90)));
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
      gameRef.movePlayer();
    } else {
      gameRef.stopPlayer();
    }

    return true;
  }

  @override
  void onCollisionStart(intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Portal) {
      _resetPosition();
    }
  }

  void move() {
    _hAxisInput = 0;
    current = PlayerState.moving;
    _hAxisInput += 1;
  }

  void stop() {
    _hAxisInput = 0;
    current = PlayerState.idle;
  }

  void reset() {
    _resetVelocity();
    _resetPosition();
    current = PlayerState.idle;
  }

  void _resetVelocity() {
    var Vector2(:x) = Vector2.zero();
    _velocity.x = x;
  }

  void _resetPosition() {
    position = Vector2(
      100,
      gameRef.gameHeight / 2,
    );
  }

  Future<void> _loadCharacterSprites() async {
    sprites = <PlayerState, Sprite>{
      PlayerState.idle: await gameRef.loadSprite('spaceship/idle.png'),
      PlayerState.moving: await gameRef.loadSprite('spaceship/moving.gif'),
    };
  }
}
