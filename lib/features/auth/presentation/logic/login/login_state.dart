import 'package:marketi/features/auth/data/models/auth_response_model.dart';

abstract class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState({required this.message});
}

final class LoginSuccessState extends LoginState {
  final AuthResponseModel authResponseModel;

  LoginSuccessState({required this.authResponseModel});
}
