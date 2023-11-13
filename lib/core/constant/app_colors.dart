import 'package:flutter/widgets.dart';

class FoodlieColors {
  static const Color foodliePink = Color(0xffFD654D);
  static const Color foodlieWhite = Color(0xffFFFFFF);
  static const Color foodlieBlack = Color(0xff000000);
  static const Color lightGrey = Color(0xffD9D9D9);
  static const Color textColor = Color(0xff534F4F);
  static const Color grey = Color(0xff676262);
  static const Color green = Color(0xff27790A);
  static const Color textColor2 = Color(0xff575B53);
  static const Color grey1 = Color(0xff979899);
  static const Color primaryColor = Color(0xffFF6B01);
}

class FoodlifyLinearColors {
  static const LinearGradient primayLinear = LinearGradient(
    colors: [
      Color(0xffFD654D),
      Color(0xffF38B2A),
    ],
  );
  static const LinearGradient containerLinear = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffFD654D),
      Color(0xffFD664C),
      Color(0xffFD624A),
      Color(0xffFC6748),
      Color(0xffF38A2B),
      Color(0xffF3BB2A)
    ],
  );
  static const LinearGradient buttonLinear = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffFD654D),
      Color(0xffFD674C),
      Color(0xffFC6748),
      Color(0xffF38A2B),
      Color(0xffF38B2A),
    ],
  );
}
