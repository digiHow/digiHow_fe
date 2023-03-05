import 'package:flutter/material.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: Image.asset('assets/images/header_logo.png'),
      ),
    );
  }
}
