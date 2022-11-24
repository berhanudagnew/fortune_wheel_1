import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:fortune_wheel_1/langaw_src/langaw_game.dart';

class Backyard {
  late final LangawGame game;
  late Sprite bgSprite;
  late Rect bgRect;

  Backyard(this.game) {
    bgSprite = Sprite('bg/backyard.png');
    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 23),
      game.tileSize * 9,
      game.tileSize * 23,
    );
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}
