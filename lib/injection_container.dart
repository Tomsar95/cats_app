import 'package:cats_app/features/cats/data/datasources/cats_remote_data_source.dart';
import 'package:cats_app/features/cats/data/repositories/cats_repository_impl.dart';
import 'package:cats_app/features/cats/domain/repositories/cats_repository.dart';
import 'package:cats_app/features/cats/domain/use_cases/get_cats.dart';
import 'package:cats_app/features/cats/presentation/blocs/cats_bloc/cats_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'features/core/network/network_info.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Features - Number Trivia
  initFeatures();
  // Core
  initCore();
  // External
  await initExternal();
}

void initFeatures() {
  // BLoC
  serviceLocator.registerFactory(() => CatsBloc(getCats: serviceLocator()));

  // Use Cases
  serviceLocator.registerLazySingleton(() => GetCats(serviceLocator()));

  // Repository

  serviceLocator.registerLazySingleton<CatsRepository>(() =>
      CatsRepositoryImpl(
        remoteDataSource: serviceLocator(),));

  // Data sources
  serviceLocator.registerLazySingleton<CatsRemoteDataSource>(
          () => CatsRemoteDataSourceImpl(client: serviceLocator()));
}

void initCore() {
  // network info
  serviceLocator.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(serviceLocator()));
}

Future<void> initExternal() async {
  serviceLocator.registerLazySingleton(() => http.Client());
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
}
