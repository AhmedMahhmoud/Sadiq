import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Theme/Colors/app_colors.dart';
import '../../../../Core/Theme/text/text_style.dart';
import '../../../Home/View/Widgets/appbar_header.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            width: MediaQuery.sizeOf(context).width,
            color: Colors.white,
            child: Center(
              child: Text(
                'الدعم والمساعدة',
                style: AppTextStyle.headline.copyWith(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
            child: Column(
              children: [
                ChatBubble(
                  clipper: ChatBubbleClipper6(type: BubbleType.receiverBubble),
                  backGroundColor: AppColors.primaryColor.withOpacity(0.2),
                  margin: const EdgeInsets.only(top: 20),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    color: Colors.transparent,
                    child: const Text(
                      'موسبيإ ميرول صن نم خسن ىلع اًضيأ توح يتلا',
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ),
                ChatBubble(
                  alignment: Alignment.centerRight,
                  clipper: ChatBubbleClipper6(type: BubbleType.sendBubble),
                  backGroundColor: AppColors.secondaryColor,
                  margin: const EdgeInsets.only(top: 20),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    color: Colors.transparent,
                    child: const Text(
                      'موسبيإ ميرول صن نم خسن ىلع اًضيأ توح يتلا',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: AppColors.secondaryColor.withOpacity(0.3),
              ),
            ),
            child: TextFormField(
              cursorColor: AppColors.secondaryColor,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                hintText: "اكتب هنا....",
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: AppColors.secondaryColor.withOpacity(0.4),
                ),
                suffixIcon: const Icon(
                  Icons.send,
                  color: AppColors.secondaryColor,
                  size: 30,
                ),
              ),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
