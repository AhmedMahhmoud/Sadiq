import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sadiq/Features/DeliveryCars/Data/Models/car_model.dart';
import 'package:sadiq/Features/DeliveryCars/Data/Repository/cars_repository.dart';

part 'carsdelivery_state.dart';

class CarsdeliveryCubit extends Cubit<CarsdeliveryState> {
  final CarsRepository carsRepository;
  CarsdeliveryCubit({required this.carsRepository})
      : super(CarsdeliveryInitial());
  getCars() async {
    emit(CarsLoadingState());
    final response = await carsRepository.getCars();
    response.fold(
      (l) => emit(CarsErrorState(l.message)),
      (r) => emit(CarsLoadedState(carsList: r)),
    );
  }
}
