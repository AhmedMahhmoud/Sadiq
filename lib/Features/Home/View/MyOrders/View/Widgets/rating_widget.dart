import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart'; // Make sure to import the appropriate package

class RatingWidget extends StatefulWidget {
  final double initialRating;
  final bool isEnabled;
  const RatingWidget({
    Key? key,
    required this.initialRating,
    required this.isEnabled,
  }) : super(key: key);

  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  double _currentRating = 0;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'التقييم',
            style: widget.isEnabled
                ? AppTextStyle.smallBodyBold
                : AppTextStyle.smallBodyBold
                    .copyWith(color: AppColors.lightGrey),
          ),
          SmoothStarRating(
            rating: _currentRating,
            size: 25,
            filledIconData: Icons.star,
            color: AppColors.secondaryColor,
            borderColor: !widget.isEnabled
                ? AppColors.lightGrey
                : AppColors.secondaryColor,
            halfFilledIconData: Icons.star_half,
            defaultIconData: Icons.star_border,
            starCount: 5,
            allowHalfRating: false,
            spacing: 2.0,
            onRatingChanged: (value) {
              setState(() {
                _currentRating = value;
              });
            },
          )
        ],
      ),
    );
  }
}
