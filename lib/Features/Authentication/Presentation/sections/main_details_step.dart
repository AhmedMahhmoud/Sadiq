import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/CommonData/Models/company_model.dart';
import 'package:sadiq/Core/Shared/ui/form/custom_drompdown.dart';
import 'package:sadiq/Core/Shared/ui/snackbar/custom_snackbar.dart';
import 'package:sadiq/Features/Lookups/cubit/app_lookups_cubit.dart';

import '../../../../Core/Paths/svg_icons_paths.dart';
import '../../../../Core/Shared/ui/buttons/rounded/rounded_button.dart';
import '../../../../Core/Shared/ui/form/custom_text_field.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';
import '../../../../Core/Theme/text/text_style.dart';
import '../cubit/auth_cubit.dart';

class MainDetailsStep extends StatefulWidget {
  const MainDetailsStep({super.key});

  @override
  State<MainDetailsStep> createState() => _MainDetailsStepState();
}

late AuthCubit authCubit;

class _MainDetailsStepState extends State<MainDetailsStep> {
  @override
  void initState() {
    authCubit = context.read<AuthCubit>();
    if (authCubit.choosedType == 0) {
      context.read<AppLookupsCubit>().getCompaniesFromMixin();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return SizedBox(
          child: Column(
            children: [
              Text(
                'البيانات الاساسية',
                style: AppTextStyle.largeBodyMedium
                    .copyWith(color: AppColors.primaryColor, fontSize: 24),
              ),
              if (authCubit.choosedType == 0) ...[
                SizedBox(height: 6.h),
                BlocConsumer<AppLookupsCubit, AppLookupsState>(
                  buildWhen: (previous, current) =>
                      previous is CompaniesLookupsLoadingState ||
                      current is CompaniesLookupsLoadingState,
                  listenWhen: (previous, current) =>
                      previous is CompaniesLookupsLoadingState ||
                      current is CompaniesLookupsLoadingState,
                  listener: (context, state) {
                    if (state is AppLookupsErrorState) {
                      CustomSnackbar.show(context, state.errorMsg,
                          isError: true);
                    }
                  },
                  builder: (context, state) {
                    final lookupcubit = context.read<AppLookupsCubit>();
                    return state is CompaniesLookupsLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : CustomDropDown<CompanyModel>(
                            options: lookupcubit.companies,
                            locationIcon: SvgAssetsPaths.company,
                            hintText: 'اختر الشركة',
                            onchange: (p0) {
                              authCubit.companyModel = p0;
                              setState(() {});
                            },
                            selectedOption: authCubit.companyModel,
                            itemToString: (p0) => p0.name,
                          );
                  },
                ),
              ],
              SizedBox(height: 6.h),
              Column(
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hintText: 'الاسم الاول',
                          icon: SvgAssetsPaths.user,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomTextField(
                          hintText: 'اسم العائلة',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  const CustomTextField(
                    hintText: 'رقم الجوال',
                    icon: SvgAssetsPaths.phone,
                  ),
                  SizedBox(height: 6.h),
                  const CustomTextField(
                    hintText: 'البريد الالكتروني',
                    icon: SvgAssetsPaths.email,
                  ),
                  SizedBox(height: 6.h),
                  const CustomTextField(
                    hintText: 'رقم الهوية',
                    icon: SvgAssetsPaths.iD,
                  ),
                  SizedBox(height: 6.h),
                  const CustomTextField(
                    hintText: 'الجنسية',
                    icon: SvgAssetsPaths.world,
                  ),
                  SizedBox(height: 6.h),
                  const CustomTextField(
                    hintText: 'تاريخ الميلاد',
                    icon: SvgAssetsPaths.calender,
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Center(
                child: RoundedButton(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  onPressed: () {
                    authCubit.changeSignUpStep(3);
                  },
                  title: 'استمر',
                ),
              ),
              SizedBox(height: 5.h),
            ],
          ),
        );
      },
    );
  }
}
