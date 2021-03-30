import 'dart:ui';

import 'package:flutter/cupertino.dart';

abstract class BaseWidget {
  void render(Canvas canvas);

  void update(double t);

  void resize();

  void onTapDown(TapDownDetails details, Function onTap);
}
