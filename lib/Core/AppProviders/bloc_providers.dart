import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Features/Authentication/View/cubit/auth_cubit.dart';

MultiBlocProvider appProviders(Widget child) {
  return MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AuthCubit(),
    )
  ], child: child);
}
