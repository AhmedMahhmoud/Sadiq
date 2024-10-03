class Shipment {
  final int? id;
  final String? title;
  final String? details;
  final String? additionalInformation;
  final String? paymentType;
  final String? receivingAddress;
  final String? receivingDateTime;
  final String? receivingLatitude;
  final String? receivingLongitude;
  final String? deliveryAddress;
  final String? deliveryDateTime;
  final String? deliveryLatitude;
  final String? deliveryLongitude;
  final String? shippingPrice;
  final String? shipmentPrice;
  final String? totalPrice;
  final String? userName;
  final String? userPhone;
  final String? city;
  final String? cityId;
  final String? cityO;
  final String? status;
  final String? driverId;
  final String? driver;
  final String? invoiceFile;
  final String? willBeLate;
  final bool? isReview;
  final String? review;

  Shipment({
    this.id,
    this.title,
    this.details,
    this.additionalInformation,
    this.paymentType,
    this.receivingAddress,
    this.receivingDateTime,
    this.receivingLatitude,
    this.receivingLongitude,
    this.deliveryAddress,
    this.deliveryDateTime,
    this.deliveryLatitude,
    this.deliveryLongitude,
    this.shippingPrice,
    this.shipmentPrice,
    this.totalPrice,
    this.userName,
    this.userPhone,
    this.city,
    this.cityId,
    this.cityO,
    this.status,
    this.driverId,
    this.driver,
    this.invoiceFile,
    this.willBeLate,
    this.isReview,
    this.review,
  });

  // Factory method for converting JSON to Shipment object with null checks
  factory Shipment.fromJson(Map<String, dynamic> json) {
    return Shipment(
      id: json['id'], // Keep id as nullable since it could be null
      title: json['title'] ?? '',
      details: json['details'] ?? '',
      additionalInformation: json['additional_information'] ?? '',
      paymentType: json['payment_type'] ?? '',
      receivingAddress: json['receiving_address'] ?? '',
      receivingDateTime: json['receiving_date_time'] ?? '',
      receivingLatitude: json['receiving_latitude'] ?? '',
      receivingLongitude: json['receiving_longitude'] ?? '',
      deliveryAddress: json['delivery_address'] ?? '',
      deliveryDateTime: json['delivery_date_time'] ?? '',
      deliveryLatitude: json['delivery_latitude'] ?? '',
      deliveryLongitude: json['delivery_longitude'] ?? '',
      shippingPrice: json['shipping_price'] ?? '',
      shipmentPrice: json['shipment_price'] ?? '',
      totalPrice: json['total_price'] ?? '',
      userName: json['user_name'] ?? '',
      userPhone: json['user_phone'] ?? '',
      city: json['city'] ?? '',
      cityId: json['city_id'] ?? '',
      cityO: json['city_o'] ?? '',
      status: json['status'] ?? '',
      driverId: json['driver_id'] ?? '',
      driver: json['driver'] ?? '',
      invoiceFile: json['invoice_file'] ?? '',
      willBeLate: json['will_be_late'] ?? '',
      isReview:
          json['is_review'] == 1 ? true : false, // Convert to bool if needed
      review: json['review'] ?? '',
    );
  }

  static List<Shipment> parseShipmentsList(json) {
    final list = json as List;
    return list.map((e) => Shipment.fromJson(e)).toList();
  }
}
