import 'dart:ui';

import 'package:words_play/frontend/common/Background.dart';
import 'package:words_play/frontend/common/BaseScreen.dart';

class MenuScreen extends BaseScreen {
  Background _background;
  MenuScreen() {
    _background = Background('screens/menu/background.jpg');
  }
  @override
  void render(Canvas canvas) {
    _background.render(canvas);
  }

  @override
  void resize() {
    _background.resize();
  }

  @override
  void update(double t) {}
}
