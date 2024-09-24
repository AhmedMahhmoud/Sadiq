part of 'carsdelivery_cubit.dart';

sealed class CarsdeliveryState extends Equatable {
  const CarsdeliveryState();

  @override
  List<Object> get props => [];
}

final class CarsdeliveryInitial extends CarsdeliveryState {}

final class CarsLoadingState extends CarsdeliveryState {}

final class CarsLoadedState extends CarsdeliveryState {
  final List<CarModel> carsList;

  const CarsLoadedState({required this.carsList});
}

final class CarsErrorState extends CarsdeliveryState {
  final String error;

  const CarsErrorState(this.error);
}
