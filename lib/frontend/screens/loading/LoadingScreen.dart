import 'dart:ui';

import 'package:words_play/backend/loading/BaseLoader.dart';
import 'package:words_play/frontend/common/Background.dart';
import 'package:words_play/frontend/common/BaseScreen.dart';
import 'package:words_play/frontend/common/BaseWidget.dart';

class LoadingScreen extends BaseScreen {
  BaseWidget _background;
  final BaseLoader _loader;

  LoadingScreen(this._loader) {
    _background = new Background('screens/loading/background.jpg');
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
