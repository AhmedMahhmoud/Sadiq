import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sadiq/Core/Constants/constants.dart';
import 'package:sadiq/Core/ErrorHandling/exceptions.dart';
import 'package:sadiq/Core/error/exception_handler.dart';

class GetNetworkService {
  GetNetworkService();
  Future<dynamic> get<T>(String url) async {
    final Dio dio = Dio();
    try {
      final response = await dio.get(
        url,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        if (response.data['value']) {
          return response.data;
        } else {
          debugPrint('${response.data['message']}');
          throw EndpointException(errorMsg: response.data['message']);
        }
      } else if (response.statusCode == 400) {
        throw NotfoundException();
      }
    } on DioError catch (e) {
      _handleDioError(e);
      debugPrint("Error ${e.message}");
    } catch (e) {
      debugPrint("Error ${e.toString()}");
      throw UnAuthorizedException();
    }
  }

  _handleDioError(DioError e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout || DioErrorType.receiveTimeout:
        throw TimeoutException(Constants.timeoutFailure);
      case DioErrorType.badResponse:
        if (e.response?.statusCode == 404) {
          throw NotfoundException();
        } else if (e.response?.statusCode == 401) {
          throw UnAuthorizedException();
        } else if (e.response != null && e.response!.statusCode! >= 500) {
          throw ServerException();
        }
        break;
      default:
        throw UnExpectedException();
    }
    return unknownException;
  }
}
