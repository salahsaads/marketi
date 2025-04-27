import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/function/show_toast.dart';
import 'package:marketi/core/routes/extentions.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/features/auth/presentation/logic/register/register_cubit.dart';
import 'package:marketi/features/auth/presentation/logic/register/register_state.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      child: child,
      listener: (context, state) {
        var user = RegisterCubit.get(context).userModel;

        switch (state) {
          case RegisterLoadingState():
            showDialog(
              context: context,
              builder: (context) => Center(
                child: Image.asset(
                  'assets/images/Animation - 1726144698470.gif',
                ),
              ),
            );

          case RegisterSuccessState():
            context.pop();
            if (user!.status == true) {
              showToast(msg: user.message!, color: Colors.green);
              context.navigateToReplacement(Routes.navBarLayout);
            }
          case RegisterErrorState():
            setupErrorState(context, user!.message!);

          default:
            setupErrorState(context, 'معندناش نت');
        }
      },
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showToast(msg: error, color: Colors.red);
  }
}
