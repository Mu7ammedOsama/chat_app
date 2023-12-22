// dependencies
import 'package:flutter_bloc/flutter_bloc.dart';

// firebase
import 'package:firebase_auth/firebase_auth.dart';

// cubits
import 'package:chat_app/cubits/authCubit/authState.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  // login
  Future<void> loginUser({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: 'User not Found.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(errorMessage: 'Wrong Password.'));
      }
    } catch (e) {
      emit(LoginFailure(errorMessage: 'Something went Wrong.'));
    }
  }

  // register
  Future<void> registerUser({required String email, required String password}) async {
    emit(RegisterLoading());

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errorMessage: 'Email already Exist.'));
      } else if (e.code == 'weak-password') {
        emit(RegisterFailure(errorMessage: 'Weak Password.'));
      }
    } catch (e) {
      emit(RegisterFailure(errorMessage: 'Something went Wrong.'));
    }
  }
}
