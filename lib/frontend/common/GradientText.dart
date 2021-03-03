import 'package:flutter/cupertino.dart';
import 'package:words_play/frontend/common/Constants.dart';

import 'ScreenSize.dart';

class GradientText {
  TextPainter _painter;
  TextStyle _textStyle;
  Offset _position;

  final double _fontRatio;
  final double _xRatio;
  final double _yRatio;
  final Color _first;
  final Color _second;

  GradientText(
    this._fontRatio,
    this._xRatio,
    this._yRatio,
    this._first,
    this._second,
  ) {
    _painter = TextPainter(
        textAlign: TextAlign.center, textDirection: TextDirection.ltr);
    _textStyle = TextStyle();
    _painter.text = TextSpan(text: '');
    _painter.layout();
    _position = Offset.zero;
  }

  void render(Canvas canvas) {
    _painter.paint(canvas, _position);
  }

  void resize() {
    var rect = Rect.fromCircle(
      center: Offset(screenSize.width * _xRatio, screenSize.height * _yRatio),
      radius: screenSize.height * kLoadingBarCircleRadius / 2,
    );

    var gradient = LinearGradient(colors: <Color>[
      _first,
      _second,
    ]);

    _textStyle = TextStyle(
      foreground: Paint()..shader = gradient.createShader(rect),
      fontSize: screenSize.width * _fontRatio,
      fontWeight: FontWeight.bold,
    );

    _layout();
  }

  void setText(String text) {
    _painter.text = TextSpan(text: text, style: _textStyle);
    _layout();
  }

  void _layout() {
    _painter.layout();
    _position = Offset(
      screenSize.width * _xRatio - _painter.width / 2,
      screenSize.height * _yRatio - _painter.height / 2,
    );
  }
}
