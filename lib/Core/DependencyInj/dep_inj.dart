import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sadiq/Core/DependencyInj/auth_inj.dart';
import 'package:sadiq/Core/DependencyInj/lookups_inj.dart';
import 'package:sadiq/Core/Network/connection_checker.dart';
import 'package:sadiq/Core/Network/network_service.dart';

final GetIt getIt = GetIt.instance;
Future<void> setupDependencies() async {
  AuthInject.init();
  LookupsInj.init();
  //Externals!
  getIt.registerLazySingleton<ConnectionChecker>(
      () => ConnectionChecker(getIt()));
  getIt.registerLazySingleton<GetNetworkService>(() => GetNetworkService());
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
