import 'dart:math';

import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:words_play/backend/loading/BaseLoader.dart';

class Loader extends BaseLoader {
  double _progress;
  double _desireProgress;

  Loader() {
    _progress = 0;
    _desireProgress = 0;
  }

  Future<void> run() async {
    _setProgress(20);
    await _initializeScreen();
    _setProgress(80);
    await _loadAssets();
    _setProgress(90);
    await _loadData();
    _setProgress(100);
  }

  Future<void> _initializeScreen() async {
    Util flameUtils = Util();
    await flameUtils.fullScreen();
    await flameUtils.setOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
    );
  }

  Future<void> _loadAssets() async {
    // TODO: implement load assets
  }
  Future<void> _loadData() async {
    // TODO: implement load data
  }

  @override
  double getProgress() {
    return _progress;
  }

  @override
  void update(double t) {
    if (_progress < _desireProgress) {
      _progress = min(_progress + t * 100, _desireProgress);
    }
  }

  void _setProgress(double value) {
    _desireProgress = value;
  }

  @override
  bool isComplete() {
    return _progress.round() == 100;
  }
}
