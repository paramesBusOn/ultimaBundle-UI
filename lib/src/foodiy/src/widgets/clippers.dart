import 'package:flutter/material.dart';

class BottomContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final _xScaling = size.width / size.width;
    final _yScaling = size.height / 450.0;
    path.lineTo(0 * _xScaling, 406 * _yScaling);
    // ignore: cascade_invocations
    path.cubicTo(
      0 * _xScaling,
      406 * _yScaling,
      93.719 * _xScaling,
      428.359 * _yScaling,
      187.469 * _xScaling,
      428.359 * _yScaling,
    );
    // ignore: cascade_invocations
    path.cubicTo(
      281.219 * _xScaling,
      428.359 * _yScaling,
      size.width * _xScaling,
      406 * _yScaling,
      size.width * _xScaling,
      406 * _yScaling,
    );
    // ignore: cascade_invocations
    path.cubicTo(
      size.width * _xScaling,
      406 * _yScaling,
      size.width * _xScaling,
      0 * _yScaling,
      size.width * _xScaling,
      0 * _yScaling,
    );
    // ignore: cascade_invocations
    path.cubicTo(
      size.width * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    // ignore: cascade_invocations
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      406 * _yScaling,
      0 * _xScaling,
      406 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}


