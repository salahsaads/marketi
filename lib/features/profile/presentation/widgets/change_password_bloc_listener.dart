import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/function/show_toast.dart';
import 'package:marketi/core/routes/extentions.dart';
import 'package:marketi/features/profile/presentation/logic/profile_cubit.dart';
import 'package:marketi/features/profile/presentation/logic/profile_state.dart';

class ChangePasswordBlocListener extends StatelessWidget {
  const ChangePasswordBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      child: child,
      listenWhen: (previous, current) =>
          current is ChangePasswordLoadingState ||
          current is ChangePasswordSuccessState ||
          current is ChangePasswordErrorState,
      listener: (context, state) {
        switch (state) {
          case ChangePasswordLoadingState _:
            setupLoading();
          case ChangePasswordSuccessState _:
            if (ProfileCubit.get(context).changePasswordResponseModel!.status ==
                true) {
              showToast(msg: 'تم تغيير كلمة المرور', color: Colors.green);
              context.pop();
            } else {
              showToast(msg: 'فشل تغيير كلمة المرور', color: Colors.red);
            }

          case ChangePasswordErrorState _:
            showToast(msg: 'فشل تغيير كلمة المرور', color: Colors.red);
          default:
        }
      },
    );
  }

  Widget setupLoading() {
    return const LinearProgressIndicator();
  }
}
