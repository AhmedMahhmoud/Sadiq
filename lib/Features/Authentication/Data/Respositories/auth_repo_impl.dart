import 'dart:developer';

import 'package:sadiq/Features/Authentication/Data/Models/register_model.dart';
import 'package:sadiq/Features/Authentication/Data/Models/register_response.dart';

import '../../../../Core/Constants/type_def/type_def.dart';
import '../../../../Core/Network/connection_checker.dart';

import '../../../../Core/Network/repo_implementer.dart';
import '../Datasources/Remote/auth_remote_datasource.dart';
import '../Models/login_model.dart';

class AuthRepoImp {
  final AuthRemoteDS authRemoteDS;
  final ConnectionChecker connectionChecker;
  AuthRepoImp({required this.authRemoteDS, required this.connectionChecker});

  futureEither<LoginModel> authLogin(
      {required String email, required String password}) {
    return RepoImplementerHandler.apiCall(() async {
      return authRemoteDS.authLogin(email: email, password: password);
    }, connectionChecker);
  }

  futureEither<RegisterResponse> authRegister(RegisterInputs inputs) {
    inspect(inputs);
    return RepoImplementerHandler.apiCall(() async {
      return authRemoteDS.authRegister(inputs);
    }, connectionChecker);
  }
}
