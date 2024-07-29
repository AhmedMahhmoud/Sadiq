import 'package:flutter/material.dart';

import '../../../Theme/Colors/app_colors.dart';
import '../../../Theme/text/text_style.dart';

class UploadFileBtn extends StatelessWidget {
  const UploadFileBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.fieldsBGfillColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.secondaryColor.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.file_upload_outlined,
                    color: AppColors.secondaryColor,
                  ),
                  Text(
                    'ارفع الملف',
                    style: AppTextStyle.smallBodyBold
                        .copyWith(color: AppColors.secondaryColor),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: const BoxDecoration(
                color: AppColors.fieldsBGfillColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Text(
                'اسم الملف.pdf',
                style: AppTextStyle.smallBodyBold.copyWith(
                  color: AppColors.secondaryColor.withOpacity(0.3),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
