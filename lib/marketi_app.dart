import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/cache/shared_pref_keys.dart';
import 'package:marketi/core/routes/app_router.dart';
import 'package:marketi/core/routes/routes.dart';

class MarketiApp extends StatelessWidget {
  const MarketiApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return ScreenUtilInit(
      designSize: Size(width, height),
      minTextAdapt: true,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: MaterialApp(
            theme: ThemeData(useMaterial3: false),
            debugShowCheckedModeBanner: false,
            initialRoute: sharedStartApp(),
            onGenerateRoute: appRouter.generateRoute,
          ),
        );
      },
    );
  }

  String sharedStartApp() {
    if (isLoggedInUser == true) {
      return Routes.navBarLayout;
    } else if (isOnboardingApp == true) {
      return Routes.loginScreen;
    } else {
      return Routes.onBoardingScreen;
    }
  }
}
