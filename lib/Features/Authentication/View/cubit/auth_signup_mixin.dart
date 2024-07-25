import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Features/Authentication/View/cubit/auth_cubit.dart';

mixin SignUpMixin on Cubit<AuthState> {
  String choosedCity = ''; //later will be initialized from local storage
  chooseCity(String city) {
    choosedCity = city;
    emit(ChooseCity());
  }
}
