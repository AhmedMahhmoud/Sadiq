import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Shared/ui/buttons/back_btn.dart';
import '../../../Core/Shared/ui/secondary_app_bar.dart';
import '../../../Core/Theme/Colors/app_colors.dart';
import '../../../Core/Theme/text/text_style.dart';
import '../../TermsAndCondictions/widgets/terms_and_policy_card.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SecondaryAppHeader(
          bgColor: Colors.white,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
          ),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(height: 5.h),
                  Text(
                    'سياسة الخصوصية',
                    style: AppTextStyle.headline.copyWith(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const BackBtn(
                height: 35,
                iconSize: 22,
                width: 35,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.64,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: const [
                TermsAndPolicyCard(
                  title: 'شرط ١',
                  description:
                      'موسبيإ ميرول صن نم خسن ىلع اًضيأ توح يتلاو ركيام جياب سودلأ لثم ينورتكلإلا رشنلا جمارب روهظ عم اَرخؤم ىرخأ ةرم رشتنيل داعو ،صنلا اذه نم عطاقم يوحت ةيكيتسالبلا تيسارتيل قئاقر رادصإ عم نرقلا',
                ),
                TermsAndPolicyCard(
                  title: 'شرط ٢',
                  description:
                      'موسبيإ ميرول صن نم خسن ىلع اًضيأ توح يتلاو ركيام جياب سودلأ لثم ينورتكلإلا رشنلا جمارب روهظ عم اَرخؤم ىرخأ ةرم رشتنيل داعو ،صنلا اذه نم عطاقم يوحت ةيكيتسالبلا تيسارتيل قئاقر رادصإ عم نرقلا',
                ),
                TermsAndPolicyCard(
                  title: 'شرط  ٣',
                  description:
                      'موسبيإ ميرول صن نم خسن ىلع اًضيأ توح يتلاو ركيام جياب سودلأ لثم ينورتكلإلا رشنلا جمارب روهظ عم اَرخؤم ىرخأ ةرم رشتنيل داعو ،صنلا اذه نم عطاقم يوحت ةيكيتسالبلا تيسارتيل قئاقر رادصإ عم نرقلا',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
