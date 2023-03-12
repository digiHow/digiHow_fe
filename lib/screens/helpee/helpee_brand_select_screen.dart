import 'package:digi_how/consts/button_style.dart';
import 'package:digi_how/consts/colors.dart';
import 'package:digi_how/consts/text_style.dart';
import 'package:digi_how/view_models/user_view_model.dart';
import 'package:flutter/material.dart';

class HelpeeBrandSelectScreen extends StatefulWidget {
  const HelpeeBrandSelectScreen({super.key});

  @override
  State<HelpeeBrandSelectScreen> createState() =>
      _HelpeeBrandSelectScreenState();
}

class _HelpeeBrandSelectScreenState extends State<HelpeeBrandSelectScreen> {
  String selectedBrand = "";
  final TextEditingController _brandController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 39),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _informationTexts(),
            const SizedBox(
              height: 10,
            ),
            _brandBtnContainer(),
            const SizedBox(
              height: 50,
            ),
            _nextButton(),
          ],
        ),
      ),
    ));
  }

  Widget _brandBtn(String brand, bool clicked) {
    int isSignupSuccess = 0;
    return Expanded(
      child: Opacity(
        opacity: clicked ? 1 : 0.38,
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedBrand = brand;
            });
          },
          child: Container(
            height: 140,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color.fromARGB(86, 217, 217, 217),
              borderRadius: BorderRadius.circular(10),
              border: clicked
                  ? Border.all(width: 1, color: MyColors.primary)
                  : null,
            ),
            child: Text(
              brand,
              style: MyTextStyle.CbS18W500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _brandBtnContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _brandBtn("애플", selectedBrand == "애플"),
            const SizedBox(
              width: 16,
            ),
            _brandBtn("삼성", selectedBrand == "삼성")
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            _brandBtn("샤오미", selectedBrand == "샤오미"),
            const SizedBox(
              width: 16,
            ),
            _brandBtn("오포", selectedBrand == "오포")
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            _brandBtn("비보", selectedBrand == "비보"),
            const SizedBox(
              width: 16,
            ),
            _brandBtn("화웨이", selectedBrand == "화웨이")
          ],
        ),
      ],
    );
  }

  Widget _informationTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          '의 휴대폰',
          style: MyTextStyle.CbS32W700,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '사용하고 있는 휴대폰 브랜드를 선택하세요.',
          style: MyTextStyle.CbS18W500,
        )
      ],
    );
  }

  Widget _brandTextField() {
    //TODO: test를 위해 textfield로 한 것 뿐입니다. 바꿔주세요 select 버튼들로
    return TextFormField(
      controller: _brandController,
      decoration: const InputDecoration(hintText: 'brand'),
    );
  }

  Widget _nextButton() {
    return Row(children: [
      Expanded(
        child: TextButton(
          onPressed: () {
            UserViewModel()
                .updateUserDbWithPhoneBrand(phoneBrand: _brandController.text);
          }, //TODO: spinner 넣어주기
          //TODO: 실패시 실패 원인 밑에다가 적어주기 빨간색으로
          style: selectedBrand != ""
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
