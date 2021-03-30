import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:words_play/frontend/common/AnimationState.dart';
import 'package:words_play/frontend/common/BaseAnimatedWidget.dart';

import 'ScreenSize.dart';

class BasicAnimatedWidget extends BaseAnimatedWidget {
  final double WidthRatio;
  final double HeightRatio;
  final double CenterXRatio;
  final double CenterYRatio;

  final double AnimationDuration;

  final Function _onFinished;

  SpriteComponent _component;
  AnimationState _state;
  double _animationStep;
  double _bounceThreshold;

  BasicAnimatedWidget(
    String imgSrc,
    this.WidthRatio,
    this.HeightRatio,
    this.CenterXRatio,
    this.CenterYRatio,
    this.AnimationDuration,
    this._onFinished,
  ) {
    _component = SpriteComponent.fromSprite(0, 0, Sprite(imgSrc));
    _state = AnimationState.NotStarted;
    _animationStep = 0;
    _bounceThreshold = AnimationDuration * 1.2;
  }
  @override
  void render(Canvas canvas) {
    canvas.save();
    _component.render(canvas);
    canvas.restore();
  }

  @override
  void resize() {}

  @override
  void run() {
    _state = AnimationState.Ongoing;
  }

  @override
  void update(double t) {
    switch (_state) {
      case AnimationState.NotStarted:
      case AnimationState.Finished:
        break;
      case AnimationState.Ongoing:
        _animationStep += t;

        if (_animationStep > _bounceThreshold) {
          _state = AnimationState.BounceBack;
        }
        _resizeAnimation();
        break;

      case AnimationState.BounceBack:
        _animationStep -= t;

        if (_animationStep < AnimationDuration) {
          _animationStep = AnimationDuration;
          _state = AnimationState.Finished;
          _onFinished();
        }

        _resizeAnimation();
    }
  }

  void _resizeAnimation() {
    double animationFactor = _animationStep / AnimationDuration;

    _component.width = screenSize.width * WidthRatio * animationFactor;
    _component.height = screenSize.height * HeightRatio * animationFactor;

    _component.x = screenSize.width * CenterXRatio - _component.width / 2;
    _component.y = screenSize.height * CenterYRatio - _component.height / 2;
  }

  @override
  void onTapDown(TapDownDetails details, Function onTap) {
    var pos = details.globalPosition;

    if (pos.dx >= _component.x && pos.dx <= _component.x + _component.width) {
      if (pos.dy >= _component.y &&
          pos.dy <= _component.y + _component.height) {
        onTap();
      }
    }
  }
}
