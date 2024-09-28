import 'dart:developer';
import 'dart:io';

import 'package:sadiq/Core/CommonData/Models/driver_model.dart';
import 'package:sadiq/Core/CommonData/Models/my_profile_singelton.dart';
import 'package:sadiq/Core/Constants/api_constants.dart';
import 'package:sadiq/Core/Network/form_data_service.dart';
import 'package:sadiq/Features/Profile/Data/Model/update_profile_inputs.dart';

class ProfileDatasource {
  Future<DriverModel> updateProfile(UpdateProfileInputs inputs) async {
    inspect(inputs);
    final url = Uri.parse(
      baseUrl + profile + update,
    );
    Map<String, File> files = {
      if (inputs.avatar != null) 'avatar': inputs.avatar!,
    };
    final decodedResp = await FormDataService.sendRequest(
        url, inputs.toJson(), MyProfile().accessToken, files);
    print('response $decodedResp');
    DriverModel driverModel = DriverModel.fromJson(decodedResp['data']);
    MyProfile().setDriver(driverModel);
    return driverModel;
  }
}
