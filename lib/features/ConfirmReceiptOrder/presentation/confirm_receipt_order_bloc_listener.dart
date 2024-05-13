import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pda_scan_app/core/Helpers/extentions.dart';

import '../../../core/Theming/color.dart';
import '../../../core/Theming/styles.dart';
import '../logic/cubit/confirm_receipt_order_cubit.dart';
import '../logic/cubit/confirm_receipt_order_state.dart';

class ConfirmReceiptOrderBlocListener extends StatelessWidget {
  const ConfirmReceiptOrderBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfirmReceiptOrderCubit, ConfirmReceiptOrderState>(
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
          success: (orderResponse) {
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
                  "Success",
                  style: TextStyles.font14DarkBlueMedium,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      "Order was delivred success",
                      style: TextStyles.font13BlueSemiBold,
                    ),
                  ),
                ],
              ),
            );
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
                      'Confirm Receipt Order Error',
                      style: TextStyles.font13BlueSemiBold,
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
