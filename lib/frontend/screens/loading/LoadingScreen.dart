import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:words_play/backend/loading/BaseLoader.dart';
import 'package:words_play/frontend/common/Background.dart';
import 'package:words_play/frontend/common/BaseScreen.dart';
import 'package:words_play/frontend/common/BaseWidget.dart';
import 'package:words_play/frontend/screens/loading/LoadingBar.dart';

class LoadingScreen extends BaseScreen {
  BaseWidget _background;
  BaseWidget _loadingBar;
  final BaseLoader _loader;

  LoadingScreen(this._loader) {
    _background = new Background('screens/loading/background.jpg');
    _loadingBar = LoadingBar();
  }
  @override
  void render(Canvas canvas) {
    _background.render(canvas);
    _loadingBar.render(canvas);
  }

  @override
  void resize() {
    _background.resize();
    _loadingBar.resize();
  }

  @override
  void update(double t) {
    _loadingBar.update(_loader.getProgress().toDouble());
  }
}
