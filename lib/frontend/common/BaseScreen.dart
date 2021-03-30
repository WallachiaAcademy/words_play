import 'dart:ui';

import 'package:flutter/cupertino.dart';

abstract class BaseScreen {
  void render(Canvas canvas);

  void update(double t);

  void resize();

  void onTapDown(TapDownDetails details);
}
