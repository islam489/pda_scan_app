import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/Helpers/spacing.dart';
import '../../../../../core/Theming/styles.dart';
import '../../../../../core/Wigets/app_text_button.dart';
import '../../logic/cubit/logout_cubit.dart';
import '../wigets/logout_bloc_listener.dart';
class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    verticalSpace(24),
                    AppTextButton(
                      buttonText: "Logout",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        DoLogout(context);
                      },
                    ),
                    const LogoutBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void DoLogout(BuildContext context) {
      context.read<LogoutCubit>().emitLoginStates();
    }


}