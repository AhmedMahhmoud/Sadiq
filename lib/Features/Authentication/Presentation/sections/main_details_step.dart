import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/CommonData/Models/company_model.dart';
import 'package:sadiq/Core/Constants/api_constants.dart';
import 'package:sadiq/Core/Shared/ui/form/custom_drompdown.dart';
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

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLookupsCubit lookupscubit = context.read<AppLookupsCubit>();
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Form(
          key: authCubit.formKey,
          child: SizedBox(
            child: Column(
              children: [
                Text(
                  'البيانات الاساسية',
                  style: AppTextStyle.largeBodyMedium
                      .copyWith(color: AppColors.primaryColor, fontSize: 24),
                ),
                if (authCubit.choosedType == 0) ...[
                  SizedBox(height: 6.h),
                  CustomDropDown<CompanyModel>(
                    options: lookupscubit.companies,
                    locationIcon: SvgAssetsPaths.company,
                    hintText: 'اختر الشركة',
                    onchange: (p0) {
                      authCubit.setCompanyModel(p0!);
                    },
                    selectedOption: authCubit.companyModel,
                    itemToString: (p0) => p0.name,
                  )
                ],
                SizedBox(height: 6.h),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'الاسم الاول',
                            icon: SvgAssetsPaths.user,
                            initialValue:
                                authCubit.registerInputsBuilder.firstName,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.text,
                            onSaved: (p0) =>
                                authCubit.registerInputsBuilder.firstName = p0!,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextField(
                            hintText: 'اسم العائلة',
                            initialValue:
                                authCubit.registerInputsBuilder.lastName,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.text,
                            onSaved: (p0) =>
                                authCubit.registerInputsBuilder.lastName = p0!,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    CustomTextField(
                      hintText: 'رقم الجوال',
                      onSaved: (p0) =>
                          authCubit.registerInputsBuilder.phone = p0!,
                      initialValue: authCubit.registerInputsBuilder.phone,
                      textInputType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      icon: SvgAssetsPaths.phone,
                    ),
                    SizedBox(height: 6.h),
                    CustomTextField(
                      hintText: 'البريد الالكتروني',
                      initialValue: authCubit.registerInputsBuilder.email,
                      onSaved: (p0) =>
                          authCubit.registerInputsBuilder.email = p0!,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      icon: SvgAssetsPaths.email,
                    ),
                    SizedBox(height: 6.h),
                    CustomTextField(
                      hintText: 'رقم الهوية',
                      initialValue: authCubit.registerInputsBuilder.identityNo,
                      icon: SvgAssetsPaths.iD,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number,
                      onSaved: (p0) =>
                          authCubit.registerInputsBuilder.identityNo = p0!,
                    ),
                    SizedBox(height: 6.h),
                    CustomTextField(
                      hintText: 'الجنسية',
                      icon: SvgAssetsPaths.world,
                      initialValue: authCubit.registerInputsBuilder.nationality,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onSaved: (p0) =>
                          authCubit.registerInputsBuilder.nationality = p0!,
                    ),
                    SizedBox(height: 6.h),
                    CustomTextField(
                      hintText: 'تاريخ الميلاد',
                      icon: SvgAssetsPaths.calender,
                      initialValue: authCubit.registerInputsBuilder.dateofBirth,
                      textInputAction: TextInputAction.done,
                      onSaved: (p0) =>
                          authCubit.registerInputsBuilder.dateofBirth = p0!,
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
                      if (!authCubit.formKey.currentState!.validate()) {
                        return;
                      } else {
                        authCubit.formKey.currentState!.save();
                        authCubit.changeSignUpStep(3);
                      }
                    },
                    title: 'استمر',
                  ),
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
