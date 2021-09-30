import 'package:flutter/cupertino.dart';

class SizeConfig {
  static double screenWidth;
  static double screenHeight;
  static double blockVertical;
  static double blockHorizontal;
  static double textMultiplier;

  void init(BoxConstraints boxConstraints) {
    screenWidth = boxConstraints.maxWidth;
    screenHeight = boxConstraints.maxHeight;

    blockVertical = screenHeight / 100;
    blockHorizontal = screenWidth / 100;
    textMultiplier = blockHorizontal;
  }
}
