import 'exceptions.dart';

const unknownException = 'Unknown Failure';
const serverException = 'Server Failure';
const timeoutException = 'Timeout Failure';
const internalServerException = 'Internal Server Failure';
const unauthorizedException = 'Unauthorized User';
const cacheException = 'Cache Failure';
const networkException = 'Network Connection Failure';
const parsingException = 'Data Parsing Failure';
const invalidInput = 'Invalid Input';
const paymentException = 'Payment Not Completed';

String exceptionHandler(Object exception) {
  if (exception is CacheException) {
    return cacheException;
  } else if (exception is InvalidInputException) {
    return invalidInput;
  } else if (exception is NetworkException) {
    return networkException;
  } else if (exception is ExceptionWithMessage) {
    return exception.message;
  } else if (exception is AuthException) {
    return unauthorizedException;
  } else if (exception is InternalServerException) {
    return internalServerException;
  } else if (exception is TimeoutException) {
    return timeoutException;
  } else if (exception is PaymentException) {
    return paymentException;
  } else if (exception is ParsingException) {
    return parsingException;
  } else if (exception is Exception) {
    return exception.toString().split(': ').last;
  }
  return unknownException;
}
