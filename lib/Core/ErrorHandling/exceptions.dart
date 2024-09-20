class ServerException implements Exception {}

class NetworkException implements Exception {}

class UnAuthorizedException implements Exception {}

class EndpointException implements Exception {
  final String errorMsg;
  EndpointException({required this.errorMsg});
}

class UnExpectedException implements Exception {}
