class CarModel {
  final int id;
  final String name;
  final String details;
  final String? image;
  final bool isCharge;

  CarModel({
    required this.id,
    required this.name,
    required this.details,
    this.image,
    required this.isCharge,
  });

  // Factory method to create a CarModel from JSON
  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'] as int,
      name: json['name'] as String,
      details: json['details'] ?? '',
      image: json['image'] as String?, // Use nullable for image
      isCharge: json['is_charge'] == '1', // Convert '1' or '0' to bool
    );
  }
  static List<CarModel> parseCars(json) {
    final list = json as List;
    return list.map((e) => CarModel.fromJson(e)).toList();
  }
}
