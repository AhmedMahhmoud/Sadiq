import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';

class CustomDropdownButton extends StatefulWidget {
  final String title;
  final List<String> items;
  String? initialValue;

  CustomDropdownButton({
    required this.title,
    required this.items,
    this.initialValue,
    Key? key,
  }) : super(key: key);

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  void initState() {
    super.initState();
  }

  void _openDropdown(BuildContext context) async {
    final String? selected = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SizedBox(
            width: 300,
            height: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: widget.items.map((String item) {
                      return ListTile(
                        title: Text(item),
                        onTap: () {
                          Navigator.of(context).pop(item);
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (selected != null && selected != widget.initialValue) {
      setState(() {
        widget.initialValue = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openDropdown(context),
      child: Container(
        width: 110,
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
                    widget.initialValue!,
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
