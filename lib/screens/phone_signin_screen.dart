import 'package:digi_how/consts/button_style.dart';
import 'package:digi_how/consts/colors.dart';
import 'package:digi_how/consts/text_style.dart';
import 'package:digi_how/screens/simple_password_input_screen.dart';
import 'package:digi_how/widgets/circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneSignInScreen extends StatefulWidget {
  const PhoneSignInScreen({super.key});

  @override
  State<PhoneSignInScreen> createState() => _PhoneSignInScreenState();
}

class _PhoneSignInScreenState extends State<PhoneSignInScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  bool isLoginOnProcess = false;
  bool isTextFieldsFilled = false;

  @override
  void initState() {
    super.initState();
    _phoneNumberController.addListener(_checkIfFieldsFilled);
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _checkIfFieldsFilled() {
    if (_phoneNumberController.text != '') {
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
        body: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '😅Sorry, We are updating this feature right now',
                style: MyTextStyle.CbS32W700,
              ),
              const SizedBox(
                height: 26,
              ),
              // TextFormField(
              //   controller: _phoneNumberController,
              //   decoration: const InputDecoration(hintText: '전화번호'),
              // ),
              // const Spacer(),
              // _nextButton(),
              _previousButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _previousButton() {
    return TextButton(
      onPressed: () async {
        // Get.to(const());
        Navigator.pop(context);
      },
      style: MyButtonStyle.nextButtonActivated,
      child: Center(
        child: isLoginOnProcess
            ? const CircularIndicator(size: 22, color: MyColors.white)
            : const Text(
                'Back to Previous Page',
                style: MyTextStyle.CwS18W500,
              ),
      ),
    );
  }

  Widget _nextButton() {
    return Row(children: [
      Expanded(
        child: TextButton(
          onPressed: () async {
            Get.to(const SimplePasswordInputScreen());
            // setState(() {
            //   isLoginOnProcess = true;
            // });
            // String response = await UserViewModel().signInWithEmailAndPassword(
            //   userEmail: 'aaa@aaa.aaa',
            //   userPassword: 'aaaaaa',
            // );
            // if (response == SUCCESS) {
            //   String? phoneBrand = await UserViewModel().getUserBrandInfo();
            //   bool isHelpee = await UserViewModel().getIsUserHelpee();
            //   if (phoneBrand == null) {
            //     Get.to(const HelpeeBrandSelectScreen());
            //   } else {
            //     Get.to(isHelpee
            //         ? const HelpeeMainScreen()
            //         : const HelperMainScreen());
            //   }
            // }
            // setState(() {
            //   isLoginOnProcess = false;
            // });
          },
          style: isTextFieldsFilled
              ? MyButtonStyle.nextButtonActivated
              : MyButtonStyle.nextButtonNotActivated,
          child: isLoginOnProcess
              ? const CircularIndicator(size: 22, color: MyColors.white)
              : const Text(
                  '다음',
                  style: MyTextStyle.CwS18W500,
                ),
        ),
      ),
    ]);
  }
}
