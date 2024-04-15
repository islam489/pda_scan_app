import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pda_scan_app/features/Receipt/data/models/get_purchase-order-details-request-body.dart';
import 'package:pda_scan_app/features/Receipt/data/repos/get_purchase_order_details_repo.dart';
import 'package:pda_scan_app/features/Receipt/logic/cubit/get_purchase_order_details_state.dart';

import '../../data/models/get_purchase_order_details_response.dart';
class GetPurchaseOrderDetailsCubit extends Cubit<GetPurchaseOrderDetailsState> {
  final GetPurchaseOrderDetailsRepo _getPurchaseOrderDetailsRepo;
  TextEditingController poNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  GetPurchaseOrderDetailsResponse? result;
  List<OrderItems>? orderItems;

  GetPurchaseOrderDetailsCubit(this._getPurchaseOrderDetailsRepo) : super(const GetPurchaseOrderDetailsState.initial());

  void emitGetPurchaseOrderDetailsStates() async {
    emit(const GetPurchaseOrderDetailsState.loading());
    final response = await _getPurchaseOrderDetailsRepo.getPurchaseOrderDetails(
        GetPurchaseOrderDetailsBody(
          poNumber:poNumberController.text,
        )
    );
    response.when(
      success: (getPurchaseOrderDetailsResponse) {
        result = getPurchaseOrderDetailsResponse;
        orderItems?.clear();
        orderItems = getPurchaseOrderDetailsResponse.orderItems!;
        print("orderItems!.length");
        print(orderItems!.length);
        emit(GetPurchaseOrderDetailsState.success(getPurchaseOrderDetailsResponse));
        },
      failure: (error) {
        emit(GetPurchaseOrderDetailsState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}