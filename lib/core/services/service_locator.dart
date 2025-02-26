// lib/core/services/service_locator.dart
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth_feature/data/data_sources/auth_data_sources.dart';
import '../../features/auth_feature/data/repositories/auth_repository_impl.dart';
import '../../features/auth_feature/domain/repositories/login_repository.dart';
import '../../features/auth_feature/domain/use_cases/login_use_case.dart';
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
  locator.registerLazySingleton<LoginRepository>(
        () => AuthRepositoryImpl(locator<AuthDatasource>())
  );
}

/// Register dataSources
void _dataSources() {
  locator.registerLazySingleton<AuthDatasource>(
        () => AuthDatasourceImpl(),
  );
}

void _useCase() {
  /// Auth
  locator.registerLazySingleton(() => LoginUseCase(locator<LoginRepository>()));
}
