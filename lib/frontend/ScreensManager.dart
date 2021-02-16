import 'dart:ui';

import 'package:flame/game.dart';
import 'package:words_play/backend/loading/Loader.dart';
import 'package:words_play/frontend/common/ScreenSize.dart';
import 'package:words_play/frontend/screens/ScreenState.dart';
import 'package:words_play/frontend/screens/loading/LoadingScreen.dart';

import 'common/BaseScreen.dart';

ScreensManager screensManager = ScreensManager();

class ScreensManager extends Game {
  ScreenState _state;

  BaseScreen _loadingScreen;
  Function _fn;

  Loader _loader;

  ScreensManager() {
    _state = ScreenState.LoadingScreen;
    _fn = _init;
    _loader = Loader();
  }

  @override
  void render(Canvas canvas) {
    _getActiveScreen()?.render(canvas);
  }

  @override
  void update(double t) {
    _fn(t);
  }

  void _init(double t) {
    setScreenState(ScreenState.LoadingScreen);
    _fn = _update;
    _loader.run();
  }

  void _update(double t) {
    _getActiveScreen()?.update(t);
  }

  @override
  void resize(Size size) {
    screenSize.resize(size);
    _getActiveScreen()?.resize();
  }

  BaseScreen _getActiveScreen() {
    switch (_state) {
      case ScreenState.LoadingScreen:
        return _loadingScreen;
      default:
        throw new Exception("Invalid screen state" + _state.toString());
    }
  }

  void setScreenState(ScreenState state) {
    switch (state) {
      case ScreenState.LoadingScreen:
        _loadingScreen = LoadingScreen(_loader);
        _loadingScreen.resize();
        break;
      default:
        break;
    }
    this._state = state;
  }
}
