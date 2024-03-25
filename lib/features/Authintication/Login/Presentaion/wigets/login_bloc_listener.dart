import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pda_scan_app/core/Helpers/extentions.dart';

import '../../../../../core/Routing/routes.dart';
import '../../../../../core/Theming/color.dart';
import '../../../../../core/Theming/styles.dart';
import '../../logic/cubit/login_cubit.dart';
import '../../logic/cubit/login_state.dart';
class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainBlue,
                ),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            context.pop();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                icon: const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 32,
                ),
                content: Text(
                  error,
                  style: TextStyles.font14DarkBlueMedium,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      'Got it',
                      style: TextStyles.font13BlueSemiBold ,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}