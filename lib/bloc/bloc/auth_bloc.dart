import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nextfilm/screens/auth/signup_page.dart';
import 'package:nextfilm/services/auth_firebase_service.dart';
import 'package:nextfilm/widgets/methods.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SigninEvent>(SigninMethod);
    on<SignupEvent>(SignupMethod);
    on<SignOutEvent>(SignoutMethd);
  }

  //To sign up firebase-firestore
  SignupMethod(SignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    if (event.username.isNotEmpty &&
        event.email.isNotEmpty &&
        event.password.isNotEmpty) {
      await AuthFirebaseService(
              username: event.username,
              email: event.email,
              password: event.password)
          .signupUser()
          .then((value) {
        if (value == true) {
          emit(AuthSucces());
        } else {}
      });
    } else {
      emit(AuthError(error: 'Check out your information'));
    }
  }

  //To sign in firebase-firestore
  SigninMethod(SigninEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    if (event.email.isNotEmpty || event.password.isNotEmpty) {
      await AuthFirebaseService(
              email: event.email, password: event.password, username: '')
          .siginUser()
          .then((value) {
        print('1val ---->>> $value');

        if (value == true) {
          print('val ---->>> $value');
          emit(AuthSucces());
          return true;
        } else {
          emit(AuthError(error: value.toString()));
        }
      });
    } else {
      emit(AuthError(error: 'Check out your information'));
    }
  }

  SignoutMethd(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await AuthFirebaseService(email: '', password: '', username: '')
        .getSignOut()
        .then((value) {
      if (value == true) {
        emit(AuthSignOut());
      } else {
        emit(AuthError(error: value));
      }
    });
  }
}
