import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/networking/api_result.dart';
import 'package:marketi/features/auth/data/models/auth_response_model.dart';
import 'package:marketi/features/profile/data/models/change_password_request_model.dart';
import 'package:marketi/features/profile/data/models/change_password_response_model.dart';
import 'package:marketi/features/profile/data/models/logout_response_model.dart';
import 'package:marketi/features/profile/data/models/update_request_body.dart';
import 'package:marketi/features/profile/data/repo/profile_repository.dart';
import 'package:marketi/features/profile/presentation/logic/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _profileRepository;
  ProfileCubit(this._profileRepository) : super(InitialProfileState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  AuthResponseModel? userModel;
  LogoutResponseModel? logoutModel;
  ChangePasswordResponseModel? changePasswordResponseModel;

  // Get Profile Data

  void getProfileDate() async {
    emit(GetProfileLoadingState());

    final response = await _profileRepository.getProfile();
    if (response is Success<AuthResponseModel> &&
        response.data.status == true) {
      userModel = response.data;

      emit(GetProfileSuccessState(authResponseModel: userModel!));
    } else {
      emit(GetProfileErrorState(message: 'Your Info is not found'));
    }
  }

  // Update Profile

  void updateProfile(UpdateRequestBody updateRequestBody) async {
    emit(UpdateProfileLoadingState());

    final response = await _profileRepository.updateProfile(updateRequestBody);
    if (response is Success<AuthResponseModel> &&
        response.data.status == true) {
      userModel = response.data;

      emit(UpdateProfileSuccessState(authResponseModel: userModel!));
    } else {
      emit(UpdateProfileErrorState(message: 'Your Info is not found'));
    }
  }

  // Change Password

  void changePassword() async {
    emit(ChangePasswordLoadingState());

    final response =
        await _profileRepository.changePassword(ChangePasswordRequestModel(
      currentPassword: currentPasswordController.text,
      newPassword: newPasswordController.text,
    ));

    if (response is Success<ChangePasswordResponseModel>) {
      changePasswordResponseModel = response.data;
      emit(ChangePasswordSuccessState(
          changePasswordResponseModel: response.data));
    } else {
      emit(ChangePasswordErrorState(message: 'Can not Change Password'));
    }
  }

  // LOGOUT

  void logoutUser() async {
    emit(LogoutUserLoadingState());

    final response = await _profileRepository.logoutUser();
    if (response is Success<LogoutResponseModel>) {
      logoutModel = response.data;
      emit(LogoutUserSuccessState(logoutResponseModel: response.data));
    } else {
      emit(LogoutUserErrorState(message: 'Can not log out'));
    }
  }
}
