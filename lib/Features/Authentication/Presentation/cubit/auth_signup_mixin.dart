import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Features/Authentication/Presentation/cubit/auth_cubit.dart';

mixin SignUpMixin on Cubit<AuthState> {
  int signUpStep = 0;
  int stepperStep = 0;
  String choosedCity = '';
  int choosedType = -1;
  int choosedVehcile = -1;

  changeSignUpStep(int step) {
    signUpStep = step;
    emit(ChangeSignUpStep());
  }

  chooseCity(String city) {
    choosedCity = city;
    emit(ChooseCity());
  }

  chooseType(int type) {
    choosedType = type;
    emit(ChooseType());
  }

  chooseVehcile(int type) {
    choosedVehcile = type;
    emit(ChooseVehicle());
  }
}
