import 'package:get_it/get_it.dart';
import 'package:sadiq/Features/Authentication/Data/Datasources/Remote/auth_remote_datasource.dart';
import 'package:sadiq/Features/Authentication/Data/Respositories/auth_repo_impl.dart';
import 'package:sadiq/Features/Authentication/Presentation/cubit/auth_cubit.dart';

class AuthInject {
  static init() {
    final GetIt getIt = GetIt.instance;
    //Bloc
    getIt.registerLazySingleton(() => AuthCubit(getIt()));
    //DataSource
    getIt.registerLazySingleton(() => AuthRemoteDS());
    //Repository
    getIt.registerLazySingleton(
        () => AuthRepoImp(authRemoteDS: getIt(), connectionChecker: getIt()));
  }
}
