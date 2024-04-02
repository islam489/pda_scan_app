class ApiConstants {
  static String token = "token";
  static String tokenvalue= "" ;
  // ---------------BaseUrl---------------//
  static const String apiBaseUrl = 'http://78.89.176.218:8000/api/';

  //-----------------Auth-----------------//
  static const String login = 'auth/login';
  static const String logout = 'auth/logout';

  //-----------------Receipt--------------//
  static const String getPurchaseOrderDetails = 'receipt/getPurchaseOrderDetails';
}


class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}