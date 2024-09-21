import '../../../../Core/CommonData/Models/driver_model.dart';

class LoginModel {
  final DriverModel driver;
  final String accessToken;

  LoginModel({
    required this.driver,
    required this.accessToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> map) {
    return LoginModel(
      driver: DriverModel.fromJson(map['driver'] ?? {}),
      accessToken: map['access_token'] ?? '',
    );
  }
}
