import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/dependency_injection.dart';
import 'package:marketi/core/function/build_animate_page_route.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/features/Favorites/presentation/logic/favorite_cubit.dart';
import 'package:marketi/features/auth/presentation/logic/login/login_cubit.dart';
import 'package:marketi/features/auth/presentation/logic/register/register_cubit.dart';
import 'package:marketi/features/cart/presentation/logic/cart_cubit.dart';
import 'package:marketi/features/home/presentation/Screens/home_screen.dart';
import 'package:marketi/features/home/presentation/Screens/nav_bar_layout.dart';
import 'package:marketi/features/auth/presentation/screens/login_screen.dart';
import 'package:marketi/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:marketi/features/auth/presentation/widgets/congratulations.dart';
import 'package:marketi/features/profile/presentation/screens/change_password_screen.dart';
import 'package:marketi/features/auth/presentation/widgets/verificatin_code.dart';
import 'package:marketi/features/home/presentation/logic/home_cubit.dart';
import 'package:marketi/features/onboarding/screens/onboarding_screen.dart';
import 'package:marketi/features/auth/presentation/screens/register_screen.dart';
import 'package:marketi/features/profile/presentation/logic/profile_cubit.dart';
import 'package:marketi/features/profile/presentation/screens/profile_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // Extract the route name from the settings.
    final String routeName = settings.name!;

    switch (routeName) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );

      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );

      case Routes.loginScreen:
        return fadePageRoute(
          BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
        );

      case Routes.verificationCodeScreen:
        return MaterialPageRoute(
          builder: (_) => const VerificationCode(),
        );

      case Routes.changePasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProfileCubit>(),
            child: const ChangePasswordScreen(),
          ),
        );

      case Routes.congratulations:
        return MaterialPageRoute(
          builder: (_) => const Congratulations(),
        );

      case Routes.navBarLayout:
        return fadePageRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ProfileCubit>()..getProfileDate(),
              ),
              BlocProvider(
                create: (context) => getIt<FavoriteCubit>()..getFavorites(),
              ),
              BlocProvider(
                create: (context) => getIt<HomeCubit>()
                  ..emitStatesBanners()
                  ..emitStatesCategories()
                  ..emitStatesAllProducts(),
              ),
              BlocProvider(
                create: (context) => getIt<CartCubit>()..getCarts(),
              ),
            ],
            child: const NavBarLayout(),
          ),
        );

      case Routes.homeScreen:
        return fadePageRoute(
          BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const HomeScreen(),
          ),
        );

      case Routes.profileScreen:
        return fadePageRoute(
          BlocProvider(
            create: (context) => getIt<ProfileCubit>(),
            child: const ProfileScreen(),
          ),
        );

      case Routes.cartScreen:
        return fadePageRoute(
          BlocProvider(
            create: (context) => getIt<CartCubit>(),
            child: const ProfileScreen(),
          ),
        );

      case Routes.favoriteScreen:
        return fadePageRoute(
          BlocProvider(
            create: (context) => getIt<FavoriteCubit>(),
            child: const ProfileScreen(),
          ),
        );

      // case Routes.personalInfoScreen:
      //   return fadePageRoute(
      //     BlocProvider(
      //       create: (context) => getIt<ProfileCubit>()..getProfileDate(),
      //       child: const PersonalInfoScreen(),
      //     ),
      //   );
    }

    return null;
  }
}
