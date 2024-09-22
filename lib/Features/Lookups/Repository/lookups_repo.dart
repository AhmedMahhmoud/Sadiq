import 'package:sadiq/Core/CommonData/Models/city_model.dart';
import 'package:sadiq/Core/Constants/type_def/type_def.dart';
import 'package:sadiq/Core/Network/connection_checker.dart';
import 'package:sadiq/Core/Network/repo_implementer.dart';
import 'package:sadiq/Features/Lookups/Datasource/lookup_datasource.dart';

class LookupsRepo {
  final ConnectionChecker connectionChecker;
  final LookupDatasource lookupDatasource;
  LookupsRepo(this.connectionChecker, this.lookupDatasource);
  futureEither<List<CityModel>> getCities() async {
    return RepoImplementerHandler.apiCall(() async {
      return lookupDatasource.getCities();
    }, connectionChecker);
  }
}
