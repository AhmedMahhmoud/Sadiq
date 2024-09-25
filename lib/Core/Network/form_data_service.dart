import 'dart:convert';
import 'dart:developer';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../ErrorHandling/exceptions.dart';

class FormDataService {
  static Future<dynamic> sendRequest(Uri url, Map<String, String> fields,
      [String? token, Map<String, File>? files]) async {
    final request = http.MultipartRequest('POST', url);
    request.fields.addAll(fields);

    if (token != null) {
      request.headers["Authorization"] = 'Bearer $token';
    }

    // Attach files if available
    if (files != null) {
      for (var entry in files.entries) {
        // Create a MultipartFile from the file path
        var file =
            await http.MultipartFile.fromPath(entry.key, entry.value.path);
        request.files.add(file);
      }
    }

    try {
      log("Sending request to: $url");
      final response =
          await request.send().timeout(const Duration(seconds: 10));
      final responseBody = await response.stream.bytesToString();
      var decodedResponse;

      // Check if the status code is successful
      if (response.statusCode == 200) {
        decodedResponse = json.decode(responseBody);
        log("decoded response: $decodedResponse");

        // Check if response contains 'value' and handle accordingly
        if (decodedResponse['value'] == true) {
          return decodedResponse;
        } else {
          String errorMsg = decodedResponse['message'] ?? 'An error occurred';
          throw EndpointException(errorMsg: errorMsg);
        }
      } else {
        _handleHttpResponse(response.statusCode, responseBody);
      }
    } on TimeoutException {
      throw TimeoutException("Request timeout.");
    } catch (e) {
      log("Error: $e");
      rethrow;
    }
  }

  static void _handleHttpResponse(int statusCode, String responseBody) {
    var decodedResponse = json.decode(responseBody);
    String errorMsg =
        decodedResponse['message'] ?? 'An unexpected error occurred.';

    if (statusCode == 401) {
      throw UnAuthorizedException();
    } else if (statusCode == 404) {
      throw NotfoundException();
    } else if (statusCode == 500) {
      throw ServerException();
    } else {
      throw EndpointException(errorMsg: errorMsg);
    }
  }
}
