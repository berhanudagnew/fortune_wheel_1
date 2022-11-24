import 'dart:ui';

class Luck {
  final String image;
  final Color color;

  Luck(this.image, this.color);

  String get asset => "assets/images/$image.png";
}
