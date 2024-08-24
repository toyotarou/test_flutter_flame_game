import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:test_flutter_flame_game/constants.dart';
import 'package:test_flutter_flame_game/game/go_green_game.dart';

class Obstacle extends SpriteComponent
    with HasGameRef<GoGreenGame>, CollisionCallbacks {
  Obstacle({required this.spritePath});

  final String spritePath;

  ///
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load(spritePath);

    size = Vector2.all(obstacleSize);

    anchor = Anchor.center;

    add(CircleHitbox());
  }
}

class ObstacleDolphin extends Obstacle {
  ObstacleDolphin() : super(spritePath: 'dolphin.png');
}

class ObstacleCrab extends Obstacle {
  ObstacleCrab() : super(spritePath: 'crab.png');
}
