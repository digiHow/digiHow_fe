import 'package:flutter/material.dart';

class MatchingLoad extends StatefulWidget {
  const MatchingLoad({super.key});

  @override
  State<MatchingLoad> createState() => _MatchingLoadState();
}

class _MatchingLoadState extends State<MatchingLoad> {
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
        ),
      ),
    );
  }
}
