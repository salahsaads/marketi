import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:marketi/core/networking/api_constants.dart';
import 'package:marketi/features/auth/data/models/auth_response_model.dart';
import 'package:marketi/features/auth/data/models/login_request_body.dart';
import 'package:marketi/features/auth/data/models/register_request_body.dart';

part 'auth_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthServices {
  factory AuthServices(Dio dio, {String baseUrl}) = _AuthServices;

  @POST(ApiConstants.login)
  Future<AuthResponseModel> loginWithEmailPassword(
      @Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.register)
  Future<AuthResponseModel> registerWithEmailPassword(
      @Body() RegisterRequestBody registerRequestBody);
}
