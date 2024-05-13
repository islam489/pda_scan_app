import 'package:pda_scan_app/features/ConfirmReceiptOrder/data/models/confirm_receipt_order_response.dart';

import '../../../../core/Networking/api_error_handler.dart';
import '../../../../core/Networking/api_result.dart';
import '../../../../core/Networking/api_service.dart';
import '../../../Receipt/data/models/get_purchase_order_hive_model.dart';

class ConfirmReceiptOrderRepo {
  final ApiService _apiService;

  ConfirmReceiptOrderRepo(this._apiService);

  Future<ApiResult<ConfirmReceiptOrderResponse>> confirmReceiptOrder(
      List<OrderResponse> orderResponse) async {
    try {
      final response = await _apiService.confirmReceiptOrder(orderResponse);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
