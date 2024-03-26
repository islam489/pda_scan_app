
import 'package:pda_scan_app/features/Receipt/data/models/get_purchase-order-details-request-body.dart';
import 'package:pda_scan_app/features/Receipt/data/models/get_purchase_order_details_response.dart';
import '../../../../core/Networking/api_error_handler.dart';
import '../../../../core/Networking/api_result.dart';
import '../../../../core/Networking/api_service.dart';
class GetPurchaseOrderDetailsRepo {
  final ApiService _apiService;

  GetPurchaseOrderDetailsRepo (this._apiService);

  Future<ApiResult<GetPurchaseOrderDetailsResponse>> getPurchaseOrderDetails(
      GetPurchaseOrderDetailsBody getPurchaseOrderDetailsBody) async {
    try {
      final response = await _apiService.getPurchaseOrderDetails(getPurchaseOrderDetailsBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}