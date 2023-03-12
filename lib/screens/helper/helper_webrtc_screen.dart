import 'package:digi_how/utils/webRTC/signaling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class HelperWebrtcScreen extends StatefulWidget {
  final String roomId;
  const HelperWebrtcScreen({super.key, required this.roomId});

  @override
  State<HelperWebrtcScreen> createState() => _HelperWebrtcScreenState();
}

class _HelperWebrtcScreenState extends State<HelperWebrtcScreen> {
  Signaling signaling = Signaling();

  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _localRenderer.initialize().then(
    //   (value) => _remoteRenderer.initialize().then(
    //     (value) async {
    //       signaling.peerClose();
    //       await Signaling().joinRoom(widget.roomId, _remoteRenderer);
    //     },
    //   ),
    // );
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Signaling().joinRoom(widget.roomId, _remoteRenderer);
            },
            child: const Text('join'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: RTCVideoView(_localRenderer, mirror: true)),
                  Expanded(child: RTCVideoView(_remoteRenderer)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
