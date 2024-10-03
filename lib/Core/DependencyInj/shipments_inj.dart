import 'package:get_it/get_it.dart';
import 'package:sadiq/Features/shipments/data/datasources/shipments_datasource.dart';
import 'package:sadiq/Features/shipments/data/repositories/shipments_repo.dart';
import 'package:sadiq/Features/shipments/presentation/cubit/new_shipments_cubit.dart';

class ShipmentsInj {
  static init() {
    final GetIt getIt = GetIt.instance;
    //Bloc
    getIt
        .registerLazySingleton(() => NewShipmentsCubit(shipmentsRepo: getIt()));
    //DataSource
    getIt.registerLazySingleton(() => ShipmentsDataSource(
          networkService: getIt(),
        ));
    //Repository
    getIt.registerLazySingleton(() => ShipmentsRepo(
        connectionChecker: getIt(), shipmentsDataSource: getIt()));
  }
}
