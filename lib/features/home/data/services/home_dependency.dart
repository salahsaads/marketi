import 'package:dio/dio.dart';
import 'package:marketi/core/di/dependency_injection.dart';
import 'package:marketi/core/networking/dio_factory.dart';
import 'package:marketi/features/home/data/repository/home_repository.dart';
import 'package:marketi/features/home/data/services/home_services.dart';
import 'package:marketi/features/home/presentation/logic/home_cubit.dart';

Future<void> homeDependency() async {
  // Dio & Api Service
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<HomeServices>(() => HomeServices(dio));

  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(getIt()));

  /// LOGIC

  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
