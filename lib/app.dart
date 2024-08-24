import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_flame_game/constants.dart';
import 'package:test_flutter_flame_game/game/go_green_game.dart';

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  late final GoGreenGame game;

  ///
  @override
  void initState() {
    super.initState();

    game = GoGreenGame();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.yellowAccent,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: FittedBox(
              child: SizedBox(
                width: gameWidth,
                height: gameHeight,
                child: GameWidget(
                  game: game,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
