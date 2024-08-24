import 'package:flutter/material.dart';

class SizeConfig {
  static double getProportionateScreenHeight(
      {required BuildContext context, required double inputHeight}) {
    double screenHeight = MediaQuery.of(context).size.height;
    return (inputHeight / 852.0) * screenHeight;
  }

  static double getProportionateScreenWidth(
      {required BuildContext context, required double inputWidth}) {
    double screenWidth = MediaQuery.of(context).size.width;
    return (inputWidth / 390.0) * screenWidth;
  }
}
