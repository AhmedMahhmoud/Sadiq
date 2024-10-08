// ignore_for_file: constant_identifier_names

import 'package:sadiq/Core/ErrorHandling/failure.dart';

class Constants {
  static const NO_INTERNET = "There is no internet connection";
  static const SERVER_FAILURE =
      "Something went wrong when connecting to the server,please try again later";
  static const UNAUTHORIZED = "You are not authorized";
  static const unExpectedFailure =
      'An unknown error occurred please try again later';
  static const baseUrl = 'https://espitalia.online/api';
  static const timeoutFailure = "Connection timeout please try again later";
  static const notfoundFailure = "Request not found";
}
