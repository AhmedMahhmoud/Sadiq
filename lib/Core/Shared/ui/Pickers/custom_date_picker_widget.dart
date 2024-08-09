import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Core/extenstions/date_extenstion.dart'; // Ensure you have this package or adjust accordingly

class CustomDatePickerButton extends StatefulWidget {
  final String title;
  final DateTime? initialDate;

  const CustomDatePickerButton({
    required this.title,
    this.initialDate,
    Key? key,
  }) : super(key: key);

  @override
  CustomDatePickerButtonState createState() => CustomDatePickerButtonState();
}

class CustomDatePickerButtonState extends State<CustomDatePickerButton> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate ?? DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      helpText: widget.title,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            canvasColor: AppColors.secondaryColor,
            colorScheme:
                const ColorScheme.light(primary: AppColors.secondaryColor),
            datePickerTheme: DatePickerThemeData(
              backgroundColor: Colors.white,
              dividerColor: AppColors.primaryColor,
              headerBackgroundColor: AppColors.secondaryColor,
              headerForegroundColor: Colors.white,
              cancelButtonStyle: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'DIN',
                  ),
                ),
              ),
              confirmButtonStyle: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'DIN',
                  ),
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        width: 120,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 1,
            color: AppColors.secondayColorWithOpacity,
          ),
          color: AppColors.primaryColor.withOpacity(0.05),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: AppTextStyle.caption.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Text(
                    _selectedDate.toYMD(), // Format as needed
                    style: AppTextStyle.caption,
                  ),
                ],
              ),
              SvgPicture.asset(
                  SvgAssetsPaths.arrowDown), // Adjust asset path as needed
            ],
          ),
        ),
      ),
    );
  }
}
