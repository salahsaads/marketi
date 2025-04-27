import 'package:json_annotation/json_annotation.dart';

part 'logout_response_model.g.dart';

@JsonSerializable(createToJson: false)
class LogoutResponseModel {
  LogoutResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final LogoutData? data;

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class LogoutData {
  LogoutData({
    required this.id,
    required this.token,
  });

  final int id;
  final String token;

  factory LogoutData.fromJson(Map<String, dynamic> json) =>
      _$LogoutDataFromJson(json);
}
