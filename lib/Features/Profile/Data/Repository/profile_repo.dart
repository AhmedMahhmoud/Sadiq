import 'package:sadiq/Core/CommonData/Models/driver_model.dart';
import 'package:sadiq/Core/Constants/type_def/type_def.dart';
import 'package:sadiq/Core/Network/connection_checker.dart';
import 'package:sadiq/Core/Network/repo_implementer.dart';
import 'package:sadiq/Features/Profile/Data/Datasource/profile_datasource.dart';
import 'package:sadiq/Features/Profile/Data/Model/update_profile_inputs.dart';

class ProfileRepo {
  final ProfileDatasource profileDatasource;
  final ConnectionChecker connectionChecker;

  ProfileRepo({
    required this.profileDatasource,
    required this.connectionChecker,
  });
  futureEither<DriverModel> updateProfile(UpdateProfileInputs inputs) async {
    return RepoImplementerHandler.apiCall(() async {
      return profileDatasource.updateProfile(inputs);
    }, connectionChecker);
  }

  logout() {
    return RepoImplementerHandler.apiCall(() async {
      return profileDatasource.logout();
    }, connectionChecker);
  }
}
