import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Core/AppProviders/bloc_providers.dart';
import 'package:sadiq/Core/Shared/ui/cards/home_rounded_bottom_card.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/new_shipments_display.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/orders_filteration.dart';
import 'package:sadiq/Features/shipments/presentation/cubit/new_shipments_cubit.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  void initState() {
    final shipmentCubit = context.read<NewShipmentsCubit>();
    if (shipmentCubit.state is! NewShipmentsLoadedState) {
      shipmentCubit.getNewShipments();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HomeRoundedBottomCard(
            widget: NewShipmentsDisplay(),
            height: 300,
          ),
          OrdersFilteration()
        ],
      ),
    );
  }
}
