import 'package:digi_how/screens/matching/matching_load.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchingVoice extends StatefulWidget {
  const MatchingVoice({super.key});

  @override
  State<MatchingVoice> createState() => _MatchingVoiceState();
}

class _MatchingVoiceState extends State<MatchingVoice> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Transform.translate(
                offset: const Offset(-15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "어떤 점이",
                      style: TextStyle(
                        color: Color(0xFF0047FF),
                        fontWeight: FontWeight.w700,
                        fontSize: 40 * 0.9,
                      ),
                    ),
                    Text(
                      "불편하신가요?",
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
                      "음성으로 어려운 점을 말씀해주세요.",
                      style: TextStyle(
                        color: Color(0xFF0047FF),
                        fontWeight: FontWeight.w400,
                        fontSize: 19 * 0.9,
                      ),
                    ),
                    Text(
                      "적합한 도우미 매칭을 해드려요.",
                      style: TextStyle(
                        color: Color(0xFF0047FF),
                        fontWeight: FontWeight.w400,
                        fontSize: 19 * 0.9,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 290 * 0.9,
                  height: 290 * 0.9,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0047FF).withOpacity(0.04),
                    borderRadius: BorderRadius.circular(290),
                  ),
                ),
                Container(
                  width: 214 * 0.9,
                  height: 214 * 0.9,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0047FF).withOpacity(0.09),
                    borderRadius: BorderRadius.circular(214),
                  ),
                ),
                Container(
                  width: 142 * 0.9,
                  height: 142 * 0.9,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0047FF),
                    borderRadius: BorderRadius.circular(142),
                  ),
                ),
                SizedBox(
                  height: 61 * 0.9,
                  child: Image.asset("assets/images/mic.png"),
                ),
              ],
            ),
            const Spacer(),
            Text(
              "듣는 중",
              style: TextStyle(
                color: const Color(0xFF0047FF).withOpacity(0.39),
                fontSize: 23 * 0.9,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(const MatchingLoad());
              },
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF0047FF),
                  ),
                  child: const Text(
                    "건너뛰기",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
