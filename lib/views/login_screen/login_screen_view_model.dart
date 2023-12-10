import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:jaldi/core/logger.dart';

class LoginScreenViewModel extends BaseViewModel {
  late Logger log;

  LoginScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
