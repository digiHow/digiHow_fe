import 'package:cloud_firestore/cloud_firestore.dart';

class UserPublicModel {
  String? name;
  bool? gender;
  String? phoneBrand;
  bool? isHelpee;
  DateTime? createdDate;
  DateTime? updatedDate;
  DateTime? lastLogin;

  UserPublicModel({
    this.name,
    this.gender,
    this.phoneBrand,
    this.isHelpee,
    this.createdDate,
    this.updatedDate,
    this.lastLogin,
  });

  factory UserPublicModel.fromMap(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    var createdDate;
    var updatedDate;
    var lastLogin;
    if (data?["createdDate"] != null) {
      createdDate = data?["createdDate"].toDate();
    }
    if (data?["updatedDate"] != null) {
      updatedDate = data?["updatedDate"].toDate();
    }
    if (data?["lastLogin"] != null) {
      lastLogin = data?["lastLogin"].toDate();
    }

    return UserPublicModel(
      name: data?['name'],
      gender: data?['gender'],
      phoneBrand: data?['phoneBrand'],
      isHelpee: data?['isHelpee'],
      createdDate: createdDate,
      updatedDate: updatedDate,
      lastLogin: lastLogin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (name != null) 'name': name,
      if (gender != null) 'gender': gender,
      if (phoneBrand != null) 'phoneBrand': phoneBrand,
      if (isHelpee != null) 'isHelpee': isHelpee,
      if (createdDate != null) 'createdDate': createdDate,
      if (updatedDate != null) 'updatedDate': updatedDate,
      if (lastLogin != null) 'lastLogin': lastLogin,
    };
  }
}
