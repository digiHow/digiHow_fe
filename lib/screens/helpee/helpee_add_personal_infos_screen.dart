import 'package:digi_how/consts/button_style.dart';
import 'package:digi_how/consts/error_messages.dart';
import 'package:digi_how/screens/helpee/helpee_brand_select_screen.dart';
import 'package:digi_how/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpeeAddPersonalInfosScreen extends StatefulWidget {
  const HelpeeAddPersonalInfosScreen({
    super.key,
  });

  @override
  State<HelpeeAddPersonalInfosScreen> createState() =>
      _HelpeeAddPersonalInfosScreenState();
}

class _HelpeeAddPersonalInfosScreenState
    extends State<HelpeeAddPersonalInfosScreen> {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // String uid = UserViewModel().getCurrentUserUid() ?? '';

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            _bigTexts(),
            _textFields(),
            _nextButton(),
          ],
        ),
      ),
    );
  }

  Widget _bigTexts() {
    return Column(
      children: const [
        Text('시작하기'),
        Text('정보를 기입해 digiHow를 시작해보세요.'),
      ],
    );
  }

  Widget _textFields() {
    return Column(
      children: [
        TextFormField(
          controller: _nameController,
          decoration: const InputDecoration(hintText: '이름'),
        ),
      ],
    );
  }

  Widget _nextButton() {
    return SizedBox(
      child: TextButton(
        onPressed: () async {
          String res = await UserViewModel()
              .createUserDbWithUidAndPutPersonalInfos(
                  name: _nameController.text);
          if (res == SUCCESS) {
            Get.to(const HelpeeBrandSelectScreen());
          } else {
            //TODO: error 원인 위에 띄워주기
          }
        },
        style: MyButtonStyle.nextButtonActivated,
        child: const Text('다음'),
      ),
    );
  }
}
