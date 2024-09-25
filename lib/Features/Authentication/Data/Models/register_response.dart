import 'package:sadiq/Features/Authentication/Data/Models/driver_model.dart';

class RegisterResponse {
  Driver? driver;
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  RegisterResponse(
      {this.driver, this.accessToken, this.tokenType, this.expiresIn});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      driver: json['driver'] != null ? Driver.fromJson(json['driver']) : null,
      accessToken: json['access_token'] ?? '',
      tokenType: json['token_type'] ?? '',
      expiresIn: json['expires_in'],
    );
  }
}




