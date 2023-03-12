import 'package:digi_how/consts/button_style.dart';
import 'package:digi_how/consts/colors.dart';
import 'package:digi_how/consts/error_messages.dart';
import 'package:digi_how/consts/text_style.dart';
import 'package:digi_how/screens/helpee/helpee_brand_select_screen.dart';
import 'package:digi_how/view_models/user_view_model.dart';
import 'package:digi_how/widgets/circular_indicator.dart';
import 'package:digi_how/widgets/header_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelperSignUpScreen extends StatefulWidget {
  const HelperSignUpScreen({super.key});

  @override
  State<HelperSignUpScreen> createState() => _HelperSignUpScreenState();
}

class _HelperSignUpScreenState extends State<HelperSignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool isTextFieldsFilled = false;
  bool isSignUpOnProcess = false;
  String signUpErrorString = SUCCESS;
  @override
  void initState() {
    super.initState();

    _emailController.addListener(_checkIfFieldsFilled);
    _passwordController.addListener(_checkIfFieldsFilled);
    _nameController.addListener(_checkIfFieldsFilled);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _checkIfFieldsFilled() {
    if (_emailController.text != '' &&
        _passwordController.text != '' &&
        _nameController.text != '') {
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
          child: Column(
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
              signUpErrorString == SUCCESS
                  ? const SizedBox.shrink()
                  : _errorMessageText(signUpErrorString),
              const SizedBox(
                height: 80,
              ),
              _signUpButton(),
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
            '회원가입하기',
            style: MyTextStyle.CbS32W700,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'digiHow에 회원가입하세요.',
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
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: 352,
          height: 48,
          child: TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: '이름'),
          ),
        )
      ],
    );
  }

  Widget _errorMessageText(signUpErrorString) {
    return Text(
      signUpErrorString,
      style: MyTextStyle.CrS16W500,
    );
  }

  Widget _signUpButton() {
    return SizedBox(
      width: 352,
      height: 48,
      child: TextButton(
        onPressed: () async {
          if (isTextFieldsFilled) {
            setState(() {
              isSignUpOnProcess = true;
            });
            String response = await UserViewModel().signUpWithEmailAndPassword(
              userEmail: _emailController.text,
              userPassword: _passwordController.text,
            );
            if (response == SUCCESS) {
              await UserViewModel().createUserDbWithUidAndPutPersonalInfos(
                  name: _nameController.text, isHelpee: false);
              Get.to(const HelpeeBrandSelectScreen());
            } else {
              setState(() {
                signUpErrorString = response;
              });
            }
            setState(() {
              isSignUpOnProcess = false;
            });
          }
        },
        style: isTextFieldsFilled
            ? MyButtonStyle.nextButtonActivated
            : MyButtonStyle.nextButtonNotActivated,
        child: isSignUpOnProcess
            ? const CircularIndicator(size: 22, color: MyColors.white)
            : const Text(
                '회원가입',
                style: MyTextStyle.CwS18W500,
              ),
      ),
    );
  }
}
