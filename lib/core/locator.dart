import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jaldi/core/constants/end_points.dart';
import 'package:jaldi/core/services/api_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked_services/stacked_services.dart';
import 'logger.dart';

// GetIt is a simple service locator for Dart and Flutter projects
final GetIt locator = GetIt.instance;

// Base options for configuring Dio HTTP client
final baseOptions = BaseOptions(
  baseUrl: ApiEndpoint.baseUrl,
);

// Creating an instance of Dio HTTP client
var _dio = Dio(baseOptions);

// Creating an instance of JaldiApiService using the configured Dio client
var _jaldiService = JaldiApiService(dio: _dio);

class LocatorInjector {
  // Method to set up and register various services in the locator
  static Future<void> setUpLocator() async {
    // Initializing logger for logging setup process
    Logger log = getLogger('Locator Injector');

    // Registering Navigation Service as a lazy singleton
    log.d('Registering Navigation Service');
    locator.registerLazySingleton(() => NavigationService());

    // Registering Dialog Service as a lazy singleton
    log.d('Registering Dialog Service');
    locator.registerLazySingleton(() => DialogService());

    // Registering Snackbar Service as a lazy singleton
    log.d('Registering Snackbar Service');
    locator.registerLazySingleton(() => SnackbarService());

    // Registering Jaldi API Service as a lazy singleton
    log.d('Registering Jaldi API Service');
    locator.registerLazySingleton(() => (_jaldiService));
  }
}
