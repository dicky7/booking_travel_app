import 'package:bloc/bloc.dart';
import 'package:booking_travel_app/data/datasources/api/auth_service.dart';
import 'package:booking_travel_app/data/datasources/api/user_service.dart';
import 'package:booking_travel_app/data/model/user_model.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn({required String email, required String password,}) async{
    try{
      emit(AuthLoading());
      UserModel user = await AuthService().signIn(email: email, password: password);
      emit(AuthSuccess(user));
    }catch(e){
      emit(AuthError(e.toString()));
    }
  }

  void signUp({required String email,
    required String password,
    required String name, String? hobby}) async {

    try {
      emit(AuthLoading());
      final UserModel userModel = await AuthService().signUp(
          email: email,
          password: password,
          name: name,
          hobby: hobby);
      emit(AuthSuccess(userModel));
    }catch(e){
      emit(AuthError(e.toString()));
    }
  }

  void signOut() async{
    try{
      emit(AuthLoading());
      await AuthService().signOut();
      emit(AuthInitial());
    }catch(e){
      emit(AuthError(e.toString()));
    }
  }

  void getUserById(String id) async{
    try{
      UserModel userModel = await UserService().getUserById(id);
      emit(AuthSuccess(userModel));
    }catch(e){
      emit(AuthError(e.toString()));
    }
  }

}
