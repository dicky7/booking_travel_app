import 'package:booking_travel_app/data/datasources/api/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/user_model.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signIn({   required String email, required String password,}) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      UserModel userModel = await UserService().getUserById(userCredential.user!.uid);
      return userModel;
    }catch(e){
      throw e;
    }
  }
  Future<UserModel> signUp({
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
      await UserService().setUser(user);

      return user;
    }catch(e){
      throw e;
    }
  }

  Future<void> signOut() async{
    try{
      await _auth.signOut();
    }catch(e){
      throw e;
    }
  }
}