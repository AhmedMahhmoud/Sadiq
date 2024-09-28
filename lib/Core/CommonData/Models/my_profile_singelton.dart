import 'dart:developer';

import 'package:sadiq/Core/CommonData/Models/city_model.dart';
import 'package:sadiq/Core/CommonData/Models/company_model.dart';
import 'package:sadiq/Core/CommonData/Models/driver_model.dart';

class MyProfile {
  static MyProfile? _instance; // Singleton instance

  DriverModel? _driver; // Private driver model instance inside Profile
  String? _accessToken;
  MyProfile._internal();

  // Factory constructor to return the singleton instance
  factory MyProfile() {
    _instance ??= MyProfile._internal();
    return _instance!;
  }

  // Getter for accessing the driver model
  DriverModel? get driver => _driver;
  String? get accessToken => _accessToken;
  // Method to update the driver model
  void setDriver(DriverModel newDriver, [String? token]) {
    log('Profile set successfully ?${hasProfile()}');
    _driver = newDriver;
    if (token != null) _accessToken = token;
    log('Profile set successfully ? ${hasProfile()}');
  }

  // Method to clear the driver profile
  void clearProfile() {
    _driver = null;
    _accessToken = null;
  }

  // Helper method to check if profile exists
  bool hasProfile() {
    return _driver != null;
  }

  void updateAccessToken(String newToken) {
    _accessToken = newToken;
  }

  void updateDriver({
    int? id,
    CityModel? city,
    CompanyModel? company,
    double? latitude,
    double? longitude,
    double? bodyTemperature,
    String? cityID,
    String? deliveryBagID,
    String? deliveryBag,
    String? deliveryCompanyId,
    String? type,
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    String? avatar,
    String? identityFile,
    String? formFile,
    String? drivingLicenseFile,
    String? identityNo,
    String? nationality,
    String? dateOfBirth,
    String? isReady,
    String? address,
    String? status,
    String? walletSum,
  }) {
    if (_driver != null) {
      // Update the driver model using the copyWith method
      _driver = _driver!.copyWith(
        id: id,
        city: city,
        company: company,
        latitude: latitude,
        longitude: longitude,
        bodyTemperature: bodyTemperature,
        cityID: cityID,
        deliveryBagID: deliveryBagID,
        deliveryBag: deliveryBag,
        deliveryCompanyId: deliveryCompanyId,
        type: type,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        email: email,
        avatar: avatar,
        identityFile: identityFile,
        formFile: formFile,
        drivingLicenseFile: drivingLicenseFile,
        identityNo: identityNo,
        nationality: nationality,
        dateOfBirth: dateOfBirth,
        isReady: isReady,
        address: address,
        status: status,
        walletSum: walletSum,
      );
      log('Profile updated successfully');
    } else {
      print('No profile is set. Please set the profile first.');
    }
  }
}
