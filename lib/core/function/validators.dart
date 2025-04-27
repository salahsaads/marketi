// validators.dart
String? notEmptyValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }
  return null;
}

String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'الاسم مطلوب';
  }

  List<String> words = value.trim().split(' ');
  if (words.length < 2) {
    return 'يجب أن يتكون الاسم من كلمتين على الأقل';
  }

  if (!RegExp(r"^[a-zA-Z\sء-ي]+$").hasMatch(value)) {
    return 'الاسم يجب ألا يحتوي على أرقام أو رموز';
  }

  return null;
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  String pattern = r'^[^@]+@[^@]+\.[^@]+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

String? phoneNumberValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter phone number';
  }
  String pattern = r'^\+?[0-9]{7,15}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Please enter a valid phone number';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'كلمة المرور مطلوبة';
  }
  if (value.length < 6) {
    return 'يجب أن تكون كلمة المرور 6 أحرف أو أكثر';
  }
  return null;
}

String? confirmPasswordValidator(String? password, String? confirmPassword) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return 'يرجى تأكيد كلمة المرور';
  }

  if (confirmPassword != password) {
    return 'كلمتا المرور غير متطابقتين';
  }

  return null;
}
