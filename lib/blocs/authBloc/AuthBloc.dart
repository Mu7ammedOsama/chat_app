import 'package:chat_app/blocs/authBloc/AuthEvent.dart';
import 'package:chat_app/blocs/authBloc/AuthState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
        // login
        if (event is LoginEvent) {
          emit(LoginLoading());

          try {
            await FirebaseAuth.instance.signInWithEmailAndPassword(email: event.email, password: event.password);
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
        if (event is RegisterEvent) {
          emit(RegisterLoading());

          try {
            await FirebaseAuth.instance.createUserWithEmailAndPassword(email: event.email, password: event.password);
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
      },
    );
  }
}
