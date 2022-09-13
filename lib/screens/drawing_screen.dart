// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

class DrawingScreen extends StatefulWidget {
  const DrawingScreen({Key? key}) : super(key: key);

  @override
  State<DrawingScreen> createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  Color selectedColor = Colors.black;
  List<Color> colors = [
    Colors.black,
    Colors.pink,
    Colors.red,
    Colors.purple,
    Colors.teal,
    Colors.green,
    Colors.amberAccent,
  ];

  List<DrawingPoint?> drawingPoints = [];
  double strokeWidth = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanStart: (details) {
          setState(() {
            drawingPoints.add(
              DrawingPoint(
                offset: details.localPosition,
                paint: Paint()
                  ..color = selectedColor
                  ..isAntiAlias = true
                  ..strokeWidth = strokeWidth
                  ..strokeCap = StrokeCap.round,
              ),
            );
          });
        },
        onPanUpdate: (details) {
          setState(() {
            drawingPoints.add(
              DrawingPoint(
                offset: details.localPosition,
                paint: Paint()
                  ..color = selectedColor
                  ..isAntiAlias = true
                  ..strokeWidth = strokeWidth
                  ..strokeCap = StrokeCap.round,
              ),
            );
          });
        },
        onPanEnd: (details) => drawingPoints.add(null),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomPaint(
            painter: _DrawingPainter(drawingPoints: drawingPoints),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.clear),
          onPressed: () {
            setState(() {
              drawingPoints.clear();
            });
          }),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.grey[200],
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(colors.length, (index) {
              return _buildColorChoose(colors[index]);
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildColorChoose(Color color) {
    bool isSelected = selectedColor == color;
    return InkWell(
      onTap: () => setState(() => selectedColor = color),
      child: Container(
        width: isSelected ? 47 : 40,
        height: isSelected ? 47 : 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: isSelected ? Border.all(color: color, width: 3) : null,
        ),
      ),
    );
  }
}

class _DrawingPainter extends CustomPainter {
  final List<DrawingPoint?> drawingPoints;

  _DrawingPainter({
    required this.drawingPoints,
  });

  List<Offset> offsets = [];

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < drawingPoints.length; i++) {
      if (drawingPoints[i] != null && drawingPoints[i + 1] != null) {
        canvas.drawLine(drawingPoints[i]!.offset, drawingPoints[i + 1]!.offset,
            drawingPoints[i]!.paint);
      } else if (drawingPoints[i] != null && drawingPoints[i + 1] == null) {
        offsets.clear();
        offsets.add(drawingPoints[i]!.offset);

        canvas.drawPoints(PointMode.points, offsets, drawingPoints[i]!.paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DrawingPoint {
  Offset offset;
  Paint paint;

  DrawingPoint({
    required this.offset,
    required this.paint,
  });
}
