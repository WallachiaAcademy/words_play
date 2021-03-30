import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:words_play/frontend/common/BaseWidget.dart';
import 'package:words_play/frontend/common/Constants.dart';
import 'package:words_play/frontend/common/ScreenSize.dart';

class LoadingBar extends BaseWidget {
  Paint _paint;

  Offset _p1;
  Offset _p2;

  double _progress;

  LoadingBar() {
    _paint = Paint();

    _p1 = Offset(0, 0);
    _p2 = Offset(0, 0);

    _progress = 0;
  }
  @override
  void render(Canvas canvas) {
    canvas.save();
    canvas.drawLine(_p1, _p2, _paint);
    canvas.restore();
  }

  @override
  void resize() {
    var rect = new Rect.fromCircle(
      center: new Offset(
        screenSize.width * kLoadingBarCircleWidth,
        screenSize.height * kLoadingBarCircleHeight,
      ),
      radius: screenSize.height * kLoadingBarCircleRadius,
    );

    var gradient = LinearGradient(colors: <Color>[
      Colors.yellow,
      Colors.deepOrange,
    ], stops: [
      0.0,
      1.0,
    ]);

    _paint = Paint()
      ..color = Colors.black
      ..strokeWidth = screenSize.height * kLoadingBarHeight
      ..shader = gradient.createShader(rect);
  }

  @override
  void update(double t) {
    if (t.compareTo(_progress) != 0) {
      _progress = t;

      _p1 = Offset(screenSize.width * kLoadingBarStart, screenSize.height / 2);
      _p2 = Offset(_p1.dx + screenSize.width * kLoadingBarEnd * _progress / 100,
          screenSize.height / 2);
    }
  }

  @override
  void onTapDown(TapDownDetails details, Function onTap) {
    // TODO: implement onTapDown
  }
}
