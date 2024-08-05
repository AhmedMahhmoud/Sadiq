import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Features/Setting/View/cubit/setting_mixin.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> with SettingMixin {
  SettingCubit() : super(SettingInitial());
}
