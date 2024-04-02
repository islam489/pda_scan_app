 import 'package:dio/dio.dart';
import 'package:pda_scan_app/core/Networking/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor(ApiConstants.tokenvalue);
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor(String token) {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }
// options.headers["accept-language"] = "Bearer $token";

          options.contentType;
          return handler.next(options);
        },
      ),
    );

    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

}