import 'package:cloud_firestore/cloud_firestore.dart';

class UserPrivateModel {
  final String? uid;
  final String? phoneNumber;
  final DateTime? birthDTTM;

  UserPrivateModel({
    this.uid,
    this.phoneNumber,
    this.birthDTTM,
  });

  factory UserPrivateModel.fromMap(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return UserPrivateModel(
      uid: data?["uid"],
      phoneNumber: data?["phoneNumber"],
      birthDTTM: data?['birthDTTM'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (uid != null) "uid": uid,
      if (phoneNumber != null) "phoneNumber": phoneNumber,
      if (birthDTTM != null) "birthDTTM": birthDTTM,
    };
  }
}
