import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:fortune_wheel_1/langaw_src/components/fly.dart';
import 'package:fortune_wheel_1/langaw_src/langaw_game.dart';

class MachoFly extends Fly {
  double get speed => game.tileSize * 2.5;

  MachoFly(LangawGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 2.025, game.tileSize * 2.025);
    flyingSprite = List<Sprite>.empty(growable: true);
    flyingSprite.add(Sprite('flies/macho-fly-1.png'));
    flyingSprite.add(Sprite('flies/macho-fly-2.png'));
    deadSprite = Sprite('flies/macho-fly-dead.png');
  }
}
