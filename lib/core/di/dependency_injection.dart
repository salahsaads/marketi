import 'package:get_it/get_it.dart';
import 'package:marketi/features/Favorites/data/services/favorite_dependency.dart';
import 'package:marketi/features/auth/data/services/auth_dependency.dart';
import 'package:marketi/features/cart/data/services/cart_dependency.dart';
import 'package:marketi/features/home/data/services/home_dependency.dart';
import 'package:marketi/features/profile/data/services/profile_dependency.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  await authDependency();

  await profileDependency();

  await favoriteDependency();

  await cartDependency();

  await homeDependency();
}
