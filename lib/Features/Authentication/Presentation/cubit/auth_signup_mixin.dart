import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Core/CommonData/Models/city_model.dart';
import 'package:sadiq/Core/CommonData/Models/company_model.dart';
import 'package:sadiq/Features/Authentication/Data/Models/register_model.dart';
import 'package:sadiq/Features/Authentication/Presentation/cubit/auth_cubit.dart';

mixin SignUpMixin on Cubit<AuthState> {
  int signUpStep = 0;
  int stepperStep = 0;
  CityModel? choosedCity;
  int choosedType = -1;
  int choosedVehcile = -1;
  CompanyModel? companyModel;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController birthdateController = TextEditingController();
  final RegisterInputsBuilder registerInputsBuilder = RegisterInputsBuilder();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  changeSignUpStep(int step) {
    signUpStep = step;
    emit(ChangeSignUpStep());
  }

  setCompanyModel(CompanyModel company) {
    companyModel = company;
    registerInputsBuilder.deliveryCompanyID = company.id.toString();
    emit(AuthInitial());
  }

  chooseCity(CityModel city) {
    choosedCity = city;
    registerInputsBuilder.cityID = city.id.toString();
    emit(AuthInitial());
  }

  chooseType(int type) {
    debugPrint(type.toString());
    choosedType = type;
    registerInputsBuilder.type = type == 0 ? 'company' : 'saudi';
    emit(AuthInitial());
  }

  chooseVehcile(int type) {
    choosedVehcile = type;
    registerInputsBuilder.vehicleID = type.toString();
    emit(AuthInitial());
  }
}
