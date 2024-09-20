class CompanyModel {
  final int id;
  final String name,
      details,
      avatar,
      commercialRecordNumber,
      taxNumber,
      companyAddress,
      landlineNumber,
      mobileNumber,
      companyEmail,
      responsiblePerson,
      nationalAddressFile,
      taxCertificateFile;

  CompanyModel({
    required this.id,
    required this.name,
    required this.details,
    required this.avatar,
    required this.commercialRecordNumber,
    required this.taxNumber,
    required this.companyAddress,
    required this.landlineNumber,
    required this.mobileNumber,
    required this.companyEmail,
    required this.responsiblePerson,
    required this.nationalAddressFile,
    required this.taxCertificateFile,
  });
  factory CompanyModel.fromJson(Map<String, dynamic> map) {
    return CompanyModel(
      id: map['id'] ?? -1,
      name: map['name'] ?? '',
      details: map['details'] ?? '',
      avatar: map['avatar'] ?? '',
      commercialRecordNumber: map['commercial_record_number'] ?? '',
      taxNumber: map['tax_number'] ?? '',
      companyAddress: map['company_address'] ?? '',
      landlineNumber: map['landline_number'] ?? '',
      mobileNumber: map['mobile_number'] ?? '',
      companyEmail: map['company_email'] ?? '',
      responsiblePerson: map['responsible_person'] ?? '',
      nationalAddressFile: map['national_address_file'] ?? '',
      taxCertificateFile: map['tax_certificate_file'] ?? '',
    );
  }
}
