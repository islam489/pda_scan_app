
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pda_scan_app/features/Receipt/data/repos/get_purchase_order_details_repo.dart';
import 'package:pda_scan_app/features/Receipt/logic/cubit/get_purchase_order_details_cubit.dart';

import '../../features/Authintication/Login/data/repos/login_repo.dart';
import '../../features/Authintication/Login/logic/cubit/login_cubit.dart';
import '../../features/Authintication/Logout/data/repos/logout_repo.dart';
import '../../features/Authintication/Logout/logic/cubit/logout_cubit.dart';
import '../Networking/api_service.dart';
import '../Networking/dio_factory.dart';



final getIt = GetIt.instance;

/// we put all our dependency injection in this function
Future<void> setupGetIt() async {
  // Dio & ApiService
  String? token;
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));


  // Logout
  getIt.registerLazySingleton<LogoutRepo>(() => LogoutRepo(getIt()));
  getIt.registerFactory<LogoutCubit>(() => LogoutCubit(getIt()));

  // GetPurchaseOrderDetails
  getIt.registerLazySingleton<GetPurchaseOrderDetailsRepo>(() => GetPurchaseOrderDetailsRepo(getIt()));
  getIt.registerFactory<GetPurchaseOrderDetailsCubit>(() => GetPurchaseOrderDetailsCubit(getIt()));
}