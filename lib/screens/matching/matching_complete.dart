import 'package:flutter/material.dart';

class MatchingComplete extends StatefulWidget {
  const MatchingComplete({super.key});

  @override
  State<MatchingComplete> createState() => _MatchingCompleteState();
}

class _MatchingCompleteState extends State<MatchingComplete> {
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
              "박유주님과 매칭되었습니다.",
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
              onTap: () {},
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
        ),
      ),
    );
  }
}
