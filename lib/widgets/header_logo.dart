import 'package:digi_how/consts/text_style.dart';
import 'package:flutter/material.dart';

class HeaderLogo extends StatelessWidget {
  final bool isWhite;
  const HeaderLogo({super.key, this.isWhite = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
          child: Text(
        'digiHow',
        style: isWhite ? MyTextStyle.CwS18W500 : MyTextStyle.CbS18W500,
      )),
    );
  }
}
