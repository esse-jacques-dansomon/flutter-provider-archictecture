import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../config/app_constantes.dart';
import '../data/datasource/dio/dio_client.dart';
import '../data/repositories/auth_repo.dart';
import '../providers/auth_provider.dart';


final sl = GetIt.instance;

Future<void> init() async {
  //! Register services
  //pattern singleton

  // Core
  // sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl(), sl()));

  // Repository
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));



  //Provider
  sl.registerLazySingleton(() => AuthProvider(authRepo: sl()));


  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());

}
