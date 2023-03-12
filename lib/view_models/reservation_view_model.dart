import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digi_how/consts/error_messages.dart';
import 'package:digi_how/models/reservation_model.dart';
import 'package:digi_how/models/user_public_model.dart';
import 'package:digi_how/view_models/user_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class ReservationViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference reservations =
      FirebaseFirestore.instance.collection('reservations');

  Future<String?> createReservation(
    String callIntroduction,
    String roomId,
    RTCVideoRenderer localRenderer,
    RTCVideoRenderer remoteRenderer,
  ) async {
    String res = ERROR;
    String currentUserUid = _auth.currentUser!.uid;

    UserPublicModel? userPublicModel =
        await UserViewModel().getUserPublicModel(currentUserUid);

    // await signaling.openUserMedia(localRenderer, remoteRenderer);
    // signaling.peerClose();

    ReservationModel reservationModel = ReservationModel(
      isHelperExist: false,
      isObserverExist: false,
      callIntroduction: callIntroduction,
      createdDTTM: DateTime.now(),
      roomId: roomId,
      helpeeInfos: {
        'phoneBrand': userPublicModel!.phoneBrand,
        'name': userPublicModel.name,
      },
    );

    await reservations
        .doc(roomId)
        .set(reservationModel.toMap())
        .then((value) => res = SUCCESS)
        .catchError((err) => res = err.message);
    return res;
  }

  Future<String?> updateReservationWithHelperInfos(roomId) async {
    String res = ERROR;
    String currentUserUid = _auth.currentUser!.uid;

    UserPublicModel? userPublicModel =
        await UserViewModel().getUserPublicModel(currentUserUid);

    ReservationModel reservationModel = ReservationModel(
      startTime: DateTime.now(),
      isHelperExist: true,
      helperInfos: {
        'phoneBrand': userPublicModel!.phoneBrand,
        'name': userPublicModel.name,
      },
    );

    await reservations
        .doc(roomId)
        .update(reservationModel.toMap())
        .then((value) => res = SUCCESS)
        .catchError((err) => res = err.message);
    return res;
  }
  //TODO: hangup 기능 만들어야함
}