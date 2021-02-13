import 'dart:ui';

abstract class BaseWidget {
  void render(Canvas canvas);

  void update(double t);

  void resize();
}
