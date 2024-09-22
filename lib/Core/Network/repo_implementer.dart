import 'dart:async';

import 'package:dartz/dartz.dart';

import '../Constants/type_def/type_def.dart';
import '../ErrorHandling/exceptions.dart';
import '../ErrorHandling/failure.dart';

class RepoImplementerHandler {
  static futureEither<T> apiCall<T>(
      Future<T> Function() apiCall, connectionChecker) async {
    if (await connectionChecker.isConnected() == false) {
      return Left(NetworkFailure());
    }
    try {
      final res = await apiCall();
      print(res);
      // inspect(res);
      return Right(res);
    } on EndpointException catch (e) {
      return Left(EndpointFailure(e.errorMsg));
    } on ServerException {
      return Left(ServerFailure());
    } on UnAuthorizedException {
      return Left(UnUthorizedFailure());
    } on TimeoutException {
      return Left(TimeoutFailure());
    } on NotfoundException {
      return Left(NotfoundFailure());
    } catch (e) {
      print('catched error $e');
      return Left(UnExpectedFailure());
    }
  }
}
