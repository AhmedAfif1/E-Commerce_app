import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/core/utils/storage_helper.dart';
import 'package:ecommerce_app/features/auth/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  DioHelper dio = DioHelper();
  //diohelper

  sl.registerSingleton<DioHelper>(dio);

  //repo dependency

  sl.registerLazySingleton(() => AuthRepo(sl()));

  //StorageHelper
  sl.registerLazySingleton(() => StorageHelper());
  //cubit

  sl.registerFactory(() => AuthRepo(sl()));
}
