import 'package:cloud_firestore/cloud_firestore.dart';

class UserPrivateModel {
  final String? uid;
  final String? phoneNumber;

  UserPrivateModel({
    this.uid,
    this.phoneNumber,
  });

  factory UserPrivateModel.fromMap(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return UserPrivateModel(
      uid: data?["uid"],
      phoneNumber: data?["phoneNumber"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (uid != null) "uid": uid,
      if (phoneNumber != null) "phoneNumber": phoneNumber,
    };
  }
}
