import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Hexagon> hexagons;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 30))..repeat();
    hexagons = List.generate(6, (index) => Hexagon(angle: index * (360 / 6), radius: 200.0, sideLength: 60.0));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: BackgroundPainter(hexagons, _controller.value),
          size: Size.infinite,
        );
      },
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final List<Hexagon> hexagons;
  final double animationValue;

  BackgroundPainter(this.hexagons, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blue.withOpacity(0.3)..strokeCap = StrokeCap.round..strokeWidth = 2.0;

    for (var hexagon in hexagons) {
      Path path = Path();
      double angle = hexagon.angle * pi / 180;
      double centerX = size.width / 2 + cos(angle) * hexagon.radius;
      double centerY = size.height / 2 + sin(angle) * hexagon.radius;

      for (int i = 0; i < 6; i++) {
        double x = centerX + hexagon.sideLength * cos(angle + i * pi / 3);
        double y = centerY + hexagon.sideLength * sin(angle + i * pi / 3);
        if (i == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Hexagon {
  final double angle;
  final double radius;
  final double sideLength;

  Hexagon({required this.angle, required this.radius, required this.sideLength});
}
