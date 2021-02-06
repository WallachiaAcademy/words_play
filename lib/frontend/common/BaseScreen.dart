import 'dart:ui';

abstract class BaseScreen {
  void render(Canvas canvas);

  void update(double t);

  void resize();
}
