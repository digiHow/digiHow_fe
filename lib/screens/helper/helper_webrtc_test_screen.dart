import 'package:digi_how/utils/webrtc/signaling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class HelperWebrtcTestScreen extends StatefulWidget {
  final String roomId;
  const HelperWebrtcTestScreen({Key? key, required this.roomId})
      : super(key: key);

  @override
  _HelperWebrtcTestScreenState createState() => _HelperWebrtcTestScreenState();
}

class _HelperWebrtcTestScreenState extends State<HelperWebrtcTestScreen> {
  Signaling signaling = Signaling();
  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  late String roomId;
  TextEditingController textEditingController = TextEditingController(text: '');

  @override
  void initState() {
    _localRenderer.initialize();
    _remoteRenderer.initialize();

    signaling.onAddRemoteStream = ((stream) {
      _remoteRenderer.srcObject = stream;
      setState(() {});
    });

    signaling.joinRoom(
      widget.roomId,
      _remoteRenderer,
    );

    super.initState();
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // const SizedBox(height: 8),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          // ElevatedButton(
          //   onPressed: () {
          //     signaling.openUserMedia(_localRenderer, _remoteRenderer);
          //   },
          //   child: const Text("Open camera & microphone"),
          // ),
          // const SizedBox(
          //   width: 8,
          // ),
          // ElevatedButton(
          //   onPressed: () async {
          //     roomId = await signaling.createRoom(_remoteRenderer);
          //     await ReservationViewModel().createReservation(
          //       '이건 테스트입니다.',
          //       roomId,
          //       _localRenderer,
          //       _remoteRenderer,
          //     );
          //     textEditingController.text = roomId;
          //     setState(() {});
          //   },
          //   child: const Text("Create room"),
          // ),
          // const SizedBox(
          //   width: 8,
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     // Add roomId
          //     signaling.joinRoom(
          //       widget.roomId,
          //       _remoteRenderer,
          //     );
          //   },
          //   child: const Text("Join room"),
          // ),
          // const SizedBox(
          //   width: 8,
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     signaling.hangUp(_localRenderer);
          //   },
          //   child: const Text("Hangup"),
          // )
          //   ],
          // ),
          // const SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Expanded(child: RTCVideoView(_localRenderer, mirror: true)),
                  Expanded(child: RTCVideoView(_remoteRenderer)),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       const Text("Join the following Room: "),
          //       Flexible(
          //         child: TextFormField(
          //           controller: textEditingController,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 8)
        ],
      ),
    );
  }
}
