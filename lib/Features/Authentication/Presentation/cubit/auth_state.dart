part of 'auth_cubit.dart';

sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthLoginLoadingState extends AuthState {}

final class AuthLoginErrorState extends AuthState {
  final String errorMsg;
  AuthLoginErrorState({required this.errorMsg});
}

final class AuthLoginSuccessState extends AuthState {}

final class ChangeSignUpStep extends AuthState {}

final class ChangeStepperStep extends AuthState {}

final class AuthRegisterSuccessState extends AuthState {
  final RegisterResponse registerResponse;

  AuthRegisterSuccessState({required this.registerResponse});
}

final class AuthRegisterErrorState extends AuthState {
  final String errorMsg;
  AuthRegisterErrorState({required this.errorMsg});
}

final class AuthRegisterLoadingState extends AuthState {}
// final class ChooseCity extends AuthState {}

// final class ChooseType extends AuthState {}

// final class ChooseVehicle extends AuthState {}
