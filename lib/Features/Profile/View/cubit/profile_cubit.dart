import 'package:bloc/bloc.dart';
import 'package:sadiq/Core/CommonData/Models/driver_model.dart';
import 'package:sadiq/Core/CommonData/Models/my_profile_singelton.dart';
import 'package:sadiq/Features/Profile/Data/Repository/profile_repo.dart';
import 'package:sadiq/Features/Profile/View/cubit/profile_mixin.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> with ProfileMixin {
  final ProfileRepo profileRepo;
  ProfileCubit({required this.profileRepo}) : super(ProfileState()) {
    //initalize the current profile state with the singlton instance
    emit(state.copyWith(driver: MyProfile().driver!));
    fillProfileInputs();
  }
  updateProfile() async {
    emit(state.copyWith(
        isLoading: true, errorMsg: '', isProfileCompleted: false));
    final driver = await profileRepo.updateProfile(updateProfileInputs);
    driver.fold(
      (l) => emit(state.copyWith(isLoading: false, errorMsg: l.message)),
      (r) => emit(state.copyWith(
          isLoading: false, driver: r, errorMsg: '', isProfileCompleted: true)),
    );
  }
}
