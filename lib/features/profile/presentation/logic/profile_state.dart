import 'package:marketi/features/auth/data/models/auth_response_model.dart';
import 'package:marketi/features/profile/data/models/change_password_response_model.dart';
import 'package:marketi/features/profile/data/models/logout_response_model.dart';

abstract class ProfileState {}

final class InitialProfileState extends ProfileState {}

/// GET PROFILE DATA

final class GetProfileLoadingState extends ProfileState {}

final class GetProfileSuccessState extends ProfileState {
  final AuthResponseModel authResponseModel;

  GetProfileSuccessState({required this.authResponseModel});
}

final class GetProfileErrorState extends ProfileState {
  final String message;

  GetProfileErrorState({required this.message});
}

/// UPDATE PROFILE DATA

final class UpdateProfileLoadingState extends ProfileState {}

final class UpdateProfileSuccessState extends ProfileState {
  final AuthResponseModel authResponseModel;

  UpdateProfileSuccessState({required this.authResponseModel});
}

final class UpdateProfileErrorState extends ProfileState {
  final String message;

  UpdateProfileErrorState({required this.message});
}

/// CHANGE PASSWORD

final class ChangePasswordLoadingState extends ProfileState {}

final class ChangePasswordSuccessState extends ProfileState {
  final ChangePasswordResponseModel changePasswordResponseModel;

  ChangePasswordSuccessState({required this.changePasswordResponseModel});
}

final class ChangePasswordErrorState extends ProfileState {
  final String message;

  ChangePasswordErrorState({required this.message});
}

/// LOGOUT PROFILE DATA

final class LogoutUserLoadingState extends ProfileState {}

final class LogoutUserSuccessState extends ProfileState {
  final LogoutResponseModel logoutResponseModel;

  LogoutUserSuccessState({required this.logoutResponseModel});
}

final class LogoutUserErrorState extends ProfileState {
  final String message;

  LogoutUserErrorState({required this.message});
}
