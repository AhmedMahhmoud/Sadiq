import 'dart:developer';
import 'dart:io';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sadiq/Core/CommonData/Models/my_profile_singelton.dart';
import 'package:sadiq/Core/Constants/api_constants.dart';
import 'package:sadiq/Core/Regex/regex_handling.dart';
import 'package:sadiq/Core/Shared/ui/circular_indicator.dart';
import 'package:sadiq/Core/Shared/ui/secondary_app_bar.dart';
import 'package:sadiq/Core/Shared/ui/snackbar/custom_snackbar.dart';
import 'package:sadiq/Features/Profile/View/cubit/profile_cubit.dart';

import '../../../../Core/Paths/svg_icons_paths.dart';
import '../../../../Core/Shared/ui/buttons/back_btn.dart';
import '../../../../Core/Shared/ui/buttons/rounded/rounded_button.dart';
import '../../../../Core/Shared/ui/form/custom_text_field.dart';
import '../../../../Core/Shared/ui/images/svg_display.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';
import '../../../../Core/Theme/text/text_style.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  late ProfileCubit profileCubit;
  pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageFile = File(image.path);
      profileCubit.updateProfileInputs.avatar = imageFile;
      setState(() {});
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? imageFile;
  @override
  void initState() {
    super.initState();
    imageFile = null;
    profileCubit = BlocProvider.of<ProfileCubit>(context);
    profileCubit.fillProfileInputs();
    print("init state called");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SecondaryAppHeader(
              bgColor: AppColors.iconsBackgroundColor.withOpacity(0.1),
            ),
            BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                inspect(state);
                log(state.toString());
                if (state.errorMsg != '') {
                  CustomSnackbar.show(context, state.errorMsg!, isError: true);
                } else if (state.isProfileCompleted) {
                  CustomSnackbar.show(
                    context,
                    'تم تحديث الملف الشخصي',
                  );
                }
              },
              builder: (context, state) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height - 20.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 23.h, horizontal: 70.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => pickImage(),
                              child: imageFile == null &&
                                      state.driver?.avatar == ''
                                  ? const SvgDisplay(
                                      path: SvgAssetsPaths.profile,
                                      size: Size(116, 116),
                                    )
                                  : imageFile != null
                                      ? CircleAvatar(
                                          radius: 50,
                                          backgroundImage:
                                              FileImage(imageFile!),
                                        )
                                      : CircleAvatar(
                                          radius: 50,
                                          backgroundImage: NetworkImage(
                                              state.driver!.avatar),
                                        ),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SvgDisplay(
                                  path: SvgAssetsPaths.camera,
                                  size: Size(16, 16),
                                ),
                                Text(
                                  ' حمل الصورة',
                                  style: AppTextStyle.caption
                                      .copyWith(color: AppColors.primaryColor),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            CustomTextField(
                              hintText: 'الأسم الأول',
                              controller: profileCubit.firstNameContr,
                              onSaved: (p0) {
                                profileCubit.updateProfileInputs.firstName =
                                    p0!;
                              },
                              icon: SvgAssetsPaths.user,
                              iconColor:
                                  AppColors.secondaryColor.withOpacity(0.5),
                              bGColor: AppColors.primaryColor.withOpacity(0.04),
                            ),
                            SizedBox(height: 6.h),
                            CustomTextField(
                              hintText: 'الأسم الأخير',
                              controller: profileCubit.lastNameContr,
                              onSaved: (p0) {
                                profileCubit.updateProfileInputs.secondName =
                                    p0!;
                              },
                              icon: SvgAssetsPaths.user,
                              iconColor:
                                  AppColors.secondaryColor.withOpacity(0.5),
                              bGColor: AppColors.primaryColor.withOpacity(0.04),
                            ),
                            SizedBox(height: 6.h),
                            CustomTextField(
                              hintText: 'رقم الجوال',
                              controller: profileCubit.phoneContr,
                              icon: SvgAssetsPaths.phone,
                              validator: (p0) {
                                if (!RegexHandling.validatePhoneRegexHandler(
                                    p0!)) {
                                  return 'رقم الجوال غير صالح';
                                }
                                return null;
                              },
                              onSaved: (p0) {
                                profileCubit.updateProfileInputs.phone = p0!;
                              },
                              iconColor:
                                  AppColors.secondaryColor.withOpacity(0.5),
                              bGColor: AppColors.primaryColor.withOpacity(0.04),
                            ),
                            SizedBox(height: 6.h),
                            CustomTextField(
                              hintText: 'البريد الالكتروني',
                              controller: profileCubit.mailContr,
                              validator: (p0) {
                                if (!RegexHandling.validateEmailRegexHandler(
                                    p0!)) {
                                  return 'البريد الالكتروني غير صالح';
                                }
                                return null;
                              },
                              icon: SvgAssetsPaths.email,
                              onSaved: (p0) {
                                profileCubit.updateProfileInputs.email = p0!;
                              },
                              iconColor:
                                  AppColors.secondaryColor.withOpacity(0.5),
                              bGColor: AppColors.primaryColor.withOpacity(0.04),
                            ),
                            SizedBox(height: 6.h),
                            InkWell(
                              onTap: () {
                                BottomPicker.date(
                                  pickerTitle: const Text('تاريخ الميلاد'),
                                  dateOrder: DatePickerDateOrder.dmy,
                                  initialDateTime: DateTime.parse(profileCubit
                                      .updateProfileInputs.birthdate),
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
                                  onSubmit: (index) {
                                    final datestring = DateFormat('yyyy-MM-dd')
                                        .format(index)
                                        .toString();
                                    profileCubit.updateProfileInputs.birthdate =
                                        datestring;
                                    profileCubit.birthContr.text = datestring;
                                    setState(() {});
                                  },
                                  bottomPickerTheme:
                                      BottomPickerTheme.plumPlate,
                                ).show(context);
                              },
                              child: CustomTextField(
                                hintText: 'تاريخ الميلاد',
                                isEnabled: false,
                                controller: profileCubit.birthContr,
                                icon: SvgAssetsPaths.calender,
                                iconColor:
                                    AppColors.secondaryColor.withOpacity(0.5),
                                bGColor:
                                    AppColors.primaryColor.withOpacity(0.04),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            state.isLoading
                                ? const CustomCircularIndicator()
                                : RoundedButton(
                                    title: 'حفظ',
                                    onPressed: () {
                                      if (!_formKey.currentState!.validate()) {
                                        return;
                                      } else {
                                        _formKey.currentState!.save();
                                        profileCubit.updateProfile();
                                      }
                                    },
                                    width: 112,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    iconWidget: const Icon(
                                      Icons.check_circle_rounded,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  )
                          ],
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.sizeOf(context).height * 0.03,
                        left: 10.w,
                        child: const BackBtn(
                          height: 35,
                          iconSize: 22,
                          width: 35,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
