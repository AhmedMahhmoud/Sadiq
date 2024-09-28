part of 'profile_cubit.dart';

class ProfileState {
  final String? errorMsg;
  final bool isLoading;
  final DriverModel? driver; //currentProfileLoaded
  final bool isProfileCompleted;
  ProfileState({
    this.errorMsg,
    this.isLoading = false,
    this.driver,
    this.isProfileCompleted = false,
  });

  ProfileState copyWith(
      {String? errorMsg,
      bool? isLoading,
      DriverModel? driver,
      bool? isProfileCompleted}) {
    return ProfileState(
        errorMsg: errorMsg ?? this.errorMsg,
        isLoading: isLoading ?? this.isLoading,
        driver: driver ?? this.driver,
        isProfileCompleted: isProfileCompleted ?? this.isProfileCompleted);
  }
}
