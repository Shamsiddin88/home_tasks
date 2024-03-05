import 'package:flutter/cupertino.dart';

double height = 0.0;
double width = 0.0;

extension Size on int {
  double h() {
    return (this / 812) * height;
  }

  double w() {
    return (this / 375) * width;
  }

  SizedBox getH() {
    return SizedBox(
      height: (this / 812) * height,
    );
  }

  SizedBox getW() {
    return SizedBox(
      width: (this / 375) * width,
    );
  }


}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8 ){
      return Color(int.parse("0x$hexColor"));
    }
  }
}