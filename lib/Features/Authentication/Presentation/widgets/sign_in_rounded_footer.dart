import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Paths/svg_icons_paths.dart';
import '../../../../Core/Shared/ui/buttons/rounded/rounded_button.dart';
import '../../../../Core/Shared/ui/form/custom_text_field.dart';
import '../../../../Core/Shared/ui/loading.dart';
import '../../../../Core/Shared/ui/snackbar_helper.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';
import '../../../../Core/Theme/text/text_style.dart';
import '../cubit/auth_cubit.dart';
import 'login_checkmark.dart';

class SignInRoundedFooter extends StatelessWidget {
  const SignInRoundedFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailC = TextEditingController(), passwordC = TextEditingController();

    return BlocConsumer<AuthCubit, AuthState>(
      listener: authenticationBlocListener,
      builder: (context, state) {
        final authCubit = context.read<AuthCubit>();
        return Container(
          padding: EdgeInsets.only(bottom: 35.h),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: emailC,
                          hintText: 'اسم المستخدم / الايميل',
                          textInputType: TextInputType.emailAddress,
                          icon: SvgAssetsPaths.user,
                          validator: (value) {
                            String pattern = r'[@.]';
                            RegExp regExp = RegExp(pattern);
                            if (value!.isEmpty) {
                              return 'هذا الحقل مطلوب';
                            } else if (!regExp.hasMatch(value)) {
                              return 'بريد إلكتروني غير صحيح';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 6.h),
                        CustomTextField(
                          controller: passwordC,
                          hintText: 'كلمة المرور',
                          icon: SvgAssetsPaths.lock,
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'هذا الحقل مطلوب';
                            }
                            return null;
                          },
                          onFieldSubmitted: (v) {
                            if (formKey.currentState!.validate()) {
                              FocusScope.of(context).unfocus();
                              authCubit.signin(
                                  email: emailC.text.trim(),
                                  password: passwordC.text);
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 25.h,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const LoginCheckmark(),
                            SizedBox(width: 5.w),
                            Text(
                              'تذكرني',
                              style: AppTextStyle.smallBody
                                  .copyWith(color: AppColors.secondaryColor),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'هل نسيت كلمة المرور؟',
                        style: AppTextStyle.smallBody.copyWith(
                            color: AppColors.secondaryColor,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                    child: state is AuthLoginLoadingState
                        ? const Loading()
                        : RoundedButton(
                            title: 'تسجيل الدخول',
                            style: AppTextStyle.smallBodyBold.copyWith(
                              color: Colors.white,
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                authCubit.signin(
                                    email: emailC.text.trim(),
                                    password: passwordC.text);
                              }
                              /*Navigator.pushNamed(
                                context,
                                '/setting',
                                arguments: true,
                              );*/
                              if (state is AuthLoginSuccessState) {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/home', (route) => false);
                              }
                            },
                          ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      'ليس لديك حساب؟',
                      style: AppTextStyle.smallBody
                          .copyWith(color: AppColors.secondaryColor),
                    ),
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, '/signup'),
                    child: Center(
                      child: Text(
                        'اطلب انشاء حساب',
                        style: AppTextStyle.smallBodyBold.copyWith(
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

void authenticationBlocListener(BuildContext context, AuthState state) {
  if (state is AuthLoginErrorState) {
    SnackBarHelper.showErrorSnackBar(context, state.errorMsg);
  }
}
