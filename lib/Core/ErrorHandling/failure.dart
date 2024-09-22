import '../Constants/constants.dart';

abstract class Failure {
  String get message;
}

class ServerFailure extends Failure {
  @override
  final String message;

  ServerFailure({this.message = Constants.SERVER_FAILURE});
}

class NetworkFailure extends Failure {
  @override
  final String message;

  NetworkFailure({this.message = Constants.NO_INTERNET});
}

class UnExpectedFailure extends Failure {
  @override
  final String message;

  UnExpectedFailure({this.message = Constants.unExpectedFailure});
}

class UnUthorizedFailure extends Failure {
  @override
  final String message;

  UnUthorizedFailure({this.message = Constants.UNAUTHORIZED});
}

class TimeoutFailure extends Failure {
  @override
  final String message;

  TimeoutFailure({this.message = Constants.UNAUTHORIZED});
}

class NotfoundFailure extends Failure {
  @override
  final String message;

  NotfoundFailure({this.message = Constants.notfoundFailure});
}

class EndpointFailure extends Failure {
  @override
  final String message;

  EndpointFailure(this.message);
}
