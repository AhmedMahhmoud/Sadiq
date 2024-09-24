import 'package:sadiq/Core/Constants/type_def/type_def.dart';
import 'package:sadiq/Core/Network/connection_checker.dart';
import 'package:sadiq/Core/Network/repo_implementer.dart';
import 'package:sadiq/Features/DeliveryCars/Data/Datasource/cars_datasource.dart';
import 'package:sadiq/Features/DeliveryCars/Data/Models/car_model.dart';

class CarsRepository {
  final ConnectionChecker connectionChecker;
  final CarsDatasource carsDatasource;

  CarsRepository({
    required this.connectionChecker,
    required this.carsDatasource,
  });
  futureEither<List<CarModel>> getCars() {
    return RepoImplementerHandler.apiCall(() async {
      return carsDatasource.getCars();
    }, connectionChecker);
  }
}
