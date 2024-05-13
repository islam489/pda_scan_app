import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:pda_scan_app/features/ConfirmReceiptOrder/data/repos/confirm_receipt_order_repo.dart';
import 'package:pda_scan_app/features/ConfirmReceiptOrder/logic/cubit/confirm_receipt_order_state.dart';

import '../../../Receipt/data/models/get_purchase_order_hive_model.dart';

class ConfirmReceiptOrderCubit extends Cubit<ConfirmReceiptOrderState> {
  final ConfirmReceiptOrderRepo confirmReceiptOrderRepo;

  ConfirmReceiptOrderCubit(this.confirmReceiptOrderRepo)
      : super(const ConfirmReceiptOrderState.initial());

  emitConfirmReceiptOrderStates() async {
    emit(const ConfirmReceiptOrderState.loading());
    var box = await Hive.openBox<List<dynamic>>('Purchases');

    List<dynamic> purchases = box.get('allPurchases') ?? [];

    List<OrderResponse> typedPurchases = purchases.cast<OrderResponse>();

    final response =
        await confirmReceiptOrderRepo.confirmReceiptOrder(typedPurchases);

    response.when(
      success: (orderResponse) async {
        emit(ConfirmReceiptOrderState.success(orderResponse));
      },
      failure: (error) {
        emit(ConfirmReceiptOrderState.error(
            error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
