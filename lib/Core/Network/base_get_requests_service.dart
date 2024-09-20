import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Constants/constants.dart';

class BaseGetRequestsService {
  Future<dynamic> get(String url,
      {Map<String, String>? additionalHeaders}) async {
    final headers = {
      'Content-Type': 'application/json',
      //'Authorization': 'Bearer ${UserSingelton.user.token}'
    };
    print("going to url : $url");
    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }

    final response = await http.get(Uri.parse('${Constants.baseUrl}/$url'),
        headers: headers);
    return _processResponse(response);
  }

  dynamic _processResponse(http.Response response) {
    print(json.decode(response.body)['message']);

    return json.decode(response.body);
  }
}
