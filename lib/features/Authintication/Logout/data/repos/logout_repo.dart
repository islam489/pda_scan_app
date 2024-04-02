import 'package:pda_scan_app/core/Helpers/cache_helper.dart';
import 'package:pda_scan_app/core/Networking/api_constants.dart';

import '../../../../../core/Networking/api_error_handler.dart';
import '../../../../../core/Networking/api_result.dart';
import '../../../../../core/Networking/api_service.dart';

import '../models/logout_response.dart';

class LogoutRepo {
  final ApiService _apiService;

  LogoutRepo(this._apiService);

  Future<ApiResult<LogoutResponse>> logout() async {
    try {
      final response = await _apiService.logout();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}