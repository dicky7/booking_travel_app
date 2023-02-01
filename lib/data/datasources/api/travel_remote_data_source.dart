import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/user_model.dart';

abstract class TravelRemoteDataSource {
  Future<UserModel> signUp({required String id,
    required String email,
    required String password,
    required String name, String? hobby,
  });

  //save data to firestore
  Future<void> setUser(UserModel userModel);
  
}

class TravelRemoteDataSourceImpl extends TravelRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _userReference = FirebaseFirestore.instance.collection("users");

  @override
  Future<UserModel> signUp({required String id,
    required String email,
    required String password,
    required String name, String? hobby}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
          id: userCredential.user!.uid,
          email: email,
          name: name,
          hobby: hobby,
          balance: 280000000);
      await setUser(user);

      return user;
    }catch(e){
      throw e;
    }
  }

  @override
  Future<void> setUser(UserModel userModel) async{
    try{
      _userReference.doc(userModel.id).set({
        "email": userModel.email,
        "name": userModel.name,
        "hobby": userModel.hobby,
        "balance": userModel.balance
      });
    }catch(e){
      throw e;
    }
  }
}
