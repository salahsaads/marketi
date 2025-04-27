import 'package:dio/dio.dart';
import 'package:marketi/core/di/dependency_injection.dart';
import 'package:marketi/core/networking/dio_factory.dart';
import 'package:marketi/features/auth/data/repository/auth_repository.dart';
import 'package:marketi/features/auth/data/services/auth_services.dart';
import 'package:marketi/features/auth/presentation/logic/login/login_cubit.dart';
import 'package:marketi/features/auth/presentation/logic/register/register_cubit.dart';

Future<void> authDependency() async {
  // Dio & Api Service
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<AuthServices>(
    () => AuthServices(dio),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt()),
  );

  /// LOGIC

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
}
