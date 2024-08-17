part of 'order_details_stepper_cubit.dart';

class OrderDetailsStepperState {
  final int currentStep;

  const OrderDetailsStepperState({
    required this.currentStep,
  });
  OrderDetailsStepperState copyWith({
    int? currentStep,
    int? totalSteps,
  }) {
    return OrderDetailsStepperState(
      currentStep: currentStep ?? this.currentStep,
    );
  }
}
