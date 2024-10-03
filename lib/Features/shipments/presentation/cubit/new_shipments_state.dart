part of 'new_shipments_cubit.dart';

sealed class NewShipmentsState extends Equatable {
  const NewShipmentsState();

  @override
  List<Object> get props => [];
}

final class NewShipmentsInitial extends NewShipmentsState {}

final class NewShipmentsLoadingState extends NewShipmentsState {}

final class NewShipmentsLoadedState extends NewShipmentsState {
  final List<Shipment> newShipments;
  const NewShipmentsLoadedState({required this.newShipments});
}

final class NewShipmentsErrorState extends NewShipmentsState {
  final String error;
  const NewShipmentsErrorState({required this.error});
}
