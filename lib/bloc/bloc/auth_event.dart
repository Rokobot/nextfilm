part of 'auth_bloc.dart';

class AuthEvent {}

class SigninEvent extends AuthEvent {
  final String email;
  final String password;
  final BuildContext context;

  SigninEvent({required this.email, required this.password, required this.context});

  @override
  List<Object> get props => [email, password];
}

class SignupEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;
  final BuildContext context;

  SignupEvent(
      {required this.username, required this.email, required this.password, required this.context});

  @override
  List<Object> get props => [username, email, password];
}

class SignOutEvent extends AuthEvent {
  final BuildContext context;

  SignOutEvent({required this.context});
}
