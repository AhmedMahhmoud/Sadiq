import 'package:sadiq/Core/Constants/api_constants.dart';
import 'package:sadiq/Core/Network/network_service.dart';
import 'package:sadiq/Features/shipments/data/models/shipments_model.dart';

class ShipmentsDataSource {
  final GetNetworkService networkService;
  ShipmentsDataSource({required this.networkService});
  Future<List<Shipment>> getNewShipments() async {
    final response =
        await networkService.get(baseUrl + shipments + newShipments);
    return Shipment.parseShipmentsList(response['data']['shipments']);
  }
}
