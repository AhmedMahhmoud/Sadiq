import 'dart:io';

class UpdateProfileInputs {
  String firstName;
  String secondName;
  String email;
  String phone;
  String birthdate;
  File? avatar;

  UpdateProfileInputs({
    required this.firstName,
    required this.secondName,
    required this.email,
    required this.phone,
    required this.birthdate,
    this.avatar,
  });

  Map<String, String> toJson() {
    final Map<String, String> data = {};
    data['first_name'] = firstName;
    data['last_name'] = secondName;
    data['email'] = email;
    data['phone'] = phone;
    data['date_of_birth'] = birthdate;
    return data;
  }
}
