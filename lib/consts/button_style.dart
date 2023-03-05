import 'package:digi_how/consts/colors.dart';
import 'package:flutter/material.dart';

class MyButtonStyle {
  static ButtonStyle bigButtonPrimary = ButtonStyle(
    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
    backgroundColor: const MaterialStatePropertyAll(MyColors.primary),
  );

  static ButtonStyle bigButtonSkyBlue = ButtonStyle(
    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
    backgroundColor: const MaterialStatePropertyAll(MyColors.skyBlue),
  );

  static ButtonStyle nextButtonNotActivated = ButtonStyle(
    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    backgroundColor: const MaterialStatePropertyAll(MyColors.notActivated),
  );

  static ButtonStyle nextButtonActivated = ButtonStyle(
    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    backgroundColor: const MaterialStatePropertyAll(MyColors.primary),
  );
}
