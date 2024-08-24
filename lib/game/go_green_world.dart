import 'dart:async';

import 'package:flame/components.dart';
import 'package:test_flutter_flame_game/constants.dart';
import 'package:test_flutter_flame_game/game/go_green_game.dart';
import 'package:test_flutter_flame_game/game/level_data.dart';
import 'package:test_flutter_flame_game/game/sprites/face.dart';
import 'package:test_flutter_flame_game/game/sprites/obstacle.dart';
import 'package:test_flutter_flame_game/game/sprites/player.dart';

class GoGreenWorld extends World with HasGameRef<GoGreenGame> {
  late final Player player;

  ///
  void loadLevel(List<ObstacleData> levelData) {
    removeAll(children.whereType<Obstacle>().toList());

    for (var data in levelData) {
      Obstacle obstacle;

      if (data.type == ObstacleType.dolphin) {
        obstacle = ObstacleDolphin()..position = data.position;
      } else if (data.type == ObstacleType.crab) {
        obstacle = ObstacleCrab()..position = data.position;
      } else {
        continue;
      }

      add(obstacle);
    }
  }

  ///
  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    player = Player();

    add(player);

    add(Face());

    loadLevel(LevelData().level1());
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
