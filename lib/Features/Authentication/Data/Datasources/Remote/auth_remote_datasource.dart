// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:sadiq/Features/DeliveryCars/Data/Models/car_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/login_model.dart';
import '../../../../../Core/Constants/api_constants.dart';
import '../../../../../Core/Network/form_data_service.dart';

class AuthRemoteDS {
  AuthRemoteDS();

  Future<LoginModel> authLogin(
      {required String email, required String password}) async {
    final fields = {'email': email, 'password': password};
    print(fields);

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

}
