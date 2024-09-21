import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../ErrorHandling/exceptions.dart';

class FormDataService {
  static Future<dynamic> sendRequest(Uri url, Map<String, String> fields,
      [String? token, Map<String, String>? files]) async {
    final request = http.MultipartRequest('POST', url);
    request.fields.addAll(fields);

    if (token != null) {
      request.headers["Authorization"] = 'Bearer $token';
    }
    if (files != null) {
      files.forEach((key, value) async {
        var image = await http.MultipartFile.fromPath(key, value);
        request.files.add(image);
      });
    }
    print(url);
    final response = await request.send();
    var decodedResponse;

    print(response.statusCode);
    final responseBody = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      decodedResponse = json.decode(responseBody);
      log("decoded response:   $decodedResponse");
      return decodedResponse;
    } else if (response.statusCode == 500) {
      throw ServerException();
    } else if (response.statusCode == 401) {
      throw UnAuthorizedException();
    } else {
      String errorMsg = "An unexpected error occurred.";
      decodedResponse = json.decode(responseBody);
      if (decodedResponse["error"] != null) {
        errorMsg = decodedResponse['error'];
      } else if (decodedResponse['message'] != null) {
        errorMsg = decodedResponse['message'];
      }
      print("error msg is $errorMsg");
      throw EndpointException(errorMsg: errorMsg);
    }
  }
}
