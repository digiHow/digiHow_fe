import 'package:digi_how/consts/button_style.dart';
import 'package:digi_how/consts/text_style.dart';
import 'package:digi_how/screens/helpee/helpee_signup_screen.dart';
import 'package:digi_how/screens/helper/helper_signup_screen.dart';
import 'package:digi_how/screens/signup_strategy_select_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInSignUpSelectScreen extends StatelessWidget {
  final bool isHelpee;
  const SignInSignUpSelectScreen({super.key, required this.isHelpee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 80,
          ),
          _topTextButton(),
          const SizedBox(
            height: 16,
          ),
          _bottomTextButton()
        ]),
      ),
    );
  }

  Widget _topTextButton() {
    return SizedBox(
      width: 400,
      height: 248,
      child: TextButton(
        onPressed: () {
          Get.to(
            isHelpee ? const HelpeeSignUpScreen() : const HelperSignUpScreen(),
          );
        },
        style: MyButtonStyle.bigButtonPrimary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('digiHow가 처음이세요?', style: MyTextStyle.CwS18W500),
            Text('회원가입하기', style: MyTextStyle.CwS28W700)
          ],
        ),
      ),
    );
  }

  Widget _bottomTextButton() {
    return SizedBox(
      width: 400,
      height: 248,
      child: TextButton(
        onPressed: () {
          Get.to(const SignUpStrategySelectScreen());
        },
        style: MyButtonStyle.bigButtonSkyBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('이미 계정이 있으신가요?', style: MyTextStyle.CpS18W500),
            Text('로그인하기', style: MyTextStyle.CpS28W700)
          ],
        ),
      ),
    );
  }
}
