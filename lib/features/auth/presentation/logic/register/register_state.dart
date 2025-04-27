import 'package:marketi/features/auth/data/models/auth_response_model.dart';

abstract class RegisterState {}

final class RegisterInitialState extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterErrorState extends RegisterState {
  final String message;

  RegisterErrorState({required this.message});
}

final class RegisterSuccessState extends RegisterState {
  final AuthResponseModel authResponseModel;

  RegisterSuccessState({required this.authResponseModel});
}

final class ProfileImagePickerSuccessState extends RegisterState {}

final class ProfileImagePickerErrorState extends RegisterState {}
