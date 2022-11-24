import 'dart:math';

import 'package:flutter/material.dart';

class ArrowView extends StatelessWidget {
  double height;
  double width;
  ArrowView({required this.height, required this.width});
  // Size get size => Size(MediaQuery.of(context).size.width * 0.8,
  //     MediaQuery.of(context).size.width * 0.8);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Transform.rotate(
        angle: pi,
        child: Padding(
          padding: EdgeInsets.only(top: height / 2 + 15),
          child: ClipPath(
            clipper: _ArrowClipper(),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.yellow, Colors.yellow])),
              height: height / 2 - 100,
              width: width / 2 - 100,
            ),
          ),
        ),
      ),
    );
  }
}

class _ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path _path = Path();
    Offset _center = size.center(Offset.zero);
    _path.lineTo(_center.dx, size.height);
    _path.lineTo(size.width, 0);
    _path.lineTo(_center.dx, _center.dy);
    _path.close();
    return _path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
