part of 'auth_bloc.dart';

class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSucces extends AuthState {}

final class AuthSignOut extends AuthState {}

final class AuthError extends AuthState {
  final String error;
  AuthError({required this.error});

  @override
  List<Object> get props => [error];
}
