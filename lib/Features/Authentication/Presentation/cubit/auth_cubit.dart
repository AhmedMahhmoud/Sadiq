import 'dart:convert';

import 'package:bloc/bloc.dart';
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

      final pref = await SharedPreferences.getInstance();
      await pref.setString('accessToken', loginModel.accessToken);

      if (rememberMe) {
        await pref.setString(
            'loginData', json.encode({'email': email, 'password': password}));
      }

      emit(AuthLoginSuccessState());
    });
  }
}
