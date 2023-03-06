import 'package:digi_how/consts/button_style.dart';
import 'package:digi_how/consts/error_messages.dart';
import 'package:digi_how/consts/text_style.dart';
import 'package:digi_how/screens/helpee/helpee_add_personal_infos_screen.dart';
import 'package:digi_how/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpeeSignUpScreen extends StatefulWidget {
  const HelpeeSignUpScreen({super.key});

  @override
  State<HelpeeSignUpScreen> createState() => _HelpeeSignUpScreenState();
}

class _HelpeeSignUpScreenState extends State<HelpeeSignUpScreen> {
  bool isAllFromFilled = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const Text('helpee signup screen 입니다.'),
            _informationTexts(),
            _namePhonePwFormField(),
            _nextButton(),
          ],
        ),
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
          controller: _emailController,
          decoration: const InputDecoration(hintText: '이메일'),
        ),
        TextFormField(
          controller: _passwordController,
          decoration: const InputDecoration(hintText: '비밀번호 (최소 8문자 이상)'),
        ),
      ],
    );
  }

  Widget _nextButton() {
    int isSignupSuccess = 0;
    return SizedBox(
      child: TextButton(
        onPressed: () {
          //TODO: activated 되지 않았다면 입력 안되게 하기
          UserViewModel()
              .signUpWithEmailAndPassword(
                userEmail: _emailController.text,
                userPassword: _passwordController.text,
              )
              .then(
                //TODO: 이메일이 이미 존재한다면 helpee add personal infos screen으로 이동해야함
                (value) => {
                  if (value == SUCCESS)
                    Get.to(const HelpeeAddPersonalInfosScreen())
                  else
                    {print('[DEBUG]$value')}
                },
              );
        }, //TODO: spinner 넣어주기
        //TODO: 실패시 실패 원인 밑에다가 적어주기 빨간색으로
        style: isAllFromFilled
            ? MyButtonStyle.nextButtonActivated
            : MyButtonStyle.nextButtonNotActivated,
        child: const Text('다음'),
      ),
    );
  }
}
