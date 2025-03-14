part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccess extends LoginState {
  final String message;
  LoginSuccess({required this.message});
}
final class LoginError extends LoginState {
  final String error;
  LoginError({required this.error});
}
