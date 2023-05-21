import 'package:flame/events.dart';
import 'package:flame/game.dart';

import 'player.dart';
import 'world.dart';

class SpaceWalkerGame extends FlameGame with PanDetector {
  late Player player;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await add(Player(priority: 1));
    await add(World());
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.game);
  }
}
