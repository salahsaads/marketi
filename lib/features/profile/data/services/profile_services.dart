import 'package:dio/dio.dart';
import 'package:marketi/features/profile/data/models/change_password_request_model.dart';
import 'package:marketi/features/profile/data/models/change_password_response_model.dart';
import 'package:marketi/features/profile/data/models/logout_response_model.dart';
import 'package:marketi/features/profile/data/models/update_request_body.dart';
import 'package:retrofit/retrofit.dart';

import 'package:marketi/core/networking/api_constants.dart';
import 'package:marketi/features/auth/data/models/auth_response_model.dart';

part 'profile_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProfileServices {
  factory ProfileServices(Dio dio, {String baseUrl}) = _ProfileServices;

  @GET(ApiConstants.getProfile)
  Future<AuthResponseModel> getProfileData(
    @Header('Authorization') String token,
  );

  @PUT(ApiConstants.updateProfile)
  Future<AuthResponseModel> updateProfileData(
    @Header('Authorization') String userToken,
    @Body() UpdateRequestBody updateRequestBody,
  );

  @POST(ApiConstants.logout)
  Future<LogoutResponseModel> logoutUser(
    @Header('Authorization') String userToken,
  );

  @POST(ApiConstants.changePassword)
  Future<ChangePasswordResponseModel> changePassword(
    @Header('Authorization') String userToken,
    @Body() ChangePasswordRequestModel changePasswordRequestModel,
  );
}
