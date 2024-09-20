import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Core/Shared/ui/buttons/radio/check_mark.dart';
import 'package:sadiq/Features/Authentication/Presentation/cubit/auth_cubit.dart';

class LoginCheckmark extends StatelessWidget {
  const LoginCheckmark({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final authCubit = context.read<AuthCubit>();
        return CustomCheckMark(
          enabled: authCubit.rememberMe,
          onChanged: () {
            authCubit.setRememberMe();
          },
        );
      },
    );
  }
}
