import 'package:dio/dio.dart';
import 'package:marketi/core/di/dependency_injection.dart';
import 'package:marketi/core/networking/dio_factory.dart';
import 'package:marketi/features/profile/data/repo/profile_repository.dart';
import 'package:marketi/features/profile/data/services/profile_services.dart';
import 'package:marketi/features/profile/presentation/logic/profile_cubit.dart';

Future<void> profileDependency() async {
  // Dio & Api Service
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<ProfileServices>(() => ProfileServices(dio));

  getIt.registerLazySingleton<ProfileRepository>(
      () => ProfileRepository(getIt()));

  /// LOGIC

  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));
}
