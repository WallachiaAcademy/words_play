import 'dart:async';
import 'dart:ui';

import 'package:words_play/frontend/common/Background.dart';
import 'package:words_play/frontend/common/BaseAnimatedWidget.dart';
import 'package:words_play/frontend/common/BaseScreen.dart';
import 'package:words_play/frontend/common/BasicAnimatedWidget.dart';
import 'package:words_play/frontend/common/Constants.dart';

class MenuScreen extends BaseScreen {
  Background _background;
  BaseAnimatedWidget _logo;
  MenuScreen() {
    _background = Background('screens/menu/background.jpg');
    _logo = BasicAnimatedWidget(
      'screens/menu/icon.png',
      kMainScreenLogoWidthRatio,
      kMainScreenLogoHeightRatio,
      kMainScreenLogoCenterX,
      kMainScreenLogoCenterY,
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
  }

  @override
  void resize() {
    _background.resize();
    _logo.resize();
  }

  @override
  void update(double t) {
    _logo.update(t);
  }
}
