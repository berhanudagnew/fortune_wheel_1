import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:fortune_wheel_1/langaw_src/components/fly.dart';
import 'package:fortune_wheel_1/langaw_src/langaw_game.dart';

class HungryFly extends Fly {
  HungryFly(LangawGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.65, game.tileSize * 1.65);
    flyingSprite = List<Sprite>.empty(growable: true);
    flyingSprite.add(Sprite('flies/hungry-fly-1.png'));
    flyingSprite.add(Sprite('flies/hungry-fly-2.png'));
    deadSprite = Sprite('flies/hungry-fly-dead.png');
  }
}
