import 'package:sadiq/Core/Constants/type_def/type_def.dart';
import 'package:sadiq/Core/Network/connection_checker.dart';
import 'package:sadiq/Core/Network/repo_implementer.dart';
import 'package:sadiq/Features/shipments/data/datasources/shipments_datasource.dart';
import 'package:sadiq/Features/shipments/data/models/shipments_model.dart';

class ShipmentsRepo {
  final ShipmentsDataSource shipmentsDataSource;
  final ConnectionChecker connectionChecker;

  ShipmentsRepo(
      {required this.shipmentsDataSource, required this.connectionChecker});

  futureEither<List<Shipment>> getNewShipments() async {
    return RepoImplementerHandler.apiCall(() async {
      return shipmentsDataSource.getNewShipments();
    }, connectionChecker);
  }
}
