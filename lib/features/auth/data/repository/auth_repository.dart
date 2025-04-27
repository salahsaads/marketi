import 'package:marketi/core/networking/api_result.dart';
import 'package:marketi/features/auth/data/models/auth_response_model.dart';
import 'package:marketi/features/auth/data/models/login_request_body.dart';
import 'package:marketi/features/auth/data/models/register_request_body.dart';
import 'package:marketi/features/auth/data/services/auth_services.dart';

class AuthRepository {
  final AuthServices _authServices;

  AuthRepository(this._authServices);

  Future<ApiResult<AuthResponseModel>> loginWithEmailPassword(
      LoginRequestBody loginRequestBody) async {
    final result = await _authServices.loginWithEmailPassword(loginRequestBody);
    try {
      return ApiResult.success(result);
    } catch (err) {
      return ApiResult.failure(result.message!);
    }
  }

  Future<ApiResult<AuthResponseModel>> registerWithEmailPassword(
      RegisterRequestBody registerRequestBody) async {
    final result =
        await _authServices.registerWithEmailPassword(registerRequestBody);
    try {
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
