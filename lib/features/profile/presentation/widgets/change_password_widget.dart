import 'package:flutter/material.dart';
import 'package:marketi/core/routes/extentions.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/app_styles.dart';

class ChangePasswordWidget extends StatelessWidget {
  const ChangePasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateTo(Routes.changePasswordScreen);
      },
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ListTile(
              leading: const Icon(
                Icons.lock_clock_outlined,
                color: Color(0xFF8CB3FF),
              ),
              title: Text(
                'تغيير كلمة المرور',
                style: AppStyles.style24Medium,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color(0xFF8CB3FF),
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
      ),
    );
  }
}
