import 'package:flutter/widgets.dart';

class CustomRectTween extends RectTween {
  CustomRectTween({super.begin, super.end});

  @override
  Rect lerp(double t) {
    return Rect.lerp(begin, end, Curves.easeInOut.transform(t))!;
  }
}
