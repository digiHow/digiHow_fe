import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digi_how/consts/error_messages.dart';
import 'package:digi_how/models/user_public_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<String> signUpWithEmailAndPassword(
      {required String userEmail, required String userPassword}) async {
    String res = ERROR;
    try {
      await _auth.createUserWithEmailAndPassword(
          email: userEmail, password: userPassword);
      res = SUCCESS;
    } on FirebaseAuthException catch (err) {
      String errCode = err.code;
      if (errCode == EMAIL_ALREADY_IN_USE) {
        res = '이미 존재하는 이메일입니다';
      } else {
        res = errCode;
      }
    }
    return res;
  }

  Future<String> signInWithEmailAndPassword(
      {required String userEmail, required String userPassword}) async {
    String res = ERROR;
    try {
      await _auth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);

      String currentUserUid = _auth.currentUser!.uid;
      DateTime now = DateTime.now();
      UserPublicModel userPublic = UserPublicModel(lastLogin: now);
      users.doc(currentUserUid).update(userPublic.toMap());
      res = SUCCESS;
    } on FirebaseAuthException catch (err) {
      res = err.code;
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> signInWithGoogle() async {
    String res = ERROR;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      res = SUCCESS;
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //TODO: 비밀번호 찾기 기능

  Future<String> createUserDbWithUidAndPutPersonalInfos({
    required String name,
  }) async {
    String res = ERROR;
    String currentUserUid = _auth.currentUser!.uid;

    DateTime now = DateTime.now();
    UserPublicModel userPublic = UserPublicModel(
      name: name,
      createdDate: now,
      updatedDate: now,
      lastLogin: now,
    );
    await users
        .doc(currentUserUid)
        .set(userPublic.toMap())
        .then((value) => res = SUCCESS)
        .catchError((err) => res = err.message);
    return res;
  }

  Future<String> updateUserDbWithPhoneBrand(
      {required String phoneBrand}) async {
    String res = ERROR;
    String currentUserUid = _auth.currentUser!.uid;

    DateTime now = DateTime.now();
    UserPublicModel userPublic = UserPublicModel(
        updatedDate: now, lastLogin: now, phoneBrand: phoneBrand);
    users
        .doc(currentUserUid)
        .update(userPublic.toMap())
        .then((value) => res = SUCCESS)
        .catchError((err) => res = err.message);
    return res;
  }
}
