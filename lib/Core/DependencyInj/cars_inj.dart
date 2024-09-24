import 'package:get_it/get_it.dart';
import 'package:sadiq/Features/DeliveryCars/Data/Datasource/cars_datasource.dart';
import 'package:sadiq/Features/DeliveryCars/Data/Repository/cars_repository.dart';
import 'package:sadiq/Features/DeliveryCars/View/cubit/carsdelivery_cubit.dart';

class CarsInj {
  static init() {
    final GetIt getIt = GetIt.instance;
    //Bloc
    getIt.registerLazySingleton(
        () => CarsdeliveryCubit(carsRepository: getIt()));
    //DataSource
    getIt.registerLazySingleton(() => CarsDatasource(networkService: getIt()));
    //Repository
    getIt.registerLazySingleton(() =>
        CarsRepository(carsDatasource: getIt(), connectionChecker: getIt()));
  }
}
