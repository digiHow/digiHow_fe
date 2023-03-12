import 'package:digi_how/consts/button_style.dart';
import 'package:digi_how/consts/text_style.dart';
import 'package:digi_how/screens/helpee/helpee_signup_screen.dart';
import 'package:digi_how/screens/helper/helper_signup_screen.dart';
import 'package:digi_how/widgets/header_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelperHelpeeSelectScreen extends StatelessWidget {
  const HelperHelpeeSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const HeaderLogo(),
        _headerTexts(),
        _bigButtons(),
      ],
    );
  }

  Widget _headerTexts() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 48),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '휴대폰이 어렵다면,\n직접 물어보세요',
            style: MyTextStyle.CbS32W700,
          ),
          SizedBox(
            height: 18,
          ),
          Text('digiHow가 당신의 손이 되어줄게요.', style: MyTextStyle.CbS18W500)
        ],
      ),
    );
  }

  Widget _bigButtons() {
    return Column(
      children: [
        _helpeeBigButton(),
        _helperBigButton(),
      ],
    );
  }

  Widget _helpeeBigButton() {
    return Container(
      width: 400,
      height: 248,
      margin: const EdgeInsets.all(15),
      child: TextButton(
        style: MyButtonStyle.bigButtonPrimary,
        onPressed: () {
          Get.to(const HelpeeSignUpScreen());
          //  Get.to(const HelpeeBrandSelectScreen());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('도움이 필요해요', style: MyTextStyle.CwS28W700),
            Text('도우미에게 전화하기', style: MyTextStyle.CwS18W500)
          ],
        ),
      ),
    );
  }

  Widget _helperBigButton() {
    return Container(
      width: 400,
      height: 248,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: TextButton(
        style: MyButtonStyle.bigButtonSkyBlue,
        onPressed: () {
          Get.to(const HelperSignUpScreen());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('도움을 주고 싶어요', style: MyTextStyle.CpS28W700),
            Text('자원봉사자로 참여하기', style: MyTextStyle.CpS18W500)
          ],
        ),
      ),
    );
  }
}
