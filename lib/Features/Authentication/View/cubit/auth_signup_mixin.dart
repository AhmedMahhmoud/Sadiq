import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Features/Authentication/View/cubit/auth_cubit.dart';

mixin SignUpMixin on Cubit<AuthState> {
  String choosedCity = '';
  int choosedType = -1;
  chooseCity(String city) {
    choosedCity = city;
    emit(ChooseCity());
  }

  chooseType(int type) {
    choosedType = type;
    emit(ChooseType());
  }
}
