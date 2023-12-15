import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SigninEvent>(SigninMethod);
    on<SignupEvent>(SignupMethod);
  }

  //To sign up firebase-firestore
  SignupMethod(SignupEvent event, Emitter<AuthState> emit) {}

  //To sign in firebase-firestore
  SigninMethod(SigninEvent event, Emitter<AuthState> emit) {}
}
