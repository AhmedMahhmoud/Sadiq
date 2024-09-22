import 'package:bloc/bloc.dart';
import 'package:sadiq/Features/Lookups/Data/Repository/lookups_repo.dart';
import 'package:sadiq/Features/Lookups/mixins/cities_lookup_mixin.dart';
import 'package:sadiq/Features/Lookups/mixins/companies_lookup_mixin.dart';

part 'app_lookups_state.dart';

//Lookups are the data that is used inside app in multiple screens and to be fetched on app launching or afterlogin ...
class AppLookupsCubit extends Cubit<AppLookupsState>
    with CityMixin, CompaniesMixin {
  final LookupsRepo lookupRepo;
  AppLookupsCubit({required this.lookupRepo}) : super(AppLookupsInitial());
  getCitiesFromMixin() {
    getCities(lookupRepo);
  }

  getCompaniesFromMixin() {
    getCompanies(lookupRepo);
  }
}
