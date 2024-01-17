import 'package:flutter/material.dart';

enum ColorHelper {
  white,
  black,
  monochromaticGray150,
  monochromaticGray500,
  monochromaticGray400,
  monochromaticGray300,
  monochromaticGray200,
  monoDarkGrey,
}

extension ColorExtension on ColorHelper {
  Color get color {
    switch (this) {
      case ColorHelper.white:
        //#FFFFFF
        return const Color.fromRGBO(255, 255, 255, 1);
      case ColorHelper.black:
        //#000000
        return const Color.fromRGBO(0, 0, 0, 1);
      case ColorHelper.monochromaticGray150:
        //#EEEEEE
        return const Color.fromRGBO(238, 238, 238, 1);
      case ColorHelper.monochromaticGray500:
        //#212121
        return const Color.fromRGBO(33, 33, 33, 1);
      case ColorHelper.monochromaticGray400:
        //#616161
        return const Color.fromRGBO(97, 97, 97, 1);
      case ColorHelper.monochromaticGray200:
        //#E0E0E0
        return const Color.fromRGBO(224, 224, 224, 1);
      case ColorHelper.monoDarkGrey:
        //#6E6E6E
        return const Color.fromRGBO(110, 110, 110, 1);
      case ColorHelper.monochromaticGray300:
        return const Color.fromRGBO(158, 158, 158, 1);
      default:
        return Colors.white;
    }
  }
}
