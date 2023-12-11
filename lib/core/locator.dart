import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jaldi/core/constants/end_points.dart';
import 'package:jaldi/core/services/api_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked_services/stacked_services.dart';
import 'logger.dart';

final GetIt locator = GetIt.instance;
final baseOptions = BaseOptions(
  baseUrl: ApiEndpoint.baseUrl,
);
final _dio = Dio(baseOptions);
var _jaldiService = JaldiApiService(dio: _dio);

class LocatorInjector {
  static Future<void> setUpLocator() async {
    Logger log = getLogger('Locator Injector');
    log.d('Registering Navigation Service');
    locator.registerLazySingleton(() => NavigationService());
    log.d('Registering Dialog Service');
    locator.registerLazySingleton(() => DialogService());
    log.d('Registering Snackbar Service');
    locator.registerLazySingleton(() => SnackbarService());
    log.d('Registering Jaldi API Service');
    locator.registerLazySingleton(() => (_jaldiService));
  }
}
