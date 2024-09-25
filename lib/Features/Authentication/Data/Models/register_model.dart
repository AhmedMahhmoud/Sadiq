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

  Map<String, String> toJson() {
    return {
      'city_id': cityID,
      'vehicle_id': vehicleID,
      'type': type,
      'delivery_company_id': deliveryCompanyID,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'email': email,
      'identity_no': identityNo,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'nationality': nationality,
      'date_of_birth': dateofBirth,

      'driving_license_file': drivingLicenseFile.path, // File path
    };
  }
}

class RegisterInputsBuilder {
  String? cityID;
  String? vehicleID;
  String? type;
  String? deliveryCompanyID;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? identityNo;
  String? password;
  String? passwordConfirmation;
  String? nationality;
  String? dateofBirth;
  File? avatar;
  File? identityFile;
  File? formFile;
  File? drivingLicenseFile;

  RegisterInputs build() {
    return RegisterInputs(
      cityID: cityID ?? '',
      vehicleID: vehicleID ?? '',
      type: type ?? '',
      deliveryCompanyID: deliveryCompanyID ?? '',
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      phone: phone ?? '',
      email: email ?? '',
      identityNo: identityNo ?? '',
      password: password ?? '',
      passwordConfirmation: passwordConfirmation ?? '',
      nationality: nationality ?? '',
      dateofBirth: dateofBirth ?? '',
      avatar: avatar ?? File(''),
      identityFile: identityFile ?? File(''),
      formFile: formFile ?? File(''),
      drivingLicenseFile: drivingLicenseFile ?? File(''),
    );
  }
}
