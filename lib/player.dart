import 'dart:async';

import 'package:flame/components.dart';

class Player extends SpriteComponent {
  ///
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load("coinpig.png");

    size = Vector2.all(100);

    position = Vector2(0, 0);

    anchor = Anchor.center;
  }
}
