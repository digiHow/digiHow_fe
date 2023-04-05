import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digi_how/consts/text_style.dart';
import 'package:digi_how/screens/helpee/helpee_alert_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchingLoad extends StatefulWidget {
  const MatchingLoad({super.key});

  @override
  State<MatchingLoad> createState() => _MatchingLoadState();
}

class _MatchingLoadState extends State<MatchingLoad> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: AppBar(), body: _mathingStreambuilder()),
    );
  }

  Widget _mathingLoadingScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 56,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "매칭 중...",
                style: TextStyle(
                  color: Color(0xFF0047FF),
                  fontWeight: FontWeight.w700,
                  fontSize: 40 * 0.9,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "조금만 기다려주세요.",
                style: TextStyle(
                  color: Color(0xFF0047FF),
                  fontWeight: FontWeight.w300,
                  fontSize: 19 * 0.9,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _mathingCompletedScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "매칭 완료!",
                style: TextStyle(
                  color: Color(0xFF0047FF),
                  fontWeight: FontWeight.w700,
                  fontSize: 40 * 0.9,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 48,
        ),
        SizedBox(
          height: 69 * 0.9,
          child: Image.asset("assets/images/effect.png"),
        ),
        SizedBox(
          height: 199 * 0.9,
          child: Image.asset("assets/images/3d_avatar_24.png"),
        ),
        const Spacer(),
        const Text(
          '박유주님과 매칭되었습니다.',
          style: TextStyle(
            color: Color(0xFF0047FF),
            fontSize: 20 * 0.9,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Text(
          "연결하시겠습니까?",
          style: TextStyle(
            color: Color(0xFF0047FF),
            fontSize: 20 * 0.9,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 46,
        ),
        GestureDetector(
          onTap: () {
            Get.to(HelpeeAlertScreen());
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: 92,
              right: 92,
              bottom: 100,
            ),
            child: Container(
              alignment: Alignment.center,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF0047FF),
              ),
              child: const Text(
                "연결하기",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40 * 0.9,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  StreamBuilder _mathingStreambuilder() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('reservations').snapshots(),
      builder: (context, snapshot) {
        // DocumentSnapshot data = snapshot.data.docs[index];
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _mathingLoadingScreen();
        } else if (snapshot.hasError) {
          return const Text(
            '에러가 발생했습니다.',
            style: MyTextStyle.CwS18W500,
          );
        } else {
          return _mathingCompletedScreen();
        }
      },
    );
  }
}
