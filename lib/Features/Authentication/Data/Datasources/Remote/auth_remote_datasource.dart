// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:sadiq/Features/Authentication/Data/Models/register_model.dart';
import 'package:sadiq/Features/Authentication/Data/Models/register_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/login_model.dart';
import '../../../../../Core/Constants/api_constants.dart';
import '../../../../../Core/Network/form_data_service.dart';

class AuthRemoteDS {
  AuthRemoteDS();

  Future<LoginModel> authLogin(
      {required String email, required String password}) async {
    final fields = {'email': email, 'password': password};

    final url = Uri.parse(
      baseUrl + auth + login,
    );
    final decodedResp = await FormDataService.sendRequest(
      url,
      fields,
    );
    print('response $decodedResp');
    LoginModel loginModel = LoginModel.fromJson(decodedResp['data']);
    final pref = await SharedPreferences.getInstance();

    String jsonString = json.encode(fields);
    await pref.setString('loginData', jsonString);

    return loginModel;
  }

  Future<RegisterResponse>  authRegister(RegisterInputs registerInputs) async {
    final fields = registerInputs.toJson();

    final url = Uri.parse(
      baseUrl + auth + register,
    );
    Map<String, File> files = {
      'identity_file': registerInputs.identityFile,
      'form_file': registerInputs.formFile,
      'driving_license_file': registerInputs.drivingLicenseFile,
    };
    final decodedResp =
        await FormDataService.sendRequest(url, fields, null, files);
    print('response $decodedResp');
    RegisterResponse registerResponse =
        RegisterResponse.fromJson(decodedResp['data']);
    inspect(registerResponse);

    return registerResponse;
  }
}
