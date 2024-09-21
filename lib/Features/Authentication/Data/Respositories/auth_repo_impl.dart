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
}
