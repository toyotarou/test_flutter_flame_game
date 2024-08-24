import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:test_flutter_flame_game/game/go_green_game.dart';
import 'package:test_flutter_flame_game/game/sprites/player.dart';

class Face extends SpriteComponent
    with HasGameRef<GoGreenGame>, CollisionCallbacks {
  ///
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load("menu_head_icon.png");

    size = Vector2.all(150);

    position = Vector2(0, (gameRef.size.y / 2) - size.y);

    anchor = Anchor.topCenter;

    add(RectangleHitbox());
  }

  ///
  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player && other.position.y > position.y) {
      other.removeFromParent();
    }

    super.onCollisionStart(intersectionPoints, other);
  }
}
