import 'package:flutter/material.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';

class CustomSnackbar {
  static void show(BuildContext context, String message,
      {bool isError = false}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            backgroundColor: isError
                ? AppColors.errorColor
                : Colors.green, // Customize background color
            duration: const Duration(seconds: 3), // Adjust duration as needed
            behavior: SnackBarBehavior.floating, // Customize behavior if needed
          ),
        )
        .closed
        .then((value) {
      if (context.mounted) ScaffoldMessenger.of(context).clearSnackBars();
    });
  }
}
