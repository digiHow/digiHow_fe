import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digi_how/consts/colors.dart';
import 'package:digi_how/models/reservation_model.dart';
import 'package:digi_how/screens/helper/helper_main_screen.dart';
import 'package:digi_how/utils/signaling.dart';
import 'package:digi_how/view_models/reservation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';

class HelperWebrtcScreen extends StatefulWidget {
  final String roomId;
  const HelperWebrtcScreen({Key? key, required this.roomId}) : super(key: key);

  @override
  _HelperWebrtcScreenState createState() => _HelperWebrtcScreenState();
}

class _HelperWebrtcScreenState extends State<HelperWebrtcScreen> {
  Signaling signaling = Signaling();
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
      widget.roomId,
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
    print('hi im in addHangup helper');
    print('helperRoomId:${widget.roomId}');
    FirebaseFirestore.instance
        .collection('reservations')
        .doc(widget.roomId)
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
      body: Container(
        color: MyColors.black,
        child: Column(
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
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: MyColors.red,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Icon(
                  Icons.call,
                  color: MyColors.white,
                ),
              ),
              onPressed: () {
                ReservationViewModel()
                    .updateReservationWithFinishInfo(widget.roomId);
                signaling.hangUp(_localRenderer);
                Get.to(const HelperMainScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
