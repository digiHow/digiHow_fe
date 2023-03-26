import 'package:cloud_firestore/cloud_firestore.dart';

class ReservationModel {
  final DateTime? startTime;
  final DateTime? endTime;
  final DateTime? createdDTTM;
  final bool? isHelperExist;
  final bool? isObserverExist;
  final Map<String, dynamic>? helpeeInfos;
  final Map<String, dynamic>? helperInfos;
  final Map<String, dynamic>? observerInfos;
  final String? helperRoomId;
  final String? observerRoomId;
  final String? callIntroduction;
  final bool? isCallFinished;
  final String? userWhoFinishedCall;

  ReservationModel({
    this.startTime,
    this.endTime,
    this.createdDTTM,
    this.isHelperExist,
    this.isObserverExist,
    this.helpeeInfos,
    this.helperInfos,
    this.observerInfos,
    this.helperRoomId,
    this.observerRoomId,
    this.callIntroduction,
    this.isCallFinished,
    this.userWhoFinishedCall,
  });

  factory ReservationModel.fromMap(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return ReservationModel(
      startTime: data?["startTime"]?.toDate() as DateTime,
      endTime: data?['endTime']?.toDate() as DateTime,
      createdDTTM: data?['createdDTTM']?.toDate() as DateTime,
      isHelperExist: data?['isHelperExist'],
      isObserverExist: data?['isObserverExist'],
      helpeeInfos: data?['helpeeInfos'],
      helperInfos: data?['helperInfos'],
      observerInfos: data?['observerInfos'],
      helperRoomId: data?['helperRoomId'],
      observerRoomId: data?['observerRoomId'],
      callIntroduction: data?['callIntroduction'],
      isCallFinished: data?['isCallFinished'],
      userWhoFinishedCall: data?['userWhoFinishedCall'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (startTime != null) "startTime": startTime,
      if (endTime != null) "endTime": endTime,
      if (createdDTTM != null) "createdDTTM": createdDTTM,
      if (isHelperExist != null) "isHelperExist": isHelperExist,
      if (isObserverExist != null) "isObserverExist": isObserverExist,
      if (helpeeInfos != null) "helpeeInfos": helpeeInfos,
      if (helperInfos != null) "helperInfos": helperInfos,
      if (observerInfos != null) "observerInfos": observerInfos,
      if (helperRoomId != null) "helperRoomId": helperRoomId,
      if (observerRoomId != null) "observerRoomId": observerRoomId,
      if (callIntroduction != null) "callIntroduction": callIntroduction,
      if (isCallFinished != null) "isCallFinished": isCallFinished,
      if (userWhoFinishedCall != null)
        "userWhoFinishedCall": userWhoFinishedCall,
    };
  }
}
