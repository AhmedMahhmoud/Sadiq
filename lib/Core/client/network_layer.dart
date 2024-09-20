// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../error/exceptions.dart';

enum RequestMethod {
  get,
  post,
  patch,
  put,
  delete,
  postMultiPart,
  putMultiPart
}

class MyClient {
  final Duration _timeOut = const Duration(minutes: 1);

  Future<Either<Exception, http.Response>> request(String requestUrl,
      RequestMethod requestMethod, Map<String, String> headers,
      {Map<String, dynamic> body = const {},
      List<http.MultipartFile> files = const []}) async {
    try {
      final DateTime startTime = DateTime.now();
      final Uri url = Uri.parse(requestUrl);
      late http.Response response;
      switch (requestMethod) {
        case RequestMethod.get:
          response = await _get(url, headers: headers);
          break;
        case RequestMethod.post:
          response = await _post(url,
              headers: headers, body: Map<String, String>.from(body));
          break;
        case RequestMethod.patch:
          response = await _patch(url,
              headers: headers, body: Map<String, String>.from(body));
          break;
        case RequestMethod.put:
          response = await _put(url,
              headers: headers, body: Map<String, String>.from(body));
          break;
        case RequestMethod.delete:
          response = await _delete(url,
              headers: headers, body: Map<String, String>.from(body));
          break;
        case RequestMethod.postMultiPart:
          http.StreamedResponse streamedResponse = await _postMultipart(
              url, headers,
              body: Map<String, String>.from(body), files: files);

          response = http.Response.bytes(
              await streamedResponse.stream.toBytes(),
              streamedResponse.statusCode);

          break;
        case RequestMethod.putMultiPart:
          http.StreamedResponse streamedResponse = await _putMultipart(
              url, headers,
              body: Map<String, String>.from(body), files: files);
          response = http.Response.bytes(
              await streamedResponse.stream.toBytes(),
              streamedResponse.statusCode);
          break;
      }

      final DateTime endTime = DateTime.now();
      print('=============================');
      print(
          '$requestUrl executed in ${endTime.difference(startTime).inMilliseconds} milliseconds');
      print(body);
      print(response.statusCode);
      print(response.body);
      print(headers.toString());
      print('=============================');
      if (response.statusCode == 401) {
        return Left(AuthException());
      }
      if (response.statusCode < 500 && response.statusCode > 399) {
        String? errorMessage = json.decode(response.body)['msg'].toString();
        return left(Exception(errorMessage));
      } else if (response.statusCode >= 500) {
        return left(InternalServerException());
      } else if (response.statusCode > 199 && response.statusCode < 300) {
        return right(response);
      } else {
        return left(Exception());
      }
    } on SocketException catch (_) {
      return Left(NetworkException());
    } on TimeoutException catch (_) {
      return Left(TimeoutException());
    } on Exception catch (e) {
      return Left(e);
    } catch (e) {
      print(e.toString());
      if (e is TypeError || e is FormatException) return left(Exception());
      return left(e as Exception);
    }
  }

  Future<http.StreamedResponse> _postMultipart(
      Uri url, Map<String, String> headers,
      {Map<String, String> body = const {},
      List<http.MultipartFile> files = const []}) async {
    http.MultipartRequest request = http.MultipartRequest('POST', url);
    request.files.addAll(files);
    request.fields.addAll(body);
    request.headers.addAll(headers);
    return request.send().timeout(_timeOut);
  }

  Future<http.StreamedResponse> _putMultipart(
      Uri url, Map<String, String> headers,
      {Map<String, String> body = const {},
      List<http.MultipartFile> files = const []}) async {
    http.MultipartRequest request = http.MultipartRequest('PUT', url);
    request.files.addAll(files);
    request.fields.addAll(body);
    request.headers.addAll(headers);
    return request.send().timeout(_timeOut);
  }

  Future<http.Response> _delete(Uri url,
          {Map<String, String>? headers,
          Map<String, dynamic> body = const {}}) =>
      http
          .delete(url, headers: headers ?? {}, body: json.encode(body))
          .timeout(_timeOut);

  Future<http.Response> _get(Uri url, {Map<String, String>? headers}) =>
      http.get(url, headers: headers).timeout(_timeOut);

  Future<http.Response> _patch(Uri url,
          {Map<String, String>? headers,
          Map<String, dynamic> body = const {}}) =>
      http
          .patch(url, headers: headers, body: json.encode(body))
          .timeout(_timeOut);

  Future<http.Response> _post(Uri url,
          {Map<String, String>? headers,
          Map<String, dynamic> body = const {}}) =>
      http
          .post(url, headers: headers, body: json.encode(body))
          .timeout(_timeOut);

  Future<http.Response> _put(Uri url,
          {Map<String, String>? headers,
          Map<String, dynamic> body = const {}}) =>
      http
          .put(url, headers: headers, body: json.encode(body))
          .timeout(_timeOut);
}
