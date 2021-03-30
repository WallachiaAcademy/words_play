import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:words_play/frontend/common/BaseWidget.dart';

import 'ScreenSize.dart';

class Background extends BaseWidget {
  SpriteComponent _bg;
  Background(String bgSrc) {
    _bg = SpriteComponent.fromSprite(0, 0, Sprite(bgSrc));
  }
  @override
  void render(Canvas canvas) {
    _bg.render(canvas);
  }

  @override
  void resize() {
    _bg.width = screenSize.width;
    _bg.height = screenSize.height;
  }

  @override
  void update(double t) {
    // TODO: implement update
  }

  @override
  void onTapDown(TapDownDetails details, Function onTap) {
    // TODO: implement onTapDown
  }
}
