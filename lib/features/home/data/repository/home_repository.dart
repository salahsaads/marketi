import 'package:marketi/core/networking/api_result.dart';
import 'package:marketi/features/home/data/models/banner_response_model.dart';
import 'package:marketi/features/home/data/models/categories_response_model.dart';
import 'package:marketi/features/home/data/models/product_response_model.dart';
import 'package:marketi/features/home/data/services/home_services.dart';

class HomeRepository {
  final HomeServices _homeServices;

  HomeRepository(this._homeServices);

  Future<ApiResult<BannerResponseModel>> getBanners() async {
    try {
      final result = await _homeServices.getBanners();

      return ApiResult.success(result);
    } catch (message) {
      return ApiResult.failure(message.toString());
    }
  }

  Future<ApiResult<CategoriesResponseModel>> getCategories() async {
    try {
      final result = await _homeServices.getCategories();

      return ApiResult.success(result);
    } catch (message) {
      return ApiResult.failure(message.toString());
    }
  }

  Future<ApiResult<ProductResponseModel>> getCategoryById(int id) async {
    try {
      final result = await _homeServices.getCategoryById(id);

      return ApiResult.success(result);
    } catch (message) {
      return ApiResult.failure(message.toString());
    }
  }

  Future<ApiResult<ProductResponseModel>> getAllProducts() async {
    try {
      final result = await _homeServices.getAllProducts();

      return ApiResult.success(result);
    } catch (message) {
      return ApiResult.failure(message.toString());
    }
  }

  Future<ApiResult<ProductResponseModel>> searchForProduct(String text) async {
    try {
      final result = await _homeServices.searchForProduct(text);

      return ApiResult.success(result);
    } catch (message) {
      return ApiResult.failure(message.toString());
    }
  }
}
