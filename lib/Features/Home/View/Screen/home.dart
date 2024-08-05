import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Features/BottomNav/bloc/home_bloc.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Screens/my_orders.dart';
import 'package:sadiq/Features/Home/View/MyVechile/Views/screens/my_vechile.dart';
import 'package:sadiq/Features/Home/View/Screen/bottom_nav.dart';
import 'package:sadiq/Features/Home/View/Widgets/appbar_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pages = const [MyVechile(), MyOrders(), SizedBox()];
  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
  }

  @override
  void initState() {
    _checkLocationPermission();
    super.initState();
  }

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
            appBar: const AppbarHeader(),
            backgroundColor: AppColors.backgroundSecondaryColor,
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        state.routes.isEmpty
                            ? pages[state.currentIndex]
                            : state.routes.last,
                      ]),
                ),
                const BottomNav()
              ],
            ),
          ),
        );
      },
    );
  }
}
