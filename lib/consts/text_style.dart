import 'package:digi_how/consts/colors.dart';
import 'package:flutter/material.dart';

class MyTextStyle {
  static const TextStyle CbS18W500 = TextStyle(
    //색: 검정, 크기: 18, 두께: 500
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: MyColors.black,
    decoration: TextDecoration.none,
  );

  static const TextStyle CbS32W700 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w700,
    color: MyColors.black,
    decoration: TextDecoration.none,
  );

  static const TextStyle CwS28W700 = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w700,
    color: MyColors.white,
    decoration: TextDecoration.none,
  );

  static const TextStyle CwS18W500 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: MyColors.white,
    decoration: TextDecoration.none,
  );

  static const TextStyle CpS28W700 = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w700,
    color: MyColors.primary,
    decoration: TextDecoration.none,
  );

  static const TextStyle CpS18W500 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: MyColors.primary,
    decoration: TextDecoration.none,
  );
}
