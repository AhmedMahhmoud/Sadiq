import 'city_model.dart';
import 'company_model.dart';

class DriverModel {
  final int id;
  final CityModel city;
  final CompanyModel company;
  final double latitude, longitude, bodyTemperature;
  final String cityID,
      deliveryBagID,
      deliveryBag,
      deliveryCompanyId,
      type,
      firstName,
      lastName,
      phone,
      email,
      avatar,
      identityFile,
      formFile,
      drivingLicenseFile,
      identityNo,
      nationality,
      dateOfBirth,
      isReady,
      address,
      status,
      walletSum;

  DriverModel({
    required this.id,
    required this.city,
    required this.company,
    required this.latitude,
    required this.longitude,
    required this.bodyTemperature,
    required this.cityID,
    required this.deliveryBagID,
    required this.deliveryBag,
    required this.deliveryCompanyId,
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
    required this.address,
    required this.status,
    required this.walletSum,
  });

  factory DriverModel.fromJson(Map<String, dynamic> map) {
    return DriverModel(
      id: map['id'] ?? -1,
      city: CityModel.fromJson(map['city'] ?? {}),
      company: CompanyModel.fromJson(map['delivery_company'] ?? {}),
      latitude: map['latitude'].toDouble() ?? -1,
      longitude: map['longitude'].toDouble() ?? -1,
      bodyTemperature: map['body_temperature'].toDouble() ?? -1,
      cityID: map['city_id'] ?? '',
      deliveryBagID: map['delivery_bag_id'] ?? '',
      deliveryBag: map['delivery_bag'] ?? '',
      deliveryCompanyId: map['delivery_company_id'] ?? '',
      type: map['type'] ?? '',
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      avatar: map['avatar'] ?? '',
      identityFile: map['identity_file'] ?? '',
      formFile: map['form_file'] ?? '',
      drivingLicenseFile: map['driving_license_file'] ?? '',
      identityNo: map['identity_no'] ?? '',
      nationality: map['nationality'] ?? '',
      dateOfBirth: map['date_of_birth'] ?? '',
      isReady: map['is_ready'] ?? '',
      address: map['address'] ?? '',
      status: map['status'] ?? '',
      walletSum: map['wallet_sum'] ?? '0.0',
    );
  }
}
