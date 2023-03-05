import 'package:digi_how/consts/colors.dart';
import 'package:flutter/material.dart';

class MyInputDecorationTheme {
  static InputDecorationTheme greyTextField = InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: InputBorder.none,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    filled: true,
    fillColor: MyColors.grey,
  );
}
