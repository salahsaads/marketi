import 'package:flutter/material.dart';
import 'package:marketi/core/cache/shared_pref_helper.dart';
import 'package:marketi/core/cache/shared_pref_keys.dart';
import 'package:marketi/core/networking/api_result.dart';
import 'package:marketi/features/auth/data/models/auth_response_model.dart';
import 'package:marketi/features/auth/data/models/login_request_body.dart';
import 'package:marketi/features/auth/data/repository/auth_repository.dart';

import 'login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  LoginCubit(this._authRepository) : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  AuthResponseModel? userModel;

  void emitLoginStates() async {
    emit(LoginLoadingState());
    ApiResult<AuthResponseModel> response =
        await _authRepository.loginWithEmailPassword(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    if (response is Success<AuthResponseModel> &&
        response.data.status == true) {
      userModel = response.data;

      // userToken = userModel!.data!.token!;

      saveUserToken(response.data.data!.token!);

      emit(LoginSuccessState(authResponseModel: userModel!));
    } else if (response is Success<AuthResponseModel> &&
        response.data.status == false) {
      userModel = response.data;

      emit(LoginErrorState(message: response.data.message!));
    }
  }

  saveUserToken(String token) {
    CacheHelper.saveData(key:  userToken,value:  token);
  }
}
