import 'package:flame/components.dart';
import 'package:test_flutter_flame_game/constants.dart';

enum ObstacleType { dolphin, crab }

class ObstacleData {
  final Vector2 position;
  final ObstacleType type;

  ObstacleData({required this.position, required this.type});
}

class LevelData {
  final obstacleSpacing = obstacleSize + (playerHeight * 2);
  final leftSide = -(gameWidth / 2) + (obstacleSize / 2);
  final rightSide = (gameWidth / 2) - (obstacleSize / 2);

  ///
  List<ObstacleData> level1() {
    List<ObstacleData> level = [];

    level.addAll(obstacleRow(row: 0, item1: ObstacleType.dolphin));

    level.addAll(obstacleRow(
      row: 1,
      item2: ObstacleType.dolphin,
      item5: ObstacleType.crab,
    ));

    level.addAll(obstacleRow(
      row: 2,
      item3: ObstacleType.dolphin,
      item4: ObstacleType.crab,
    ));

    level.addAll(obstacleRow(
      row: 3,
      item2: ObstacleType.dolphin,
      item5: ObstacleType.crab,
    ));

    level.addAll(obstacleRow(
      row: 4,
      item3: ObstacleType.dolphin,
      item4: ObstacleType.crab,
    ));

    level.addAll(obstacleRow(
      row: 5,
      item2: ObstacleType.dolphin,
      item5: ObstacleType.crab,
    ));

    level.addAll(obstacleRow(
      row: 6,
      item3: ObstacleType.dolphin,
      item4: ObstacleType.crab,
    ));

    return level;
  }

  ///
  List<ObstacleData> obstacleRow({
    required int row,
    ObstacleType? item1,
    ObstacleType? item2,
    ObstacleType? item3,
    ObstacleType? item4,
    ObstacleType? item5,
  }) {
    List<ObstacleData> content = [];

    final yPosition = obstacleSpacing * row;

    if (row < 0 || row > 14) {
      throw Exception();
    }

    if (item1 != null) {
      content.add(
        ObstacleData(
          position: Vector2(leftSide, yPosition),
          type: item1,
        ),
      );
    }
    if (item2 != null) {
      content.add(
        ObstacleData(
          position: Vector2(leftSide + (gameWidth / 5), yPosition),
          type: item2,
        ),
      );
    }
    if (item3 != null) {
      content.add(
        ObstacleData(
          position: Vector2(0, yPosition),
          type: item3,
        ),
      );
    }
    if (item4 != null) {
      content.add(
        ObstacleData(
          position: Vector2(rightSide - (gameWidth / 5), yPosition),
          type: item4,
        ),
      );
    }
    if (item5 != null) {
      content.add(
        ObstacleData(
          position: Vector2(rightSide, yPosition),
          type: item5,
        ),
      );
    }

    return content;
  }
}
