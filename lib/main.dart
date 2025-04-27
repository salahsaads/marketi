import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/cache/shared_pref_helper.dart';
import 'package:marketi/core/cache/shared_pref_keys.dart';
import 'package:marketi/core/di/dependency_injection.dart';
import 'package:marketi/core/routes/app_router.dart';
import 'package:marketi/core/routes/extentions.dart';

import 'package:marketi/marketi_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await CacheHelper.init();
  checkIfLoggedInUser();
  await ScreenUtil.ensureScreenSize();
  runApp(MarketiApp(appRouter: AppRouter()));
}

checkIfLoggedInUser() async {
  dynamic onboarding =
      await CacheHelper.getData(key: SharedPrefKeys.onboarding);

  String? token = await CacheHelper.getData(key: SharedPrefKeys.userToken);
  if (!token.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
  if (onboarding == true) {
    isOnboardingApp = true;
  } else {
    isOnboardingApp = false;
  }
}
