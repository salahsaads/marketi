import 'package:marketi/core/cache/shared_pref_helper.dart';
import 'package:marketi/core/cache/shared_pref_keys.dart';
import 'package:marketi/core/networking/api_result.dart';
import 'package:marketi/features/auth/data/models/auth_response_model.dart';
import 'package:marketi/features/profile/data/models/change_password_request_model.dart';
import 'package:marketi/features/profile/data/models/change_password_response_model.dart';
import 'package:marketi/features/profile/data/models/logout_response_model.dart';
import 'package:marketi/features/profile/data/models/update_request_body.dart';
import 'package:marketi/features/profile/data/services/profile_services.dart';

class ProfileRepository {
  final ProfileServices _profileServices;
  ProfileRepository(this._profileServices);

  Future<ApiResult<AuthResponseModel>> getProfile() async {
    try {
      final result = await _profileServices
          .getProfileData(CacheHelper.getData(key: userToken));

      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<AuthResponseModel>> updateProfile(
      UpdateRequestBody updateRequestBody) async {
    try {
      final result = await _profileServices.updateProfileData(
        CacheHelper.getData(key: userToken),
        updateRequestBody,
      );

      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<LogoutResponseModel>> logoutUser() async {
    try {
      final result = await _profileServices
          .logoutUser(CacheHelper.getData(key: userToken));

      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<ChangePasswordResponseModel>> changePassword(
      ChangePasswordRequestModel changePasswordRequestModel) async {
    try {
      final result = await _profileServices.changePassword(
        CacheHelper.getData(key: userToken),
        changePasswordRequestModel,
      );

      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
