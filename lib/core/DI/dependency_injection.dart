
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/Authintication/Login/data/repos/login_repo.dart';
import '../../features/Authintication/Login/logic/cubit/login_cubit.dart';
import '../Networking/api_service.dart';
import '../Networking/dio_factory.dart';



final getIt = GetIt.instance;

/// we put all our dependency injection in this function
Future<void> setupGetIt() async {
  // Dio & ApiService
  String? token;
  Dio dio = await DioFactory.getDio(token!);
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

}