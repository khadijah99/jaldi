import 'package:jaldi/core/models/error_message.dart';

/// Base Result class
/// [S] represents the type of the success value
/// [E] should be [Exception] or a subclass of it
class Result<S, E extends ErrorResponse> {
  const Result();
}

class Success<S, E extends ErrorResponse> extends Result<S, E> {
  const Success(this.value);
  final S value;
}

class Failure<S, E extends ErrorResponse> extends Result<S, E> {
  const Failure(this.exception);
  final E exception;
}
