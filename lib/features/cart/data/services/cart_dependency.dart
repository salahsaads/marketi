import 'package:dio/dio.dart';
import 'package:marketi/core/di/dependency_injection.dart';
import 'package:marketi/core/networking/dio_factory.dart';
import 'package:marketi/features/cart/data/repository/cart_repository.dart';
import 'package:marketi/features/cart/data/services/cart_services.dart';
import 'package:marketi/features/cart/presentation/logic/cart_cubit.dart';

Future<void> cartDependency() async {
  // Dio & Api Service
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<CartServices>(() => CartServices(dio));

  getIt.registerLazySingleton<CartRepository>(() => CartRepository(getIt()));

  getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));
}
