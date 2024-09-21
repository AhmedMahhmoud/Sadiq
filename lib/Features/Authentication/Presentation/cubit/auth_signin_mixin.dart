import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Core/CommonData/Models/driver_model.dart';
import 'package:sadiq/Features/Authentication/Presentation/cubit/auth_cubit.dart';

mixin SigninMixin on Cubit<AuthState> {
  bool rememberMe = false; //later will be initialized from local storage
  late DriverModel driver;
  setRememberMe() {
    rememberMe = !rememberMe;
    emit(AuthInitial());
  }
}
