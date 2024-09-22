import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Core/CommonData/Models/company_model.dart';
import 'package:sadiq/Features/Lookups/Data/Repository/lookups_repo.dart';
import 'package:sadiq/Features/Lookups/cubit/app_lookups_cubit.dart';

mixin CompaniesMixin on Cubit<AppLookupsState> {
  List<CompanyModel> companies = [];
  getCompanies(LookupsRepo lookupsRepo) async {
    emit(CompaniesLookupsLoadingState());
    final companyResp = await lookupsRepo.getCompanies();
    companyResp.fold(
      (l) => emit(AppLookupsErrorState(l.message)),
      (r) {
        companies = r;
        emit(AppLookupsLoadedState());
      },
    );
  }
}
