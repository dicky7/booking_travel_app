import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/user_model.dart';

class UserService {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection("users");

  Future<void> setUser(UserModel userModel) async {
    try {
      _userReference.doc(userModel.id).set({
        "email": userModel.email,
        "name": userModel.name,
        "hobby": userModel.hobby,
        "balance": userModel.balance
      });
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot _snapshot = await _userReference.doc(id).get();
      return UserModel(
          id: id,
          email: _snapshot["email"],
          name: _snapshot["name"],
          hobby: _snapshot["hobby"],
          balance: _snapshot["balance"]
      );
    } catch (e) {
      throw e;
    }
  }
}
