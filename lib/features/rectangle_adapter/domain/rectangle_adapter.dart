class Rectangle {
  final int x1;
  final int y1;
  final int x2;
  final int y2;

  Rectangle(
      {required this.x1, required this.y1, required this.x2, required this.y2});
}

class RectangleLegacy {
  final int x;
  final int y;
  final int w;
  final int h;

  RectangleLegacy(
      {required this.x, required this.y, required this.w, required this.h});
}

abstract class IRectangleAdapter {
  Rectangle convertRectangle(int x, int y, int w, int h);
  Rectangle convertRectangleFromLegacy(RectangleLegacy rectangleLegacy);
}

class RectangleLegacyAdapter implements IRectangleAdapter {
  @override
  Rectangle convertRectangle(int x, int y, int w, int h) =>
      Rectangle(x1: x + h, y1: y + h, x2: x + w, y2: y + w);

  @override
  Rectangle convertRectangleFromLegacy(RectangleLegacy rectangleLegacy) =>
      Rectangle(
          x1: rectangleLegacy.x + rectangleLegacy.h,
          y1: rectangleLegacy.y + rectangleLegacy.h,
          x2: rectangleLegacy.x + rectangleLegacy.w,
          y2: rectangleLegacy.y + rectangleLegacy.w);
}
