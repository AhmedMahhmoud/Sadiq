import 'package:get_it/get_it.dart';
import 'package:sadiq/Features/Lookups/Data/Datasource/lookup_datasource.dart';
import 'package:sadiq/Features/Lookups/Data/Repository/lookups_repo.dart';
import 'package:sadiq/Features/Lookups/cubit/app_lookups_cubit.dart';

class LookupsInj {

  static init() {
    final GetIt getIt = GetIt.instance;
    //Bloc
    getIt.registerLazySingleton(() => AppLookupsCubit(lookupRepo: getIt()));
    //DataSource
    getIt.registerLazySingleton(() => LookupDatasource(
          networkService: getIt(),
        ));
    //Repository
    getIt.registerLazySingleton(() => LookupsRepo(getIt(), getIt()));
  }
}
