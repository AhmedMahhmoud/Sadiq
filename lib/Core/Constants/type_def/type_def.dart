import 'package:dartz/dartz.dart';

import '../../ErrorHandling/failure.dart';

// ignore: camel_case_types
typedef futureEither<T> = Future<Either<Failure, T>>;
