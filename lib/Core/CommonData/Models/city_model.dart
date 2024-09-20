class CityModel {
  final int id;
  final String name;

  CityModel({
    required this.id,
    required this.name,
  });

  factory CityModel.fromJson(Map<String, dynamic> map) {
    return CityModel(
      id: map['id'] ?? -1,
      name: map['name'] ?? '',
    );
  }
}
