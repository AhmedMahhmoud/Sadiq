import 'package:sadiq/Core/CommonData/Models/city_model.dart';
import 'package:sadiq/Core/CommonData/Models/company_model.dart';
import 'package:sadiq/Core/Constants/api_constants.dart';
import 'package:sadiq/Core/Network/network_service.dart';

class LookupDatasource {
  final GetNetworkService networkService;
  LookupDatasource({required this.networkService});
  Future<List<CityModel>> getCities() async {
    final response = await networkService.get('$baseUrl/general/cities');
    return CityModel.parseCityModelList(response['data']);
  }

  Future<List<CompanyModel>> getCompanies() async {
    final response =
        await networkService.get('$baseUrl/general/delivery-companies');
    return CompanyModel.parseCompanyList(response['data']);
  }
}
