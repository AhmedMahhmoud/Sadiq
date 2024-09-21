import 'dart:io';

class RegisterInputs {
  final String cityID;
  final String vehicleID;
  final String type;
  final String deliveryCompanyID;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String identityNo;
  final String password;
  final String passwordConfirmation;
  final String nationality;
  final String dateofBirth;
  final File avatar;
  final File identityFile;
  final File formFile;
  final File drivingLicenseFile;

  RegisterInputs({
    required this.cityID,
    required this.vehicleID,
    required this.type,
    required this.deliveryCompanyID,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.identityNo,
    required this.password,
    required this.passwordConfirmation,
    required this.nationality,
    required this.dateofBirth,
    required this.avatar,
    required this.identityFile,
    required this.formFile,
    required this.drivingLicenseFile,
  });

  toJson() {
    return {
      'city_id': cityID,
      'vehicle_id': vehicleID,
      'type': type,
      'delivery_company_id': deliveryCompanyID,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'email': deliveryCompanyID,
    };
  }
}
