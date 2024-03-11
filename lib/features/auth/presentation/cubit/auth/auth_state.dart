part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState
{}

// ignore: must_be_immutable
class LoginErrorState extends AuthState
{
   String ?error;

  LoginErrorState(this.error);
}