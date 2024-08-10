import 'package:flutter/material.dart';

import '../../../Core/Theme/Colors/app_colors.dart';
import '../../../Core/Theme/text/text_style.dart';

class ContactDetailsCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const ContactDetailsCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 6, bottom: 9),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.secondaryColor.withOpacity(0.2),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 15),
              child: Icon(
                icon,
                color: AppColors.secondaryColor,
                size: 16,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: AppTextStyle.smallBody.copyWith(
                  color: AppColors.secondaryColor.withOpacity(0.5),
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
