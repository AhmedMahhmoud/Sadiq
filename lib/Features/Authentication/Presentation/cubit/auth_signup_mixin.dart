import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Core/CommonData/Models/city_model.dart';
import 'package:sadiq/Core/CommonData/Models/company_model.dart';
import 'package:sadiq/Features/Authentication/Presentation/cubit/auth_cubit.dart';

mixin SignUpMixin on Cubit<AuthState> {
  int signUpStep = 0;
  int stepperStep = 0;
  CityModel? choosedCity;
  int choosedType = -1;
  int choosedVehcile = -1;
  CompanyModel? companyModel;
  changeSignUpStep(int step) {
    signUpStep = step;
    emit(ChangeSignUpStep());
  }

  chooseCity(CityModel city) {
    choosedCity = city;
    emit(ChooseCity());
  }

  chooseType(int type) {
    debugPrint(type.toString());
    choosedType = type;
    emit(ChooseType());
  }

  chooseVehcile(int type) {
    choosedVehcile = type;
    emit(ChooseVehicle());
  }
}
