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
    String helperRoomId,
    String observerRoomId,
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
      helperRoomId: helperRoomId,
      observerRoomId: observerRoomId,
      helpeeInfos: {
        'phoneBrand': userPublicModel!.phoneBrand,
        'name': userPublicModel.name,
      },
      isCallFinished: true,
    );

    await reservations
        .doc(helperRoomId)
        .set(reservationModel.toMap())
        .then((value) => res = SUCCESS)
        .catchError((err) => res = err.message);
    return res;
  }

  Future<String?> updateReservationWithHelperInfos(helperRoomId) async {
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
        .doc(helperRoomId)
        .update(reservationModel.toMap())
        .then((value) => res = SUCCESS)
        .catchError((err) => res = err.message);
    return res;
  }

  Future<String?> updateReservationWithObserverInfos(
      helperRoomId, observerRoomId) async {
    String res = ERROR;
    String currentUserUid = _auth.currentUser!.uid;

    UserPublicModel? userPublicModel =
        await UserViewModel().getUserPublicModel(currentUserUid);

    print('[DEBUG] update reserve pulic name:${userPublicModel!.phoneBrand}');
    ReservationModel reservationModel = ReservationModel(
      isObserverExist: true,
      observerInfos: {
        'phoneBrand': userPublicModel.phoneBrand,
        'name': userPublicModel.name,
      },
    );

    await reservations
        .doc(helperRoomId)
        .update(reservationModel.toMap())
        .then((value) => res = SUCCESS)
        .catchError((err) => res = err.message);
    return res;
  }
  //TODO: hangup 기능 만들어야함

  Future<String?> updateReservationWithFinishInfo(String roomId) async {
    String res = ERROR;
    String currentUserUid = _auth.currentUser!.uid;
    ReservationModel reservationModel = ReservationModel(
      isCallFinished: true,
      endTime: DateTime.now(),
      userWhoFinishedCall: currentUserUid,
    );
    await reservations
        .doc(roomId)
        .update(reservationModel.toMap())
        .then((value) => res = SUCCESS)
        .catchError((err) => res = err.message);
    return res;
  }
}
