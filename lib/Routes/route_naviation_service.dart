import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Features/BottomNav/bloc/home_bloc.dart';

abstract class RouteNavService {
  static navigateToPage(Widget page, BuildContext context) {
    context.read<HomeBloc>().add(PushPageWithBottomNav(page));
  }

  static popPage(BuildContext context) {
    context.read<HomeBloc>().add(RemovePage());
  }
}
