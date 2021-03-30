import 'dart:async';
import 'dart:ui';

import 'package:flutter/src/gestures/tap.dart';
import 'package:words_play/frontend/common/Background.dart';
import 'package:words_play/frontend/common/BaseAnimatedWidget.dart';
import 'package:words_play/frontend/common/BaseScreen.dart';
import 'package:words_play/frontend/common/BasicAnimatedWidget.dart';
import 'package:words_play/frontend/common/Constants.dart';

class MenuScreen extends BaseScreen {
  Background _background;
  BaseAnimatedWidget _logo;

  BaseAnimatedWidget _startButton;
  BaseAnimatedWidget _settingsButton;
  BaseAnimatedWidget _exitButton;

  MenuScreen() {
    _background = Background('screens/menu/background.jpg');
    _logo = BasicAnimatedWidget(
      'screens/menu/icon.png',
      kMainScreenLogoWidthRatio,
      kMainScreenLogoHeightRatio,
      kMainScreenLogoCenterX,
      kMainScreenLogoCenterY,
      0.5,
      () {
        _startButton.run();
        _settingsButton.run();
        _exitButton.run();
      },
    );

    _startButton = BasicAnimatedWidget(
      'screens/menu/start.png',
      kMainScreenButtonsWidthRatio,
      kMainScreenButtonsHeightRatio,
      kMainScreenButtonsCenterX,
      kMainScreenStartButtonCenterY,
      0.5,
      () {},
    );

    _settingsButton = BasicAnimatedWidget(
      'screens/menu/settings.png',
      kMainScreenButtonsWidthRatio,
      kMainScreenButtonsHeightRatio,
      kMainScreenButtonsCenterX,
      kMainScreenSettingsButtonCenterY,
      0.5,
      () {},
    );

    _exitButton = BasicAnimatedWidget(
      'screens/menu/exit.png',
      kMainScreenButtonsWidthRatio,
      kMainScreenButtonsHeightRatio,
      kMainScreenButtonsCenterX,
      kMainScreenExitButtonCenterY,
      0.5,
      () {},
    );

    Timer(Duration(milliseconds: 200), () {
      _logo.run();
    });
  }
  @override
  void render(Canvas canvas) {
    _background.render(canvas);
    _logo.render(canvas);

    _startButton.render(canvas);
    _settingsButton.render(canvas);
    _exitButton.render(canvas);
  }

  @override
  void resize() {
    _background.resize();
    _logo.resize();

    _startButton.resize();
    _settingsButton.resize();
    _exitButton.resize();
  }

  @override
  void update(double t) {
    _logo.update(t);

    _startButton.update(t);
    _settingsButton.update(t);
    _exitButton.update(t);
  }

  @override
  void onTapDown(TapDownDetails details) {
    _startButton.onTapDown(details, () {
      print("Start!!");
    });
    _settingsButton.onTapDown(details, () {
      print("Settings!!");
    });
    _exitButton.onTapDown(details, () {
      print("Exit!!");
    });
  }
}
