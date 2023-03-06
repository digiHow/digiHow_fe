import 'package:digi_how/view_models/user_view_model.dart';
import 'package:flutter/material.dart';

class HelpeeBrandSelectScreen extends StatefulWidget {
  const HelpeeBrandSelectScreen({super.key});

  @override
  State<HelpeeBrandSelectScreen> createState() =>
      _HelpeeBrandSelectScreenState();
}

class _HelpeeBrandSelectScreenState extends State<HelpeeBrandSelectScreen> {
  final TextEditingController _brandController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('brand select screen'),
          _brandTextField(),
          _nextButton(),
        ],
      ),
    ));
  }

  Widget _brandTextField() {
    //TODO: test를 위해 textfield로 한 것 뿐입니다. 바꿔주세요 select 버튼들로
    return TextFormField(
      controller: _brandController,
      decoration: const InputDecoration(hintText: 'brand'),
    );
  }

  Widget _nextButton() {
    return TextButton(
        onPressed: () {
          UserViewModel()
              .updateUserDbWithPhoneBrand(phoneBrand: _brandController.text);
        },
        child: const Text('다음'));
  }
}
