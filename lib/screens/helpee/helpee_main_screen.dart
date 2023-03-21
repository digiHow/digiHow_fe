import 'package:digi_how/consts/button_style.dart';
import 'package:digi_how/consts/colors.dart';
import 'package:digi_how/consts/text_style.dart';
import 'package:digi_how/screens/helpee/helpee_webrtc_screen.dart';
import 'package:digi_how/view_models/user_view_model.dart';
import 'package:digi_how/widgets/header_logo.dart';
import 'package:digi_how/widgets/my_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpeeMainScreen extends StatefulWidget {
  const HelpeeMainScreen({super.key});

  @override
  State<HelpeeMainScreen> createState() => _HelpeeMainScreenState();
}

class _HelpeeMainScreenState extends State<HelpeeMainScreen> {
  String? username = '';
  @override
  void initState() {
    super.initState();
    UserViewModel()
        .getUserName()
        .then((value) => setState(() => username = value));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.primary,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 56),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderLogo(isWhite: true),
              const SizedBox(
                height: 48,
              ),
              _infoTexts(),
              const SizedBox(
                height: 52,
              ),
              _callButton(),
            ],
          ),
        ),
        bottomNavigationBar:
            const SizedBox(height: 100, child: MyBottomNavigationBar()),
      ),
    );
  }

  Widget _infoTexts() {
    return Column(
      children: [
        const Text(
          '도우미에게\n도움 요청하기',
          style: MyTextStyle.CwS40W700,
        ),
        const SizedBox(
          height: 19,
        ),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(text: username, style: MyTextStyle.CwS20W700),
              const TextSpan(
                text: ' 님의 휴대폰이\n실시간으로 화면 공유됩니다.',
                style: MyTextStyle.CwS20W500,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _callButton() {
    return SizedBox(
      width: 319,
      height: 279,
      child: TextButton(
        style: MyButtonStyle.callButtonWhite,
        onPressed: () {
          Get.to(const HelpeeWebrtcScreen());
        },
        child: const Icon(
          Icons.phone,
          size: 72,
          color: MyColors.primary,
        ),
      ),
    );
  }
}
