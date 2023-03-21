// import 'package:digi_how/utils/webrtc/observer_signaling.dart';
import 'package:digi_how/utils/observer_signaling.dart';
import 'package:digi_how/utils/signaling.dart';
import 'package:digi_how/view_models/reservation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class HelpeeWebrtcScreen extends StatefulWidget {
  const HelpeeWebrtcScreen({Key? key}) : super(key: key);

  @override
  _HelpeeWebrtcScreenState createState() => _HelpeeWebrtcScreenState();
}

class _HelpeeWebrtcScreenState extends State<HelpeeWebrtcScreen> {
  Signaling signaling = Signaling();
  ObserverSignaling observerSignaling = ObserverSignaling();
  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  late String helperRoomId;
  String observerRoomId = '';
  TextEditingController textEditingController = TextEditingController(text: '');

  @override
  void initState() {
    _localRenderer.initialize();
    _remoteRenderer.initialize();

    signaling.onAddHelperStream = ((stream) {
      _remoteRenderer.srcObject = stream;
      setState(() {});
    });

    createRoom();
    super.initState();
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();

    super.dispose();
  }

  void createRoom() async {
    await signaling.openUserMedia(_localRenderer, _remoteRenderer);
    // await observerSignaling.openUserMedia(_localRenderer, _remoteRenderer);
    helperRoomId = await signaling.createRoom();
    observerRoomId = await observerSignaling.createRoom();
    print('[DEBUG] create ROOm');
    String? res = await ReservationViewModel().createReservation(
      '이건 테스트입니다.',
      helperRoomId,
      observerRoomId,
      _localRenderer,
      _remoteRenderer,
    );
    print('[DEBUG] res:$res');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: RTCVideoView(_localRenderer)),
                  // Expanded(child: RTCVideoView(_remoteRenderer)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
