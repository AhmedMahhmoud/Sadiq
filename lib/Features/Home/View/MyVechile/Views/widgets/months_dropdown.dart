import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';

class MonthDropdown extends StatefulWidget {
  const MonthDropdown({super.key});

  @override
  MonthDropdownState createState() => MonthDropdownState();
}

class MonthDropdownState extends State<MonthDropdown> {
  String? selectedMonth;

  final List<String> months = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 110,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.secondaryColor.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedMonth,
            hint: Text('الشهر',
                style: AppTextStyle.body
                    .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500)),
            icon: const SvgDisplay(path: SvgAssetsPaths.arrowDown),
            items: months.map((String month) {
              return DropdownMenuItem<String>(
                value: month,
                child: Center(
                  child: Text(
                    month,
                    style: const TextStyle(color: AppColors.secondaryColor),
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedMonth = newValue;
              });
            },
          ),
        ),
      ),
    );
  }
}
