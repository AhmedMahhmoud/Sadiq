import 'package:sadiq/Features/Authentication/Data/Models/city.dart';
import 'package:sadiq/Features/Authentication/Data/Models/delivery_company.dart';

class Driver {
  int? id;
  String cityId;
  City? city;
  String deliveryBagId;
  String deliveryCompanyId;
  DeliveryCompany? deliveryCompany;
  String type;
  String firstName;
  String lastName;
  String phone;
  String email;
  String avatar;
  String identityFile;
  String formFile;
  String drivingLicenseFile;
  String identityNo;
  String nationality;
  String dateOfBirth;
  String isReady;
  String latitude;
  String longitude;
  String bodyTemperature;
  String address;
  String status;
  String walletSum;

  Driver({
    this.id,
    required this.cityId,
    this.city,
    required this.deliveryBagId,
    required this.deliveryCompanyId,
    this.deliveryCompany,
    required this.type,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.avatar,
    required this.identityFile,
    required this.formFile,
    required this.drivingLicenseFile,
    required this.identityNo,
    required this.nationality,
    required this.dateOfBirth,
    required this.isReady,
    required this.latitude,
    required this.longitude,
    required this.bodyTemperature,
    required this.address,
    required this.status,
    required this.walletSum,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['id'],
      cityId: json['city_id'] ?? '',
      city: json['city'] != null ? City.fromJson(json['city']) : null,
      deliveryBagId: json['delivery_bag_id'] ?? '',
      deliveryCompanyId: json['delivery_company_id'] ?? '',
      deliveryCompany: json['delivery_company'] != null
          ? DeliveryCompany.fromJson(json['delivery_company'])
          : null,
      type: json['type'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      avatar: json['avatar'] ?? '',
      identityFile: json['identity_file'] ?? '',
      formFile: json['form_file'] ?? '',
      drivingLicenseFile: json['driving_license_file'] ?? '',
      identityNo: json['identity_no'] ?? '',
      nationality: json['nationality'] ?? '',
      dateOfBirth: json['date_of_birth'] ?? '',
      isReady: json['is_ready'] ?? '',
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
      bodyTemperature: json['body_temperature'] ?? '',
      address: json['address'] ?? '',
      status: json['status'] ?? '',
      walletSum: json['wallet_sum'] ?? '',
    );
  }
}
