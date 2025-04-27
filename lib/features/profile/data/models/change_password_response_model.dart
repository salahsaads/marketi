import 'package:json_annotation/json_annotation.dart';

part 'change_password_response_model.g.dart';

@JsonSerializable(createToJson: false)
class ChangePasswordResponseModel {
  ChangePasswordResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final DataChangePassword? data;

  factory ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class DataChangePassword {
  DataChangePassword({
    required this.email,
  });

  final String? email;

  factory DataChangePassword.fromJson(Map<String, dynamic> json) =>
      _$DataChangePasswordFromJson(json);
}
