import 'package:dio/dio.dart';
import 'package:pda_scan_app/features/Authintication/Logout/data/models/logout_response.dart';
import 'package:pda_scan_app/features/Receipt/data/models/get_purchase-order-details-request-body.dart';
import 'package:pda_scan_app/features/Receipt/data/models/get_purchase_order_hive_model.dart';
import 'package:retrofit/http.dart';

import '../../features/Authintication/Login/data/models/login_request_body.dart';
import '../../features/Authintication/Login/data/models/login_response.dart';
import '../../features/ConfirmReceiptOrder/data/models/confirm_receipt_order_response.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

// --------------------------------- Auth --------------------------------- //

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.logout)
  Future<LogoutResponse> logout();

// --------------------------------- Receipt --------------------------------- //

  @POST(ApiConstants.getPurchaseOrderDetails)
  Future<OrderResponse> getPurchaseOrderDetails(
    @Body() GetPurchaseOrderDetailsBody getPurchaseOrderDetailsBody,
  );

  //______________________________confirm___________________________________//

  @POST(ApiConstants.confirmReceiptOrder)
  Future<ConfirmReceiptOrderResponse> confirmReceiptOrder(
    @Body() List<OrderResponse> orderResponse,
  );
}
