import 'package:logger/logger.dart';

import '../logger.dart';

class BaseService {
  late Logger log;
  BaseService({required String title}) {
    log = getLogger(runtimeType.toString());
  }
}
