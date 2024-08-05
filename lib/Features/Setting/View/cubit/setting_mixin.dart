import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Features/Setting/View/cubit/setting_cubit.dart';

mixin SettingMixin on Cubit<SettingState> {
  bool isReady = false;
  bool openLocation = false;

  changeReadyStatus() {
    isReady = !isReady;
    emit(ChnageReadyStatus());
  }

  changeLocationStatus() {
    openLocation = !openLocation;
    emit(ChnageLocationStatus());
  }
}
