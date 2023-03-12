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
  final String? roomId;
  final String? callIntroduction;

  ReservationModel({
    this.startTime,
    this.endTime,
    this.createdDTTM,
    this.isHelperExist,
    this.isObserverExist,
    this.helpeeInfos,
    this.helperInfos,
    this.observerInfos,
    this.roomId,
    this.callIntroduction,
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
      roomId: data?['roomId'],
      callIntroduction: data?['callIntroduction'],
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
      if (roomId != null) "roomId": roomId,
      if (callIntroduction != null) "callIntroduction": callIntroduction,
    };
  }
}
