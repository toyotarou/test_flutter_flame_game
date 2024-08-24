import 'dart:async';

import 'package:flame/components.dart';
import 'package:test_flutter_flame_game/game/go_green_game.dart';
import 'package:test_flutter_flame_game/player.dart';

class GoGreenWorld extends World with HasGameRef<GoGreenGame> {
  ///
  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    add(Player());
  }
}
