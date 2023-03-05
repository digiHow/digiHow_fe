import 'package:digi_how/consts/button_style.dart';
import 'package:digi_how/consts/text_style.dart';
import 'package:flutter/material.dart';

class HelpeeSignUpScreen extends StatefulWidget {
  const HelpeeSignUpScreen({super.key});

  @override
  State<HelpeeSignUpScreen> createState() => _HelpeeSignUpScreenState();
}

class _HelpeeSignUpScreenState extends State<HelpeeSignUpScreen> {
  bool isAllFromFilled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _informationTexts(),
          _namePhonePwFormField(),
        ],
      ),
    );
  }

  Widget _informationTexts() {
    return Column(
      children: const [
        Text(
          '시작하기',
          style: MyTextStyle.CbS32W700,
        ),
        Text(
          '정보를 기입해 digiHow를 시작해보세요.',
          style: MyTextStyle.CbS18W500,
        )
      ],
    );
  }

  Widget _namePhonePwFormField() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: '이름'),
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: '전화번호'),
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: '비밀번호 (최소 8문자 이상)'),
        ),
      ],
    );
  }

  Widget _nextButton() {
    return SizedBox(
      child: TextButton(
        onPressed: () {},
        style: isAllFromFilled
            ? MyButtonStyle.nextButtonActivated
            : MyButtonStyle.nextButtonNotActivated,
        child: const Text('다음'),
      ),
    );
  }
}
