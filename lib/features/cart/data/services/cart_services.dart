import 'package:dio/dio.dart';
import 'package:marketi/core/networking/api_constants.dart';
import 'package:marketi/features/cart/data/models/cart_request_model.dart';
import 'package:marketi/features/cart/data/models/cart_response_model.dart';
import 'package:marketi/features/cart/data/models/get_cart_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CartServices {
  factory CartServices(Dio dio, {String baseUrl}) = _CartServices;

  @GET(ApiConstants.carts)
  Future<GetCartResponseModel> getCartProducts(
    @Header('Authorization') String userToken,
  );

  @POST(ApiConstants.carts)
  Future<CartResponseModel> addProductCart(
    @Header('Authorization') String userToken,
    @Body() CartRequestModel id,
  );
}
