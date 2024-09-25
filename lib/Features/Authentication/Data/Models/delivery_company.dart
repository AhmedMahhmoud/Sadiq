class DeliveryCompany {
  int? id;
  String? name;
  String? details;
  String? avatar;
  String? commercialRecordNumber;
  String? taxNumber;
  String? companyAddress;
  String? landlineNumber;
  String? mobileNumber;
  String? companyEmail;
  String? responsiblePerson;
  String? nationalAddressFile;
  String? taxCertificateFile;

  DeliveryCompany({
    this.id,
    this.name,
    this.details,
    this.avatar,
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

  factory DeliveryCompany.fromJson(Map<String, dynamic> json) {
    return DeliveryCompany(
      id: json['id'],
      name: json['name'],
      details: json['details'],
      avatar: json['avatar'],
      commercialRecordNumber: json['commercial_record_number'],
      taxNumber: json['tax_number'],
      companyAddress: json['company_address'],
      landlineNumber: json['landline_number'],
      mobileNumber: json['mobile_number'],
      companyEmail: json['company_email'],
      responsiblePerson: json['responsible_person'],
      nationalAddressFile: json['national_address_file'],
      taxCertificateFile: json['tax_certificate_file'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'details': details,
      'avatar': avatar,
      'commercial_record_number': commercialRecordNumber,
      'tax_number': taxNumber,
      'company_address': companyAddress,
      'landline_number': landlineNumber,
      'mobile_number': mobileNumber,
      'company_email': companyEmail,
      'responsible_person': responsiblePerson,
      'national_address_file': nationalAddressFile,
      'tax_certificate_file': taxCertificateFile,
    };
  }
}
