import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Core/CommonData/Models/my_profile_singelton.dart';
import 'package:sadiq/Features/Profile/Data/Model/update_profile_inputs.dart';
import 'package:sadiq/Features/Profile/View/cubit/profile_cubit.dart';

mixin ProfileMixin on Cubit<ProfileState> {
  late UpdateProfileInputs updateProfileInputs;
  final TextEditingController firstNameContr = TextEditingController();
  final TextEditingController lastNameContr = TextEditingController();
  final TextEditingController phoneContr = TextEditingController();
  final TextEditingController mailContr = TextEditingController();
  final TextEditingController birthContr = TextEditingController();

  fillProfileInputs() {
    final myprofile = MyProfile().driver;
    inspect(myprofile);
    if (myprofile != null) {
      updateProfileInputs = UpdateProfileInputs(
        birthdate: myprofile.dateOfBirth,
        email: myprofile.email,
        firstName: myprofile.firstName,
        phone: myprofile.phone,
        secondName: myprofile.lastName,
      );

      firstNameContr.text = myprofile.firstName;
      lastNameContr.text = myprofile.lastName;
      phoneContr.text = myprofile.phone;
      mailContr.text = myprofile.email;
      birthContr.text = myprofile.dateOfBirth;
    }
  }

  disposeControllers() {
    firstNameContr.dispose();
    lastNameContr.dispose();
    phoneContr.dispose();
    mailContr.dispose();
    birthContr.dispose();
  }
}
