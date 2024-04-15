import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pda_scan_app/core/Helpers/extentions.dart';

import '../../../../../core/Helpers/cache_helper.dart';
import '../../../../../core/Networking/api_constants.dart';
import '../../../../../core/Routing/routes.dart';
import '../../../../../core/Theming/color.dart';
import '../../../../../core/Theming/styles.dart';
import '../../logic/cubit/logout_cubit.dart';
import '../../logic/cubit/logout_state.dart';
class LogoutBlocListener extends StatelessWidget {
  const LogoutBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
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
          success: (logoutResponse) {

            context.pop();
            context.pushReplacementNamed(Routes.loginScreen);
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
                      'Logout error',
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