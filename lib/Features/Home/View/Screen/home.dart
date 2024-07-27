import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Features/BottomNav/bloc/home_bloc.dart';
import 'package:sadiq/Features/Home/View/MyVechile/Views/screens/my_vechile.dart';
import 'package:sadiq/Features/Home/View/Screen/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final pages = const [MyVechile(), SizedBox(), SizedBox()];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            if (state.routes.isNotEmpty) {
              context.read<HomeBloc>().add(RemovePage());
              return false;
            }
            return true;
          },
          child: Scaffold(
            backgroundColor: AppColors.backgroundSecondaryColor,
            body: Column(children: [
              state.routes.isEmpty
                  ? pages[state.currentIndex]
                  : state.routes.last,
            ]),
            bottomNavigationBar: const BottomNav(),
          ),
        );
      },
    );
  }
}
