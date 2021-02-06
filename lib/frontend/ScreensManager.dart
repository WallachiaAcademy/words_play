import 'dart:ui';

import 'package:flame/game.dart';
import 'package:words_play/frontend/common/ScreenSize.dart';
import 'package:words_play/frontend/screens/ScreenState.dart';
import 'package:words_play/frontend/screens/loading/LoadingScreen.dart';

import 'common/BaseScreen.dart';

ScreensManager screensManager = ScreensManager();

class ScreensManager extends Game {
  ScreenState _state;

  BaseScreen _loadingScreen;

  ScreensManager() {
    setScreenState(ScreenState.LoadingScreen);
  }

  @override
  void render(Canvas canvas) {
    _getActiveScreen()?.render(canvas);
  }

  @override
  void update(double t) {
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
        _loadingScreen = LoadingScreen();
        _loadingScreen.resize();
        break;
      default:
        break;
    }
    this._state = state;
  }
}
