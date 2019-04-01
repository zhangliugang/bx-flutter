import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:math';

class PaintPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaintPageStae();
}

class _PaintPageStae extends State<PaintPage> {
  List<Offset> _points = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Paint'),
        ),
        body: Builder(builder: (BuildContext context) => GestureDetector(
            onPanStart: (DragStartDetails start) {
              _points.clear();
            },
            onPanUpdate: (DragUpdateDetails update) {
              setState(() {
                RenderBox referenceBox = context.findRenderObject();
                Offset localPosition =
                    referenceBox.globalToLocal(update.globalPosition);
                _points = new List.from(_points)..add(localPosition);
              });
            },
            onPanEnd: (DragEndDetails end) {
              _points.add(null);
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: OpenPainter(_points),
              ),
            ),
          )
        ));
  }
}

class OpenPainter extends CustomPainter {
  OpenPainter(this.points);
  final List<Offset> points;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..isAntiAlias = true;

    var path1 = Path()
      ..moveTo(100, 100)
      ..lineTo(200, 100)
      ..lineTo(200, 200)
      ..lineTo(100, 200)
      ..close();
    canvas.drawPath(path1, paint);
    canvas.drawCircle(Offset(200, 200), 100, paint);
    // canvas.save();
    // canvas.restore();
    Paint paint2 = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint2);
    }
  }

  @override
  bool shouldRepaint(OpenPainter oldDelegate) => oldDelegate.points != points;
}
