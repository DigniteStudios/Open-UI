// lib/core/services/service_locator.dart
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/data_sources/auth_data_sources.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/login_repository.dart';
import '../../features/auth/domain/repositories/signup_repository.dart';
import '../../features/auth/domain/use_cases/login_use_case.dart';
import '../../features/home/data/data_sources/product_datasource.dart';
import '../../features/home/data/repositories/product_repository_impl.dart';
import '../../features/home/domain/repositories/products_repository.dart';
import '../../features/home/domain/use_cases/product_use_case.dart';
import 'api_service.dart';
import 'storage_service.dart';

final GetIt locator = GetIt.instance;

void setupLocator() async {
  // Register SharedPreferences as a singleton
  locator.registerSingletonAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance(),
  );

  // Wait for the singleton to be ready
  await locator.isReady<SharedPreferences>();

  // Register other services that depend on SharedPreferences
  locator.registerLazySingleton<StorageService>(
        () => StorageService(locator<SharedPreferences>()),
  );

  locator.registerLazySingleton(() => ApiService());

  _repositories();
  _dataSources();
  _useCase();
}

/// Register repositories
void _repositories() {
  // Register AuthRepositoryImpl as an internal implementation
  locator.registerLazySingleton<AuthRepositoryInternal>(
        () => AuthRepositoryImpl(locator<AuthDatasource>()),
  );

  // Register ProductRepositoryImpl as an internal implementation
  locator.registerLazySingleton<ProductRepositoryInternal>(
        () => ProductRepositoryImpl(locator<ProductDatasource>()),
  );

  // Register interfaces using the same instance
  locator.registerLazySingleton<LoginRepository>(
        () => locator<AuthRepositoryInternal>(),
  );
  locator.registerLazySingleton<SignupRepository>(
        () => locator<AuthRepositoryInternal>(),
  );

  locator.registerLazySingleton<ProductRepository>(
        () => locator<ProductRepositoryInternal>(),
  );
}

/// Register dataSources
void _dataSources() {
  locator.registerLazySingleton<AuthDatasource>(
        () => AuthDatasourceImpl(),
  );

  locator.registerLazySingleton<ProductDatasource>(
        () => ProductDatasourceImpl(),
  );
}

/// Register use cases
void _useCase() {
  /// Auth
  locator.registerLazySingleton(() => LoginUseCase(locator<LoginRepository>()));

  /// Products
  locator.registerLazySingleton(() => ProductsUseCase(locator<ProductRepository>()));
}
