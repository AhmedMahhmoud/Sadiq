part of 'setting_cubit.dart';

sealed class SettingState {
  const SettingState();
}

final class SettingInitial extends SettingState {}

final class ChnageReadyStatus extends SettingState {}

final class ChnageLocationStatus extends SettingState {}
