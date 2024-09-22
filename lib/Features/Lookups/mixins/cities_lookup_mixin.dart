import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Core/CommonData/Models/city_model.dart';
import 'package:sadiq/Features/Lookups/Data/Repository/lookups_repo.dart';
import 'package:sadiq/Features/Lookups/cubit/app_lookups_cubit.dart';

mixin CityMixin on Cubit<AppLookupsState> {
  List<CityModel> cities = [];
  getCities(LookupsRepo lookupsRepo) async {
    emit(CitiesLookupsLoadingState());
    final cityResponse = await lookupsRepo.getCities();
    cityResponse.fold(
      (l) => emit(AppLookupsErrorState(l.message)),
      (r) {
        cities = r;
        emit(AppLookupsLoadedState());
      },
    );
  }
  
}
