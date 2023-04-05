import 'package:digi_how/consts/colors.dart';
import 'package:digi_how/consts/error_messages.dart';
import 'package:digi_how/consts/text_style.dart';
import 'package:digi_how/screens/helpee/helpee_brand_select_screen.dart';
import 'package:digi_how/screens/helpee/helpee_main_screen.dart';
import 'package:digi_how/screens/helper/helper_main_screen.dart';
import 'package:digi_how/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimplePasswordInputScreen extends StatefulWidget {
  const SimplePasswordInputScreen({super.key});

  @override
  State<SimplePasswordInputScreen> createState() =>
      _SimplePasswordInputScreenState();
}

class _SimplePasswordInputScreenState extends State<SimplePasswordInputScreen> {
  final List<num> numberList = [10, 10, 10, 10, 10, 10];
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            _texts(),
            const SizedBox(
              height: 90,
            ),
            _checkCircles(),
            _numberInputPad()
          ],
        ),
      ),
    );
  }

  Widget _texts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          '간편비밀번호',
          style: MyTextStyle.CbS24W700,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          '비밀번호를 입력해주세요.',
          style: TextStyle(
            color: Color(0xffA8A8A8),
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget _checkCircles() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 12,
        ),
        for (var i = 0; i < 6; i++) _circle(numberList[i] != 10)
      ],
    );
  }

  Widget _circle(bool isFilled) {
    return Container(
      width: 16,
      height: 16,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: isFilled ? MyColors.primary : const Color(0xffE8E8E8),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _numberInputPad() {
    return Container(
      padding: const EdgeInsets.all(50),
      height: 500,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _numberTextButton(1),
              _numberTextButton(2),
              _numberTextButton(3)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _numberTextButton(4),
              _numberTextButton(5),
              _numberTextButton(6)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _numberTextButton(7),
              _numberTextButton(8),
              _numberTextButton(9)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 60,
              ),
              _numberTextButton(0),
              SizedBox(
                width: 60,
                child: TextButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.arrow_back,
                    color: MyColors.black,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _numberTextButton(num i) {
    return TextButton(
      onPressed: () async {
        numberList[count] = 1;
        count++;
        if (count == 6) {
          String response = await UserViewModel().signInWithEmailAndPassword(
            userEmail: 'aaa@aaa.aaa',
            userPassword: 'aaaaaa',
          );
          if (response == SUCCESS) {
            String? phoneBrand = await UserViewModel().getUserBrandInfo();
            bool isHelpee = await UserViewModel().getIsUserHelpee();
            if (phoneBrand == null) {
              Get.to(const HelpeeBrandSelectScreen());
            } else {
              Get.to(isHelpee
                  ? const HelpeeMainScreen()
                  : const HelperMainScreen());
            }
          }
        }
        setState(() {});
      },
      child: Text(
        i.toString(),
        style: const TextStyle(
            fontWeight: FontWeight.w300, fontSize: 32, color: MyColors.black),
      ),
    );
  }
}
