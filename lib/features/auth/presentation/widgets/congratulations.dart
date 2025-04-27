import 'package:flutter/material.dart';
import 'package:marketi/core/routes/extentions.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/widgets/app_text_button.dart';
import 'package:marketi/core/widgets/icon_navigate_pop.dart';

class Congratulations extends StatelessWidget {
  const Congratulations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            const Row(
              children: [
                IconNavigatePop(),
              ],
            ),
            verticalSpace(57),
            Image.asset('assets/images/Illustration_Congratulations.png'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: Text(
                'Congratulations',
                style: AppStyles.style24Medium,
              ),
            ),
            Text(
              'You have updated the password. please\nlogin again with your latest password',
              textAlign: TextAlign.center,
              style: AppStyles.style16Medium,
            ),
            verticalSpace(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: AppTextButton(
                textButton: 'Log In',
                onPressed: () {
                  context.navigateToReplacement(Routes.loginScreen);
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
