import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Features/Authentication/View/cubit/auth_cubit.dart';

mixin SigninMixin on Cubit<AuthState> {
  bool rememberMe = false; //later will be initialized from local storage
  setRememberMe() {
    rememberMe = !rememberMe;
    emit(AuthInitial());
  }
}
