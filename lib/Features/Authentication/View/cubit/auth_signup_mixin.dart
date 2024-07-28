import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Features/Authentication/View/cubit/auth_cubit.dart';

mixin SignUpMixin on Cubit<AuthState> {
  int signUpStep = 0;
  int stepperStep = 0;
  String choosedCity = '';
  int choosedType = -1;

  changeSignUpStep(int step) {
    print(step);
    signUpStep = step;
    emit(ChangeSignUpStep());
    print(step);
  }

  changeStepperStep(int step) {
    emit(ChangeStepperStep());
  }

  chooseCity(String city) {
    choosedCity = city;
    emit(ChooseCity());
  }

  chooseType(int type) {
    choosedType = type;
    emit(ChooseType());
  }
}
