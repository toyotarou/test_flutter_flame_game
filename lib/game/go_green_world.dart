import 'dart:async';

import 'package:flame/components.dart';
import 'package:test_flutter_flame_game/constants.dart';
import 'package:test_flutter_flame_game/game/go_green_game.dart';
import 'package:test_flutter_flame_game/game/sprites/face.dart';
import 'package:test_flutter_flame_game/game/sprites/obstacle.dart';
import 'package:test_flutter_flame_game/game/sprites/player.dart';

class GoGreenWorld extends World with HasGameRef<GoGreenGame> {
  late final Player player;

  ///
  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    player = Player();

    add(player);

    add(Face());

    add(ObstacleDolphin()..position = Vector2(0, 0));
    add(ObstacleCrab()..position = Vector2(-obstacleSize * 3, 0));
  }

  ///
  @override
  void update(double dt) {
    super.update(dt);

    children.whereType<Obstacle>().forEach((element) {
      element.position.y -= (dt * 400);

      if (element.position.y <= -(gameRef.size.y / 2)) {
        element.position.y = extendedHeight;
      }
    });
  }
}
