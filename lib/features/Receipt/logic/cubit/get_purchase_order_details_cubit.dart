import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pda_scan_app/features/Receipt/data/models/get_purchase-order-details-request-body.dart';
import 'package:pda_scan_app/features/Receipt/data/repos/get_purchase_order_details_repo.dart';
import 'package:pda_scan_app/features/Receipt/logic/cubit/get_purchase_order_details_state.dart';
class GetPurchaseOrderDetailsCubit extends Cubit<GetPurchaseOrderDetailsState> {
  final GetPurchaseOrderDetailsRepo _getPurchaseOrderDetailsRepo;
  TextEditingController poNumberController = TextEditingController();

  GetPurchaseOrderDetailsCubit(this._getPurchaseOrderDetailsRepo) : super(const GetPurchaseOrderDetailsState.initial());

  void emitLoginStates() async {
    emit(const GetPurchaseOrderDetailsState.loading());
    final response = await _getPurchaseOrderDetailsRepo.getPurchaseOrderDetails(
        GetPurchaseOrderDetailsBody(
          poNumber:poNumberController.text,
        )
    );
    response.when(
      success: (getPurchaseOrderDetailsResponse) {
        emit(GetPurchaseOrderDetailsState.success(getPurchaseOrderDetailsResponse));
      },
      failure: (error) {
        emit(GetPurchaseOrderDetailsState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}