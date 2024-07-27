part of 'auth_cubit.dart';

sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class ChooseCity extends AuthState {}

final class ChooseType extends AuthState {}
