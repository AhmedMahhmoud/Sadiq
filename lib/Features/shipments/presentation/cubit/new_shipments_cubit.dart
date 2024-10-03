import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sadiq/Features/shipments/data/models/shipments_model.dart';
import 'package:sadiq/Features/shipments/data/repositories/shipments_repo.dart';

part 'new_shipments_state.dart';

class NewShipmentsCubit extends Cubit<NewShipmentsState> {
  final ShipmentsRepo shipmentsRepo;
  NewShipmentsCubit({required this.shipmentsRepo})
      : super(NewShipmentsInitial());
  getNewShipments() async {
    emit(NewShipmentsLoadingState());
    final response = await shipmentsRepo.getNewShipments();
    response.fold((l) {
      emit(NewShipmentsErrorState(error: l.message));
    }, (r) {
      emit(NewShipmentsLoadedState(newShipments: r));
    });
  }
}
