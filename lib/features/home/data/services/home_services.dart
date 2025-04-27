import 'package:dio/dio.dart';
import 'package:marketi/core/networking/api_constants.dart';
import 'package:marketi/features/home/data/models/banner_response_model.dart';
import 'package:marketi/features/home/data/models/categories_response_model.dart';
import 'package:marketi/features/home/data/models/product_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeServices {
  factory HomeServices(Dio dio, {String baseUrl}) = _HomeServices;

  @GET(ApiConstants.banners)
  Future<BannerResponseModel> getBanners();

  @GET(ApiConstants.categories)
  Future<CategoriesResponseModel> getCategories();

  @GET(ApiConstants.allProducts)
  Future<ProductResponseModel> getAllProducts();

  @GET("${ApiConstants.categoryProduct}/{id}")
  Future<ProductResponseModel> getCategoryById(@Path("id") int id);

  @POST(ApiConstants.search)
  Future<ProductResponseModel> searchForProduct(
    @Query("text") String text,
  );
}
