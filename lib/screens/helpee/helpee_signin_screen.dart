import 'package:digi_how/consts/button_style.dart';
import 'package:digi_how/consts/colors.dart';
import 'package:digi_how/consts/error_messages.dart';
import 'package:digi_how/consts/text_style.dart';
import 'package:digi_how/screens/helpee/helpee_brand_select_screen.dart';
import 'package:digi_how/screens/helpee/helpee_main_screen.dart';
import 'package:digi_how/screens/helpee/helpee_signup_screen.dart';
import 'package:digi_how/screens/helper/helper_main_screen.dart';
import 'package:digi_how/view_models/user_view_model.dart';
import 'package:digi_how/widgets/circular_indicator.dart';
import 'package:digi_how/widgets/header_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpeeSignInScreen extends StatefulWidget {
  const HelpeeSignInScreen({super.key});

  @override
  State<HelpeeSignInScreen> createState() => _HelpeeSignInScreenState();
}

class _HelpeeSignInScreenState extends State<HelpeeSignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isTextFieldsFilled = false;
  bool isLoginOnProcess = false;
  String loginErrorString = SUCCESS;
  @override
  void initState() {
    super.initState();

    _emailController.addListener(_checkIfFieldsFilled);
    _passwordController.addListener(_checkIfFieldsFilled);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _checkIfFieldsFilled() {
    if (_emailController.text != '' && _passwordController.text != '') {
      setState(() {
        isTextFieldsFilled = true;
      });
    } else {
      setState(() {
        isTextFieldsFilled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 41,
            vertical: 14,
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const HeaderLogo(),
              const SizedBox(
                height: 44,
              ),
              _informationTexts(),
              const SizedBox(
                height: 134,
              ),
              _textFormFields(),
              loginErrorString == SUCCESS
                  ? const SizedBox.shrink()
                  : _errorMessageText(loginErrorString),
              const SizedBox(
                height: 80,
              ),
              _loginAndSignUpButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _informationTexts() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '로그인하기',
            style: MyTextStyle.CbS32W700,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'digiHow에 로그인하세요.',
            style: MyTextStyle.CbS18W500,
          )
        ],
      ),
    );
  }

  Widget _textFormFields() {
    return Column(
      children: [
        SizedBox(
          width: 352,
          height: 48,
          child: TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(hintText: '이메일'),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: 352,
          height: 48,
          child: TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(hintText: '비밀번호'),
          ),
        )
      ],
    );
  }

  Widget _errorMessageText(loginErrorString) {
    return Text(
      loginErrorString,
      style: MyTextStyle.CrS16W500,
    );
  }

  Widget _loginAndSignUpButtons() {
    return Column(
      children: [
        SizedBox(
          width: 352,
          height: 48,
          child: TextButton(
            onPressed: () async {
              if (isTextFieldsFilled) {
                setState(() {
                  isLoginOnProcess = true;
                });
                String response =
                    await UserViewModel().signInWithEmailAndPassword(
                  userEmail: _emailController.text,
                  userPassword: _passwordController.text,
                );
                if (response == SUCCESS) {
                  String? phoneBrand = await UserViewModel().getUserBrandInfo();
                  bool isHelpee = await UserViewModel().getIsUserHelpee();
                  print('[DEBUG] phoneBRand: $phoneBrand');
                  if (phoneBrand == null) {
                    Get.to(const HelpeeBrandSelectScreen());
                  } else {
                    Get.to(isHelpee
                        ? const HelpeeMainScreen()
                        : const HelperMainScreen());
                  }
                } else {
                  setState(() {
                    loginErrorString = response;
                  });
                }
                setState(() {
                  isLoginOnProcess = false;
                });
              }
            },
            style: isTextFieldsFilled
                ? MyButtonStyle.nextButtonActivated
                : MyButtonStyle.nextButtonNotActivated,
            child: isLoginOnProcess
                ? const CircularIndicator(size: 22, color: MyColors.white)
                : const Text(
                    '로그인',
                    style: MyTextStyle.CwS18W500,
                  ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: 352,
          height: 48,
          child: TextButton(
              onPressed: () {
                Get.to(const HelpeeSignUpScreen());
              },
              style: MyButtonStyle.nextButtonActivated,
              child: const Text(
                '회원가입',
                style: MyTextStyle.CwS18W500,
              )),
        ),
      ],
    );
  }
}
