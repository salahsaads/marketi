class ChangePasswordRequestModel {
  ChangePasswordRequestModel({
    required this.currentPassword,
    required this.newPassword,
  });

  final String? currentPassword;
  final String? newPassword;

  factory ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordRequestModel(
      currentPassword: json["current_password"],
      newPassword: json["new_password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "current_password": currentPassword,
        "new_password": newPassword,
      };
}
