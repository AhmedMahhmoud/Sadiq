import 'package:sadiq/Core/Constants/api_constants.dart';
import 'package:sadiq/Core/Network/network_service.dart';
import 'package:sadiq/Features/DeliveryCars/Data/Models/car_model.dart';

class CarsDatasource {
  final GetNetworkService networkService;
  CarsDatasource({required this.networkService});
  Future<List<CarModel>> getCars() async {
    final response =
        await networkService.get('$baseUrl/general/delivery-vehicles');
    return CarModel.parseCars(response['data']);
  }
}
