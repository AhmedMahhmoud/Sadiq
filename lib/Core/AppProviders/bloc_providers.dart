import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Features/Authentication/Presentation/cubit/auth_cubit.dart';
import 'package:sadiq/Features/BottomNav/bloc/home_bloc.dart';
import 'package:sadiq/Features/DeliveryCars/View/cubit/carsdelivery_cubit.dart';
import 'package:sadiq/Features/Home/View/MyOrders/cubit/order_details_stepper_cubit.dart';
import 'package:sadiq/Features/Lookups/cubit/app_lookups_cubit.dart';
import 'package:sadiq/Features/Profile/View/cubit/profile_cubit.dart';
import 'package:sadiq/Features/shipments/presentation/cubit/new_shipments_cubit.dart';

import '../../Features/Setting/View/cubit/setting_cubit.dart';
import '../DependencyInj/dep_inj.dart' as di;

MultiBlocProvider appProviders(Widget child) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => di.getIt<AuthCubit>()),
      BlocProvider(
          create: (context) =>
              di.getIt<AppLookupsCubit>()..getCitiesFromMixin()),
      BlocProvider(
        create: (context) => HomeBloc(),
      ),
      BlocProvider(
        create: (context) => SettingCubit(),
      ),
      BlocProvider(
        create: (context) => OrderDetailsStepperCubit(),
      ),
      BlocProvider(create: (context) => di.getIt<CarsdeliveryCubit>()),
      BlocProvider(create: (context) => di.getIt<ProfileCubit>()),
      BlocProvider(create: (context) => di.getIt<NewShipmentsCubit>()),
    ],
    child: child,
  );
}
