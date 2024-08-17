import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_details_stepper_state.dart';

class OrderDetailsStepperCubit extends Cubit<OrderDetailsStepperState> {
  OrderDetailsStepperCubit()
      : super(const OrderDetailsStepperState(currentStep: 0));
  bool isDelivered = false;
  void changeStep(int newIndex) {
    emit(state.copyWith(currentStep: newIndex));
  }

  deliverOrder() {
    isDelivered = true;
    emit(state.copyWith(currentStep: 3));
  }

  resetCubit() {
    isDelivered = false;
    emit(state.copyWith(currentStep: 0));
  }
}
