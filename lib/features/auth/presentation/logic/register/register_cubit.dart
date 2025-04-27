import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketi/core/cache/shared_pref_helper.dart';
import 'package:marketi/core/cache/shared_pref_keys.dart';
import 'package:marketi/core/networking/api_result.dart';
import 'package:marketi/features/auth/data/models/auth_response_model.dart';
import 'package:marketi/features/auth/data/models/register_request_body.dart';
import 'package:marketi/features/auth/data/repository/auth_repository.dart';
import 'package:marketi/features/auth/presentation/logic/register/register_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;
  RegisterCubit(this._authRepository) : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  AuthResponseModel? userModel;

  void emitRegisterStates() async {
    emit(RegisterLoadingState());
    final response = await _authRepository.registerWithEmailPassword(
      RegisterRequestBody(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        phone: phoneController.text,
        image:
            'https://image.lexica.art/full_jpg/c9537cf5-4e95-4394-86d4-85155b4e938e',
      ),
    );

    if (response is Success<AuthResponseModel>) {
      userModel = response.data;

      //  userToken = userModel!.data!.token!;

      emit(RegisterSuccessState(authResponseModel: userModel!));
    } else {
      emit(RegisterErrorState(message: userModel!.message!));
    }
  }

  // Pick an image
  File? profileImageFile;
  ImagePicker picker = ImagePicker();
  Future<void> getProfileImage(String imageSource) async {
    XFile? pickedFile;
    if (imageSource == 'gallery') {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    } else if (imageSource == 'camera') {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    }
    if (pickedFile != null) {
      profileImageFile = File(pickedFile.path);
      emit(ProfileImagePickerSuccessState());
    } else {
      emit(ProfileImagePickerErrorState());
    }
  }

  saveUserToken(String token) {
    CacheHelper.saveData(key: userToken, value: token);
  }
}
