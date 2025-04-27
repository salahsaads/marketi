import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/function/show_toast.dart';
import 'package:marketi/core/routes/extentions.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/features/auth/presentation/logic/login/login_cubit.dart';
import 'package:marketi/features/auth/presentation/logic/login/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      child: child,
      listener: (context, state) {
        var user = LoginCubit.get(context).userModel;

        switch (state) {
          case LoginLoadingState():
            showDialog(
              context: context,
              builder: (context) => Center(
                child: Image.asset(
                  'assets/images/Animation - 1726144698470.gif',
                ),
              ),
            );

          case LoginSuccessState():
            context.pop();
            if (user!.status == true) {
              showToast(msg: user.message!, color: Colors.green);
              context.navigateToReplacement(Routes.navBarLayout);
            }
          case LoginErrorState():
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
