import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sadiq/Core/DependencyInj/auth_inj.dart';
import 'package:sadiq/Core/DependencyInj/cars_inj.dart';
import 'package:sadiq/Core/DependencyInj/lookups_inj.dart';
import 'package:sadiq/Core/DependencyInj/shipments_inj.dart';
import 'package:sadiq/Core/Network/connection_checker.dart';
import 'package:sadiq/Core/Network/network_service.dart';

final GetIt getIt = GetIt.instance;
Future<void> setupDependencies() async {
  AuthInject.init();
  CarsInj.init();
  LookupsInj.init();
  ShipmentsInj.init();
  //Externals!
  getIt.registerLazySingleton<ConnectionChecker>(
      () => ConnectionChecker(getIt()));
  getIt.registerLazySingleton<GetNetworkService>(() => GetNetworkService());
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
