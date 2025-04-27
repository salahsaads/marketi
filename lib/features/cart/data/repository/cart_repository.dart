import 'package:marketi/core/cache/shared_pref_helper.dart';
import 'package:marketi/core/cache/shared_pref_keys.dart';
import 'package:marketi/core/networking/api_result.dart';
import 'package:marketi/features/cart/data/models/cart_request_model.dart';
import 'package:marketi/features/cart/data/models/cart_response_model.dart';
import 'package:marketi/features/cart/data/models/get_cart_response_model.dart';
import 'package:marketi/features/cart/data/services/cart_services.dart';

class CartRepository {
  final CartServices _cartServices;

  CartRepository(this._cartServices);

  Future<ApiResult<GetCartResponseModel>> getCartProducts() async {
    try {
      final response = await _cartServices
          .getCartProducts(CacheHelper.getData(key: userToken));

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<CartResponseModel>> addProductCart(
      CartRequestModel cartRequestModel) async {
    try {
      final response = await _cartServices.addProductCart(
        CacheHelper.getData(key: userToken),
        cartRequestModel,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
