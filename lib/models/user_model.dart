import 'package:digi_how/models/user_private_model.dart';
import 'package:digi_how/models/user_public_model.dart';

class UserModel {
  UserModel(this.userPublicModel, this.userPrivateModel);

  final UserPublicModel? userPublicModel;
  final UserPrivateModel? userPrivateModel;
}
