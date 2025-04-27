class ApiConstants {
  static const String baseUrl = "https://student.valuxapps.com/api/";

  // Registeration

  static const String login = "login";

  static const String forgotPassword = "forgotPassword";

  static const String register = "register";

  // Home

  static const String banners = "banners";

  static const String allProducts = "products";

  static const String categories = "categories";

  static const String categoryProduct = "categories";

  static const String search = "products/search";

  static const String favorites = "favorites";

  static const String carts = "carts";

  static const String primaryKey = 'primaryKey';

  // Profile

  static const String getProfile = "profile";

  static const String updateProfile = "update-profile";

  static const String changePassword = "change-password";

  static const String logout = "logout";
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
