import 'package:digi_how/consts/button_style.dart';
import 'package:digi_how/consts/colors.dart';
import 'package:digi_how/consts/text_style.dart';
import 'package:digi_how/screens/helpee/helpee_webrtc_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpeeAlertScreen extends StatelessWidget {
  HelpeeAlertScreen({Key? key}) : super(key: key);
  List<String> bigTexts = [
    '비밀번호를 노출하지 마세요.',
    '은행 업무를 공유하지 마세요.',
    '질문과 관계없는 답변은 대응하지 마세요.'
  ];
  List<String> smallTexts = [
    '비밀번호를 입력할 때에는 화면공유를 일시중지하세요.',
    '은행 개인정보 노출은 심각한 범죄의 대상이 될 수 있습니다.',
    '보이스피싱의 위험성이 있습니다.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
      ),
      body: Container(
        color: MyColors.primary,
        padding: const EdgeInsets.all(43),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _bigText(),
            const SizedBox(
              height: 36,
            ),
            for (var i = 0; i < bigTexts.length; i++)
              _smallTexts(bigTexts[i], smallTexts[i]),
            const SizedBox(
              height: 40,
            ),
            _confirmButton(),
          ],
        ),
      ),
    );
  }

  Widget _bigText() {
    return const Text(
      '잠깐!',
      style: MyTextStyle.CwS40W700,
    );
  }

  Widget _smallTexts(String bigText, String smallText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.info_outline,
          color: MyColors.white,
        ),
        Text(
          bigText,
          style: MyTextStyle.CwS20W500,
        ),
        Text(
          smallText,
          style: MyTextStyle.CwS15W500,
        ),
        const SizedBox(
          height: 36,
        ),
      ],
    );
  }

  Widget _confirmButton() {
    return SizedBox(
      width: 352,
      height: 48,
      child: TextButton(
          style: MyButtonStyle.nextButtonWhite,
          onPressed: () {
            Get.to(const HelpeeWebrtcScreen());
          },
          child: const Text(
            '확인',
            style: MyTextStyle.CpS18W500,
          )),
    );
  }
}
