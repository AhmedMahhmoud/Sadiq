import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Shared/ui/snackbar/custom_snackbar.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Core/error/error_retry_widget.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/new_orders_display.dart';
import 'package:sadiq/Features/shipments/data/models/shipments_model.dart';
import 'package:sadiq/Features/shipments/presentation/cubit/new_shipments_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../Widgets/order_table_item_details_bs.dart';

class NewShipmentsDisplay extends StatelessWidget {
  const NewShipmentsDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewShipmentsCubit, NewShipmentsState>(
      listener: (context, state) {
        if (state is NewShipmentsErrorState) {
          CustomSnackbar.show(context, state.error, isError: true);
        }
      },
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is NewShipmentsLoadingState,
          child: SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: state is NewShipmentsErrorState
                  ? RetryWidget(
                      retryFunction:
                          context.read<NewShipmentsCubit>().getNewShipments())
                  : state is NewShipmentsLoadedState
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'طلبات جديدة (${state.newShipments.length})',
                              style: AppTextStyle.largeBodyBold
                                  .copyWith(fontSize: 24.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Expanded(
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) =>
                                              const OrderItemDetailsBS(
                                                  isNewOrder: true),
                                        );
                                      },
                                      child: NewOrdersDisplay(
                                        newShipment: state.newShipments[index],
                                      )),
                                ),
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 10.w,
                                ),
                                itemCount: state.newShipments.length,
                              ),
                            )
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'طلبات جديدة (${1})',
                              style: AppTextStyle.largeBodyBold
                                  .copyWith(fontSize: 24.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Expanded(
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) =>
                                              const OrderItemDetailsBS(
                                                  isNewOrder: true),
                                        );
                                      },
                                      child: NewOrdersDisplay(
                                        newShipment: Shipment(),
                                      )),
                                ),
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 10.w,
                                ),
                                itemCount: 2,
                              ),
                            )
                          ],
                        ),
            ),
          ),
        );
      },
    );
  }
}
