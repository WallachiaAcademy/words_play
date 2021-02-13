import 'dart:ui';

ScreenSize screenSize = ScreenSize();

class ScreenSize {
  Size size = Size(0, 0);
  void resize(Size size) {
    this.size = size;
  }

  get width => size.width;
  get height => size.height;
}
