import 'package:digi_how/consts/text_style.dart';
import 'package:digi_how/utils/webRTC/signaling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class HelpeeWebrtcScreen extends StatefulWidget {
  const HelpeeWebrtcScreen({super.key});

  @override
  State<HelpeeWebrtcScreen> createState() => _HelpeeWebrtcScreenState();
}

class _HelpeeWebrtcScreenState extends State<HelpeeWebrtcScreen> {
  Signaling signaling = Signaling();

  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  String? roomId;
  TextEditingController textEditingController = TextEditingController();
  String? response = '';

  @override
  void initState() {
    super.initState();
    _localRenderer.initialize();
    _remoteRenderer.initialize();
    signaling.onAddRemoteStream = ((stream) {
      _remoteRenderer.srcObject = stream;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // response = await ReservationViewModel().createReservation(
                  //   '이건 테스트입니다.',
                  //    signaling,
                  //   localRenderer: _localRenderer,
                  //   remoteRenderer: _remoteRenderer,
                  // );
                  // setState(() {});
                },
                child: const Text("create reservation"),
              ),
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  signaling.hangUp(_localRenderer);
                },
                child: const Text("Hangup"),
              )
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: RTCVideoView(_localRenderer, mirror: true)),
                  // Expanded(child: RTCVideoView(_remoteRenderer)),
                ],
              ),
            ),
          ),
          Text(
            response!,
            style: MyTextStyle.CwS20W500,
          ),
        ],
      ),
    );
  }
}
