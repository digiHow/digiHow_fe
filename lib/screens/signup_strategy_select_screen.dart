import 'package:digi_how/consts/button_style.dart';
import 'package:digi_how/consts/colors.dart';
import 'package:digi_how/consts/text_style.dart';
import 'package:digi_how/screens/helpee/helpee_signin_screen.dart';
import 'package:digi_how/screens/phone_signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpStrategySelectScreen extends StatelessWidget {
  const SignUpStrategySelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(height: 60),
          _bigText(),
          const SizedBox(
            height: 58,
          ),
          _loginButtons()
        ],
      ),
    );
  }

  Widget _bigText() {
    return Container(
      width: 330,
      height: 50,
      alignment: Alignment.centerLeft,
      child: const Text(
        '로그인',
        style: MyTextStyle.CbS32W700,
      ),
    );
  }

  Widget _loginButtons() {
    return Column(
      children: [
        SizedBox(
          width: 330,
          height: 50,
          child: TextButton(
            onPressed: () {
              Get.to(const HelpeeSignInScreen());
            },
            style: MyButtonStyle.emailLoginButton,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  Icons.email,
                  color: Color.fromARGB(255, 92, 107, 145),
                ),
                Text(
                  '이메일로 로그인',
                  style: MyTextStyle.CpS15W500,
                ),
                SizedBox(width: 24)
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: 330,
          height: 50,
          child: TextButton(
            onPressed: () {
              Get.to(const PhoneSignInScreen());
            },
            style: MyButtonStyle.phoneLoginButton,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  Icons.phone,
                  color: MyColors.white,
                ),
                Text(
                  '전화번호로 로그인',
                  style: MyTextStyle.CwS15W500,
                ),
                SizedBox(
                  width: 24,
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.info_outline,
              color: MyColors.primary,
              // size: 12.0,
            ),
            Text(
              ' 전화번호 회원가입을 하면 보안이 약화됩니다.',
              style: MyTextStyle.CpS12W500,
            )
          ],
        )
      ],
    );
  }
}

//TODO:추상화 수준 맞추기