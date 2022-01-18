import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);
    var paintbrush = Paint()..color = Colors.grey.shade900;
    var outlinebrush = Paint()
      ..color = Colors.green.shade100
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    var innerbrush = Paint()..color = Colors.green.shade100;

    var minhandbrush = Paint()
      ..color = Colors.orange.shade100
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;

    var hourhandbrush = Paint()
      ..color = Colors.orange.shade200
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;
    var sechandbrush = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawCircle(center, radius - 40, paintbrush);

    canvas.drawCircle(center, radius - 40, outlinebrush);
    var secondX = centerX + 80 * cos(90 * pi / 180);
    var secondY = centerX + 80 * sin(90 * pi / 180);
    canvas.drawLine(center, Offset(secondX, secondY), sechandbrush);
    var minX = centerX + 80 * cos(45 * pi / 180);
    var minY = centerX + 80 * sin(45 * pi / 180);
    canvas.drawLine(center, Offset(minX, minY), minhandbrush);
    var hourX = centerX + 60 * cos(180 * pi / 180);
    var hourY = centerX + 60 * sin(180 * pi / 180);
    canvas.drawLine(center, Offset(hourX, hourY), hourhandbrush);
    canvas.drawCircle(center, 8, outlinebrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
