import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:words_play/backend/loading/BaseLoader.dart';

class Loader extends BaseLoader {
  int _progress;

  Loader() {
    _progress = 0;
  }

  Future<void> run() async {
    await _initializeScreen();
    _progress = 20;
    await _loadAssets();
    _progress = 80;
    await _loadData();
    _progress = 100;
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
  int getProgress() {
    return _progress;
  }
}
