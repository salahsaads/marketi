import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/cache/shared_pref_helper.dart';
import 'package:marketi/core/cache/shared_pref_keys.dart';
import 'package:marketi/core/function/show_toast.dart';
import 'package:marketi/core/routes/extentions.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/features/profile/presentation/logic/profile_cubit.dart';
import 'package:marketi/features/profile/presentation/logic/profile_state.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        switch (state) {
          case LogoutUserLoadingState _:
            showToast(
              msg: 'جاري تسجيل الخروج من الحساب',
              color: Colors.green,
            );
          case LogoutUserSuccessState _:
            context.navigateToReplacement(Routes.loginScreen);
            showToast(
              msg: ProfileCubit.get(context).logoutModel!.message,
              color: Colors.green,
            );
            CacheHelper.removeData(key: userToken);
          default:
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                ProfileCubit.get(context).logoutUser();
              },
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: Text(
                    'تسجيل الخروج',
                    style: AppStyles.style24Medium,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xFF8CB3FF),
                  ),
                ),
              ),
            ),
            const Divider(
              color: Color(0xFF8CB3FF),
              height: 1,
              indent: 15,
              endIndent: 15,
            ),
          ],
        );
      },
    );
  }
}
