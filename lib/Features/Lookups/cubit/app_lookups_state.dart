part of 'app_lookups_cubit.dart';

sealed class AppLookupsState {
  const AppLookupsState();
}

final class AppLookupsInitial extends AppLookupsState {}

final class CitiesLookupsLoadingState extends AppLookupsState {}

final class AppLookupsLoadedState extends AppLookupsState {}

final class AppLookupsErrorState extends AppLookupsState {
  final String errorMsg;

  const AppLookupsErrorState(this.errorMsg);
}
