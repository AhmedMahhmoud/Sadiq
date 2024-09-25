import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/CommonData/Models/company_model.dart';
import 'package:sadiq/Core/Regex/regex_handling.dart';
import 'package:sadiq/Core/Shared/ui/buttons/rounded/rounded_button.dart';
import 'package:sadiq/Core/Shared/ui/circular_indicator.dart';
import 'package:sadiq/Core/Shared/ui/form/custom_drompdown.dart';
import 'package:sadiq/Core/Shared/ui/snackbar/custom_snackbar.dart';
import 'package:sadiq/Core/error/error_retry_widget.dart';
import 'package:sadiq/Features/DeliveryCars/View/cubit/carsdelivery_cubit.dart';
import 'package:sadiq/Features/Lookups/cubit/app_lookups_cubit.dart';

import '../../../../Core/Paths/svg_icons_paths.dart';
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
  Widget build(BuildContext context) {
    final AppLookupsCubit lookupscubit = context.read<AppLookupsCubit>();

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Form(
            key: authCubit.formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.61,
                      child: ListView(
                        children: [
                          Center(
                            child: Text(
                              'البيانات الاساسية',
                              style: AppTextStyle.largeBodyMedium.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
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
                            ),
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
                                      initialValue: authCubit
                                          .registerInputsBuilder.firstName,
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.text,
                                      onSaved: (p0) => authCubit
                                          .registerInputsBuilder
                                          .firstName = p0!,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: CustomTextField(
                                      hintText: 'اسم العائلة',
                                      initialValue: authCubit
                                          .registerInputsBuilder.lastName,
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.text,
                                      onSaved: (p0) => authCubit
                                          .registerInputsBuilder.lastName = p0!,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6.h),
                              CustomTextField(
                                hintText: 'كلمة المرور',
                                validator: (p0) {
                                  if (p0!.length < 4) {
                                    return 'كلمة المرور قصيرة';
                                  } else if (authCubit.registerInputsBuilder
                                          .passwordConfirmation !=
                                      null) {
                                    if (authCubit.passwordController.text !=
                                        authCubit
                                            .confirmPasswordController.text) {
                                      return 'كلمة المرور غير متطابقة';
                                    }
                                  }

                                  return null;
                                },
                                onSaved: (p0) => authCubit
                                    .registerInputsBuilder.password = p0!,
                                controller: authCubit.passwordController,
                                obscureText: true,
                                textInputAction: TextInputAction.next,
                                icon: SvgAssetsPaths.password,
                              ),
                              SizedBox(height: 6.h),
                              CustomTextField(
                                hintText: 'تأكيد كلمة المرور',
                                validator: (p0) {
                                  if (p0!.length < 4) {
                                    return 'كلمة المرور قصيرة';
                                  } else if (authCubit
                                          .confirmPasswordController.text !=
                                      authCubit.passwordController.text) {
                                    return 'كلمة المرور غير متطابقة';
                                  }
                                  return null;
                                },
                                onSaved: (p0) => authCubit.registerInputsBuilder
                                    .passwordConfirmation = p0!,
                                controller: authCubit.confirmPasswordController,
                                obscureText: true,
                                textInputAction: TextInputAction.next,
                                icon: SvgAssetsPaths.password,
                              ),
                              SizedBox(height: 6.h),
                              CustomTextField(
                                hintText: 'رقم الجوال',
                                validator: (p0) {
                                  if (!RegexHandling.validatePhoneRegexHandler(
                                      p0!)) {
                                    return 'رقم الجوال غير صالح';
                                  }
                                  return null;
                                },
                                onSaved: (p0) =>
                                    authCubit.registerInputsBuilder.phone = p0!,
                                initialValue:
                                    authCubit.registerInputsBuilder.phone,
                                textInputType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                icon: SvgAssetsPaths.phone,
                              ),
                              SizedBox(height: 6.h),
                              CustomTextField(
                                hintText: 'البريد الالكتروني',
                                validator: (p0) {
                                  if (!RegexHandling.validateEmailRegexHandler(
                                      p0!)) {
                                    return 'البريد الالكتروني غير صالح';
                                  }
                                  return null;
                                },
                                initialValue:
                                    authCubit.registerInputsBuilder.email,
                                onSaved: (p0) =>
                                    authCubit.registerInputsBuilder.email = p0!,
                                textInputType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                icon: SvgAssetsPaths.email,
                              ),
                              SizedBox(height: 6.h),
                              CustomTextField(
                                hintText: 'رقم الهوية',
                                initialValue:
                                    authCubit.registerInputsBuilder.identityNo,
                                icon: SvgAssetsPaths.iD,
                                textInputAction: TextInputAction.next,
                                validator: (p0) {
                                  if (!RegexHandling.validateIdentityCard(
                                      p0!, 'EG')) {
                                    return 'رقم الهوية غير صالح';
                                  }
                                  return null;
                                },
                                textInputType: TextInputType.number,
                                onSaved: (p0) => authCubit
                                    .registerInputsBuilder.identityNo = p0!,
                              ),
                              SizedBox(height: 6.h),
                              CustomTextField(
                                hintText: 'الجنسية',
                                icon: SvgAssetsPaths.world,
                                initialValue:
                                    authCubit.registerInputsBuilder.nationality,
                                textInputType: TextInputType.text,
                                onSaved: (p0) => authCubit
                                    .registerInputsBuilder.nationality = p0!,
                              ),
                              SizedBox(height: 6.h),
                              InkWell(
                                onTap: () {
                                  BottomPicker.date(
                                    pickerTitle: const Text('تاريخ الميلاد'),
                                    dateOrder: DatePickerDateOrder.dmy,
                                    initialDateTime: DateTime(1996, 10, 22),
                                    maxDateTime: DateTime.now(),
                                    minDateTime: DateTime(1980),
                                    pickerTextStyle: const TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    buttonContent: const Center(
                                      child: Text(
                                        'تأكيد',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    buttonStyle: BoxDecoration(
                                      color: AppColors.secondaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    onChange: (index) {
                                      print(index);
                                    },
                                    onSubmit: (index) {
                                      authCubit.registerInputsBuilder
                                              .dateofBirth =
                                          DateFormat('yyyy-MM-dd')
                                              .format(index)
                                              .toString();

                                      authCubit.birthdateController.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(index)
                                              .toString();
                                    },
                                    bottomPickerTheme:
                                        BottomPickerTheme.plumPlate,
                                  ).show(context);
                                },
                                child: CustomTextField(
                                  hintText: 'تاريخ الميلاد',
                                  icon: SvgAssetsPaths.calender,
                                  controller: authCubit.birthdateController,
                                  isEnabled: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    BlocConsumer<CarsdeliveryCubit, CarsdeliveryState>(
                      listener: (context, state) {
                        if (state is CarsLoadedState) {
                          authCubit.changeSignUpStep(3);
                        } else if (state is CarsErrorState) {
                          CustomSnackbar.show(context, state.error,
                              isError: true);
                        }
                      },
                      builder: (context, state) {
                        return state is CarsLoadingState
                            ? const CustomCircularIndicator()
                            : state is CarsErrorState
                                ? RetryWidget(retryFunction: () {
                                    context.read<CarsdeliveryCubit>().getCars();
                                  })
                                : Center(
                                    child: RoundedButton(
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      onPressed: () {
                                        if (!authCubit.formKey.currentState!
                                            .validate()) {
                                          return;
                                        } else {
                                          authCubit.formKey.currentState!
                                              .save();
                                          context
                                              .read<CarsdeliveryCubit>()
                                              .getCars();
                                        }
                                      },
                                      title: 'استمر',
                                    ),
                                  );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
