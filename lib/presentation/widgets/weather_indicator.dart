import 'package:flutter/material.dart';

class WeatherIndicator extends StatelessWidget {
  const WeatherIndicator({
    Key? key,
    required this.weather,
    required this.width,
    required this.height,
    required this.sizeMultiplier,
  }) : super(key: key);

  final double weather;
  final double sizeMultiplier;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: MyPainter(weather, sizeMultiplier),
    );
  }
}

class MyPainter extends CustomPainter {
  const MyPainter(this.weather, this.sizeMultiplier);

  final double weather;
  final double sizeMultiplier;

  void drawerCircle(Canvas canvas, Offset offset, Color color, double radius) {
    final painter = Paint()
      ..color = color
      ..strokeWidth = 20.0;

    canvas.drawCircle(offset, radius, painter);
  }

  void drawerLine(Canvas canvas, Offset from, Offset to, Color color) {
    final painter = Paint()
      ..color = color
      ..strokeWidth = 3.0;

    canvas.drawLine(from, to, painter);
  }

  @override
  void paint(Canvas canvas, Size size) {
    drawerCircle(
        canvas,
        Offset(size.width / 2,
            size.height / 2 + 7 * (1 - weather) * sizeMultiplier),
        Colors.yellow,
        weather == 0 ? 0 : 20 * sizeMultiplier);

    if (weather == 0) {
      drawerLine(
          canvas,
          Offset(size.width / 2 - 20 * sizeMultiplier,
              size.height / 2 + 30 * sizeMultiplier),
          Offset(size.width / 2 - 12 * sizeMultiplier,
              size.height / 2 + 10 * sizeMultiplier),
          Colors.blue);
    }

    if (weather == 0) {
      drawerLine(
          canvas,
          Offset(size.width / 2 - 5 * sizeMultiplier,
              size.height / 2 + 30 * sizeMultiplier),
          Offset(size.width / 2 + 3 * sizeMultiplier,
              size.height / 2 + 10 * sizeMultiplier),
          Colors.blue);
    }

    if (weather == 0) {
      drawerLine(
          canvas,
          Offset(size.width / 2 + 12 * sizeMultiplier,
              size.height / 2 + 30 * sizeMultiplier),
          Offset(size.width / 2 + 20 * sizeMultiplier,
              size.height / 2 + 10 * sizeMultiplier),
          Colors.blue);
    }

    if (weather != 1) {
      drawerCircle(
          canvas,
          Offset(size.width / 2, size.height / 2 + 10 * sizeMultiplier),
          weather != 0 ? Colors.grey : const Color(0xFF565656),
          15 * sizeMultiplier);
    }

    if (weather != 1) {
      drawerCircle(
          canvas,
          Offset(size.width / 2 - 15 * sizeMultiplier,
              size.height / 2 + 10 * sizeMultiplier),
          weather != 0 ? Colors.grey : const Color(0xFF565656),
          12 * sizeMultiplier);
    }

    if (weather != 1) {
      drawerCircle(
          canvas,
          Offset(size.width / 2 + 15 * sizeMultiplier,
              size.height / 2 + 7 * sizeMultiplier),
          weather != 0 ? Colors.grey : const Color(0xFF565656),
          14 * sizeMultiplier);
    }
  }

  @override
  bool shouldRepaint(covariant MyPainter oldDelegate) {
    return oldDelegate.weather != weather;
  }
}
