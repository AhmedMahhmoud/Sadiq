import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/buttons/rounded/rounded_svg_container.dart';
import 'package:sadiq/Core/Shared/ui/form/gradient_text.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';

import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Core/extenstions/date_extenstion.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/distance_time_indicator.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/distance_time_vertical_dots.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/driver_call_button.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/order_item_site_detail.dart';

class ItemTapBar extends StatefulWidget {
  const ItemTapBar({
    super.key,
  });

  @override
  State<ItemTapBar> createState() => _ItemTapBarState();
}

class _ItemTapBarState extends State<ItemTapBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        width: MediaQuery.sizeOf(context).width,
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TabBar(
                      indicatorColor: AppColors.secondaryColor,
                      indicatorWeight: 2.0,
                      indicatorPadding: EdgeInsets.only(
                          right: _selectedIndex == 0 ? 20.w : 0,
                          left: _selectedIndex == 1 ? 20.w : 0),
                      labelColor: AppColors.secondaryColor,
                      onTap: (value) {
                        setState(() {
                          _selectedIndex = value;
                        });
                      },
                      tabs: [
                        Tab(
                          child: GradientText(
                            label: 'الموقع',
                            style: _selectedIndex == 0
                                ? AppTextStyle.bodyBold
                                : AppTextStyle.body.copyWith(
                                    color: AppColors.secondaryColor
                                        .withOpacity(0.4)),
                          ),
                        ),
                        Tab(
                          child: GradientText(
                            label: 'تفاصيل الطلب',
                            style: _selectedIndex == 1
                                ? AppTextStyle.bodyBold
                                : AppTextStyle.body.copyWith(
                                    color: AppColors.secondaryColor
                                        .withOpacity(0.4)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                height: 1,
                color: Colors.grey.shade300,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          Column(children: [
                            SizedBox(
                              height: 45.h,
                            ),
                            const RoundedSvgContainer(
                              borderColor: AppColors.secondaryColor,
                              backgroundColor: AppColors.primaryColor,
                              borderWidth: 2,
                              size: 35,
                              svgPath: SvgAssetsPaths.gradientBox,
                            ),
                            const BuildConnectingLine(),
                            ..._buildVerticalDots(10),
                            SizedBox(
                              width: 45.7.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 1),
                                    width: 2.w,
                                    height: 4.5.h,
                                    color: AppColors.secondaryColor
                                        .withOpacity(0.20),
                                  ),
                                  for (int i = 0; i < 5; i++)
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: i == 0 ? 0 : 1),
                                      width: 3,
                                      height: 2,
                                      color: AppColors.secondaryColor
                                          .withOpacity(0.20),
                                    )
                                ],
                              ),
                            ),
                            ..._buildVerticalDots(4),
                            const RoundedSvgContainer(
                              borderColor: AppColors.secondaryColor,
                              backgroundColor: AppColors.primaryColor,
                              borderWidth: 2,
                              size: 35,
                              svgPath: SvgAssetsPaths.gradientlocation,
                            ),
                          ]),
                          Expanded(child: Container()),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('#2311750', style: AppTextStyle.smallBody),
                              const SizedBox(height: 5),
                              Text(
                                'اسم الشحنة',
                                style: AppTextStyle.largeBodyBold
                                    .copyWith(fontSize: 18.sp),
                              ),
                              const SizedBox(height: 5),
                              OrderItemSiteDetail(
                                  site: 'الوجهة ١',
                                  isDeliveringSite: true,
                                  timeLeft: DateTime.now().toArabicTime()),
                              SizedBox(
                                height: 10.h,
                              ),
                              DistanceTimeIndicatorContent(
                                distance: '٢٥ كم',
                                time: 'ساعة و ٢٣ دقيقة',
                                style: AppTextStyle.smallBody.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              OrderItemSiteDetail(
                                site: 'الوجهة ٢',
                                timeLeft: DateTime.now().toArabicTime(),
                                isDeliveringSite: false,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Text('Content for تفاصيل الطلب'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> _buildVerticalDots(int noOFLines) {
  return List.generate(
    noOFLines,
    (_) => Container(
      margin: const EdgeInsets.symmetric(vertical: 1.5),
      width: 2.w,
      height: 4.5.h,
      color: AppColors.secondaryColor.withOpacity(0.20),
    ),
  );
}
