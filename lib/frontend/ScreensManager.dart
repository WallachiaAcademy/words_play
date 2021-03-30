import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:words_play/backend/loading/Loader.dart';
import 'package:words_play/frontend/common/ScreenSize.dart';
import 'package:words_play/frontend/screens/ScreenState.dart';
import 'package:words_play/frontend/screens/loading/LoadingScreen.dart';
import 'package:words_play/frontend/screens/menu/MenuScreen.dart';

import 'common/BaseScreen.dart';

ScreensManager screensManager = ScreensManager();

class ScreensManager extends Game with TapDetector {
  ScreenState _state;

  BaseScreen _loadingScreen;
  BaseScreen _menuScreen;

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
      case ScreenState.MenuScreen:
        return _menuScreen;
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
      case ScreenState.MenuScreen:
        _menuScreen = MenuScreen();
        _menuScreen.resize();
        break;
      default:
        break;
    }
    this._state = state;
  }

  @override
  void onTapDown(TapDownDetails details) {
    _getActiveScreen()?.onTapDown(details);
  }
}
