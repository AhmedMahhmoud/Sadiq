import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Shared/ui/buttons/radio/radio_img.dart';
import 'package:sadiq/Features/DeliveryCars/Data/Models/car_model.dart';
import 'package:sadiq/Features/DeliveryCars/View/cubit/carsdelivery_cubit.dart';
import '../../../../Core/Shared/ui/buttons/rounded/rounded_button.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';
import '../../../../Core/Theme/text/text_style.dart';
import '../cubit/auth_cubit.dart';

class VehicleDetailsStep extends StatelessWidget {
  const VehicleDetailsStep({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final authCubit = context.read<AuthCubit>();

        return Column(
          children: [
            Text(
              'بيانات المركبة',
              style: AppTextStyle.largeBodyMedium
                  .copyWith(color: AppColors.primaryColor, fontSize: 24),
            ),
            SizedBox(height: 12.h),

            // GridView.builder to display vehicles from API
            BlocBuilder<CarsdeliveryCubit, CarsdeliveryState>(
              builder: (context, state) {
                final vehicles = state as CarsLoadedState;
                inspect(vehicles.carsList);
                return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: vehicles.carsList.length,
                  itemBuilder: (context, index) {
                    final vehicle = vehicles.carsList[index];

                    return RadioImageIcon(
                      imageUrl: vehicle.image, // Use image from model
                      title: vehicle.name,
                      isChooised: authCubit.choosedVehcile == vehicle.id,
                      onClick: () {
                        authCubit.chooseVehcile(vehicle.id);
                      },
                    );
                  },
                );
              },
            ),
            SizedBox(height: 12.h),
            Center(
              child: Opacity(
                opacity: authCubit.choosedVehcile == -1 ? 0.5 : 1,
                child: RoundedButton(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  onPressed: () {
                    if (authCubit.choosedVehcile != -1) {
                      authCubit.changeSignUpStep(4);
                    }
                  },
                  title: 'استمر',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
