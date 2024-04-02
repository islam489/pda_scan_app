import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pda_scan_app/core/Helpers/extentions.dart';
import 'package:pda_scan_app/features/Receipt/data/models/get_purchase_order_details_response.dart';
import 'package:pda_scan_app/features/Receipt/logic/cubit/get_purchase_order_details_cubit.dart';
import 'package:pda_scan_app/features/Receipt/logic/cubit/get_purchase_order_details_state.dart';

import '../../../../core/Routing/routes.dart';
import '../../../../core/Theming/color.dart';
import '../../../../core/Theming/styles.dart';

class GetPurchaseOrderListener extends StatelessWidget {

  const GetPurchaseOrderListener({super.key,});
  @override
  Widget build(BuildContext context) {
    return BlocListener<GetPurchaseOrderDetailsCubit, GetPurchaseOrderDetailsState>(
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
          success: (getPurchaseOrderDetailsResponse) {

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