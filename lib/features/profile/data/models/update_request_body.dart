import 'package:json_annotation/json_annotation.dart';

part 'update_request_body.g.dart';

@JsonSerializable()
class UpdateRequestBody {
  final String name;
  final String phone;
  final String email;
  final String image;

  UpdateRequestBody({
    required this.name,
    required this.phone,
    required this.email,
    required this.image,
  });

  Map<String, dynamic> toJson() => _$UpdateRequestBodyToJson(this);
}
