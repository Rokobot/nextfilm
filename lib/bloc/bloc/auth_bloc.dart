import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nextfilm/screens/auth/signup_page.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SigninEvent>(SigninMethod);
    on<SignupEvent>(SignupMethod);
  }

  //To sign up firebase-firestore
  SignupMethod(SignupEvent event, Emitter<AuthState> emit) {
    emit(AuthLoading());
    if (event.username.isNotEmpty &&
        event.email.isNotEmpty &&
        event.password.isNotEmpty) {
      emit(AuthSucces());
    } else {
      emit(AuthError(error: 'Check out your information'));
    }
  }

  //To sign in firebase-firestore
  SigninMethod(SigninEvent event, Emitter<AuthState> emit) {
    emit(AuthLoading());
    if (event.email.isNotEmpty || event.password.isNotEmpty) {
      emit(AuthSucces());
    } else {
      emit(AuthError(error: 'Check out your information'));
    }
  }
}
