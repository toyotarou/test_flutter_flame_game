import 'package:flame/camera.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_flame_game/constants.dart';
import 'package:test_flutter_flame_game/game/go_green_world.dart';

class GoGreenGame extends FlameGame {
  GoGreenGame()
      : super(
          world: GoGreenWorld(),
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  ///
  @override
  Color backgroundColor() {
    return Colors.green;
  }
}
