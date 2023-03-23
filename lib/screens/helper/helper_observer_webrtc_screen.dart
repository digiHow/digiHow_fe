import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digi_how/models/reservation_model.dart';
import 'package:digi_how/screens/helper/helper_main_screen.dart';
import 'package:digi_how/utils/observer_signaling.dart';
import 'package:digi_how/view_models/reservation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';

class HelperObserverWebrtcScreen extends StatefulWidget {
  final String observerRoomId;
  final String helperRoomId;
  const HelperObserverWebrtcScreen(
      {Key? key, required this.observerRoomId, required this.helperRoomId})
      : super(key: key);

  @override
  _HelperObserverWebrtcScreenState createState() =>
      _HelperObserverWebrtcScreenState();
}

class _HelperObserverWebrtcScreenState
    extends State<HelperObserverWebrtcScreen> {
  ObserverSignaling signaling = ObserverSignaling();
  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  TextEditingController textEditingController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();

    _localRenderer.initialize();
    _remoteRenderer.initialize();

    signaling.onAddHelperStream = ((stream) {
      _remoteRenderer.srcObject = stream;
      setState(() {});
    });

    signaling.joinRoom(
      widget.observerRoomId,
      _remoteRenderer,
    );

    addHangUpCheckListener();
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }

  void addHangUpCheckListener() {
    FirebaseFirestore.instance
        .collection('reservations')
        .doc(widget.helperRoomId)
        .snapshots()
        .listen((event) async {
      if (event.exists) {
        ReservationModel reservationModel =
            ReservationModel.fromMap(event, null);
        if (reservationModel.isCallFinished!) {
          Get.to(const HelperMainScreen());
        }
      }
    });
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
          TextButton(
            child: const Text('끊어'),
            onPressed: () {
              ReservationViewModel()
                  .updateReservationWithFinishInfo(widget.helperRoomId);
              signaling.hangUp(_localRenderer);
              Get.to(const HelperMainScreen());
            },
          )
        ],
      ),
    );
  }
}
