import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Features/Authentication/Presentation/cubit/auth_cubit.dart';
import 'package:sadiq/Features/BottomNav/bloc/home_bloc.dart';
import 'package:sadiq/Features/Home/View/MyOrders/cubit/order_details_stepper_cubit.dart';
import 'package:sadiq/Features/Lookups/cubit/app_lookups_cubit.dart';

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
      )
    ],
    child: child,
  );
}
