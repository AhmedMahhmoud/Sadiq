import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:sadiq/Core/CommonData/Models/my_profile_singelton.dart';
import 'package:sadiq/Features/Authentication/Data/Models/register_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Data/Respositories/auth_repo_impl.dart';
import 'auth_signin_mixin.dart';
import 'auth_signup_mixin.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with SigninMixin, SignUpMixin {
  final AuthRepoImp authRepoImp;
  AuthCubit(this.authRepoImp) : super(AuthInitial());

  signin({required String email, required String password}) async {
    emit(AuthLoginLoadingState());
    final response =
        await authRepoImp.authLogin(email: email, password: password);
    response.fold((l) {
      emit(AuthLoginErrorState(errorMsg: l.message));
    }, (loginModel) async {
      driver = loginModel.driver;
      //add the driver to our singleton
      MyProfile profile = MyProfile();
      profile.setDriver(driver, loginModel.accessToken);
      final pref = await SharedPreferences.getInstance();

      if (rememberMe) {
        await pref.setString(
            'loginData', json.encode({'email': email, 'password': password}));
      }
      emit(AuthLoginSuccessState());
    });
  }

  signUp() async {
    emit(AuthRegisterLoadingState());
    final response =
        await authRepoImp.authRegister(registerInputsBuilder.build());
    response.fold(
      (l) {
        emit(AuthRegisterErrorState(errorMsg: l.message));
      },
      (r) => emit(AuthRegisterSuccessState(registerResponse: r)),
    );
  }
}
