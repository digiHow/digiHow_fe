import 'package:digi_how/utils/signaling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class HelperObserverWebrtcScreen extends StatefulWidget {
  final String roomId;
  const HelperObserverWebrtcScreen({Key? key, required this.roomId})
      : super(key: key);

  @override
  _HelperObserverWebrtcScreenState createState() =>
      _HelperObserverWebrtcScreenState();
}

class _HelperObserverWebrtcScreenState
    extends State<HelperObserverWebrtcScreen> {
  Signaling signaling = Signaling();
  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  late String roomId;

  @override
  void initState() {
    _localRenderer.initialize();
    _remoteRenderer.initialize();

    signaling.onAddHelperStream = ((stream) {
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
        ],
      ),
    );
  }
}
