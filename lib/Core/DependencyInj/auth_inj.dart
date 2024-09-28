import 'package:get_it/get_it.dart';
import 'package:sadiq/Features/Authentication/Data/Datasources/Remote/auth_remote_datasource.dart';
import 'package:sadiq/Features/Authentication/Data/Respositories/auth_repo_impl.dart';
import 'package:sadiq/Features/Authentication/Presentation/cubit/auth_cubit.dart';
import 'package:sadiq/Features/Profile/Data/Datasource/profile_datasource.dart';
import 'package:sadiq/Features/Profile/Data/Repository/profile_repo.dart';
import 'package:sadiq/Features/Profile/View/cubit/profile_cubit.dart';

class AuthInject {
  static init() {
    final GetIt getIt = GetIt.instance;
    //Bloc
    getIt.registerLazySingleton(() => AuthCubit(getIt()));
    getIt.registerLazySingleton(() => ProfileCubit(profileRepo: getIt()));
    //DataSource
    getIt.registerLazySingleton(() => AuthRemoteDS());
    getIt.registerLazySingleton(() => ProfileDatasource());
    //Repository
    getIt.registerLazySingleton(
        () => AuthRepoImp(authRemoteDS: getIt(), connectionChecker: getIt()));
    getIt.registerLazySingleton(() =>
        ProfileRepo(profileDatasource: getIt(), connectionChecker: getIt()));
  }
}
