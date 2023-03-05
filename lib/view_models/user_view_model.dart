import 'package:digi_how/models/user_public_model.dart';

class UserViewModel {
  Future<bool> saveUserProfile({
    required String name,
    required String phoneNumber,
    required bool gender,
    required String phoneBrand,
    required bool isHelpee,
    required DateTime birthDTTM,
  }) async {
    bool res = false;
    try {
      DateTime now = DateTime.now();
      UserPublicModel userPublic = UserPublicModel(
        name: name,
        gender: gender,
        phoneBrand: phoneBrand,
        isHelpee: isHelpee,
        createdDate: now,
        updatedDate: now,
        lastLogin: now,
      );
      // UserPrivateModel userPrivate = UserPrivateModel(birthDTTM: birthDTTM, phoneNumber: phoneNumber, uid)//TODO: uid를 받으려면 먼저 로그인이나 회원가입 부터 해야함
    } catch (err) {}
    return res;
  }
  //TODO: pw는 따로 받아야 함
}
