import 'package:flutter/material.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';

class RetryWidget extends StatefulWidget {
  final Function retryFunction;

  const RetryWidget({Key? key, required this.retryFunction}) : super(key: key);

  @override
  RetryWidgetState createState() => RetryWidgetState();
}

class RetryWidgetState extends State<RetryWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              widget.retryFunction();
            },
            child: const Column(
              children: [
                Text(
                  'Tap to Retry',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: 5),
                Icon(
                  Icons.refresh,
                  size: 40,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
