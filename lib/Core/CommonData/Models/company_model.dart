class CompanyModel {
  final int id;
  final String name;
  final String details;
  final String avatar;
  final String? commercialRecordNumber;
  final String? taxNumber;
  final String? companyAddress;
  final String? landlineNumber;
  final String? mobileNumber;
  final String? companyEmail;
  final String? responsiblePerson;
  final String? nationalAddressFile;
  final String? taxCertificateFile;

  CompanyModel({
    required this.id,
    required this.name,
    required this.details,
    required this.avatar,
    this.commercialRecordNumber,
    this.taxNumber,
    this.companyAddress,
    this.landlineNumber,
    this.mobileNumber,
    this.companyEmail,
    this.responsiblePerson,
    this.nationalAddressFile,
    this.taxCertificateFile,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'],
      name: json['name'],
      details: json['details'] ?? '',
      avatar: json['avatar'] ?? '',
      commercialRecordNumber: json['commercial_record_number'] ?? '',
      taxNumber: json['tax_number'] ?? '',
      companyAddress: json['company_address'] ?? '',
      landlineNumber: json['landline_number'] ?? '',
      mobileNumber: json['mobile_number'] ?? '',
      companyEmail: json['company_email'] ?? '',
      responsiblePerson: json['responsible_person'] ?? '',
      nationalAddressFile: json['national_address_file'] ?? '',
      taxCertificateFile: json['tax_certificate_file'] ?? '',
    );
  }

  static List<CompanyModel> parseCompanyList(json) {
    final list = json as List;
    return list.map((e) => CompanyModel.fromJson(e)).toList();
  }
}
