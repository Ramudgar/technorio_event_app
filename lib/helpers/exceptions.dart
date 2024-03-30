class BaseException implements Exception {
  final String? message;
  final String type;

  BaseException(this.type, {this.message});

  @override
  String toString() {
    return 'BaseException{message: $message, type: $type}';
  }
}


class NetworkException extends BaseException {
  NetworkException({String? message}) : super('NetworkException', message: message);
}


// UnauthorizedException
class UnauthorizedException extends BaseException {
  UnauthorizedException({String? message}) : super('UnauthorizedException', message: message);
}

// WarningException
class WarningException extends BaseException {
  WarningException({String? message}) : super('WarningException', message: message);
}

// ErrorException
class ErrorException extends BaseException {
  ErrorException({String? message}) : super('ErrorException', message: message);
}