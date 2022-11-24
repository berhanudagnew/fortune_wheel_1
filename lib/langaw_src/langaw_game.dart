import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'components/fly.dart';
import 'components/house-fly.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';

class LangawGame extends Game {
  late Size screenSize;
  late double tileSize;
  late List<Fly> flies;
  late Random rnd;

  LangawGame() {
    initialize();
  }

  void initialize() async {
    flies = List<Fly>.empty(growable: true);
    rnd = Random();
    resize(await Flame.util.initialDimensions());

    spawnFly();
  }

  void spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - tileSize);
    double y = rnd.nextDouble() * (screenSize.height - tileSize);
    flies.add(HouseFly(this, x, y));
  }

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);

    flies.forEach((Fly fly) => fly.render(canvas));
  }

  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    flies.forEach((Fly fly) {
      if (fly.flyRect.contains(d.globalPosition)) {
        fly.onTapDown();
      }
    });
  }
}
