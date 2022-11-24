import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ClipPath(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          color: Colors.red,
        ),
        clipper: CustomClipPath(),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 50.0;
  @override
  Path getClip(Size size) {
    Offset _center = size.center(Offset.zero);
    Rect _rect = Rect.fromCircle(center: _center, radius: size.width / 2);
    Path path = Path();
    // path.moveTo(size.width / 2, 0);
    path.moveTo(_center.dx, _center.dy);
    path.arcTo(_rect, 0 / 2, 360, false);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
