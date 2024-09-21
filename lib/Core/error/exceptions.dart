class AuthException implements Exception {}

class InternalServerException implements Exception {}

class CacheException implements Exception {}

class NetworkException implements Exception {}

class TimeoutException implements Exception {}

class InvalidInputException implements Exception {}

class ParsingException implements Exception {}

class PaymentException implements Exception {}


class ExceptionWithMessage implements Exception {
  final String message;

  ExceptionWithMessage(this.message);
}
