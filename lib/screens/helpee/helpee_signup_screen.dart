import 'package:digi_how/consts/button_style.dart';
import 'package:digi_how/consts/colors.dart';
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
  String selectedGender = "";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 39),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              _informationTexts(),
              const SizedBox(
                height: 40,
              ),
              _namePhonePwFormField(),
              const SizedBox(
                height: 30,
              ),
              _genderBtnContainer(),
              const SizedBox(
                height: 30,
              ),
              _dateContainer(),
              const SizedBox(
                height: 50,
              ),
              _nextButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _informationTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          '시작하기',
          style: MyTextStyle.CbS32W700,
        ),
        SizedBox(
          height: 10,
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
        Container(
          child: TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: '이메일',
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
            hintText: '전화번호',
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _phoneController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: '비밀번호 (최소 8문자 이상)',
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  Widget _genderBtn(String gender, bool clicked) {
    int isSignupSuccess = 0;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedGender = gender;
          });
        },
        child: Container(
          height: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromARGB(86, 217, 217, 217),
            borderRadius: BorderRadius.circular(10),
            border:
                clicked ? Border.all(width: 1, color: MyColors.primary) : null,
          ),
          child: Text(
            gender,
            style: clicked ? MyTextStyle.CpS18W500 : MyTextStyle.CgS18W500,
          ),
        ),
      ),
    );
  }

  Widget _genderBtnContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '성별',
          style: MyTextStyle.CbS16W400,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            _genderBtn("여성", selectedGender == "여성"),
            const SizedBox(
              width: 16,
            ),
            _genderBtn("남성", selectedGender == "남성")
          ],
        ),
      ],
    );
  }

  Widget _dateField(String type) {
    int isSignupSuccess = 0;
    return Expanded(child: Container());
  }

  Widget _dateContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '생년월일',
          style: MyTextStyle.CbS16W400,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            _dateField("year"),
            const SizedBox(
              width: 5,
            ),
            _dateField("month"),
            const SizedBox(
              width: 5,
            ),
            _dateField("day"),
          ],
        ),
      ],
    );
  }

  Widget _nextButton() {
    int isSignupSuccess = 0;
    return Row(children: [
      Expanded(
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
          child: const Text(
            '다음',
            style: MyTextStyle.CwS18W500,
          ),
        ),
      ),
    ]);
  }
}
