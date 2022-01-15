class Vehicle {
  Vehicle({
    required this.id,
    required this.imageUrl,
    required this.brandName,
    required this.modelName,
    required this.modelYear,
    required this.fuelType,
    required this.mileage,
    required this.transmissionType,
    required this.price,
    required this.brandId,
    required this.colorId,
  });

  final int id;
  final String imageUrl;
  final String brandName;
  final String modelName;
  final int modelYear;
  final String fuelType;
  final int mileage;
  final String transmissionType;
  final int price;
  final int brandId;
  final int colorId;

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    final vehicleId = json['id'];
    return Vehicle(
      id: vehicleId is String ? int.parse(vehicleId) : vehicleId,
      imageUrl: json['image_url'],
      brandName: json['brand_name'],
      modelName: json['model_name'],
      modelYear: json['model_year'],
      fuelType: json['fuel_type'],
      mileage: json['mileage'],
      transmissionType: json['transmission_type'],
      price: json['price'],
      brandId: json['brand_id'],
      colorId: json['color_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['brand_name'] = this.brandName;
    data['model_name'] = this.modelName;
    data['model_year'] = this.modelYear;
    data['fuel_type'] = this.fuelType;
    data['mileage'] = this.mileage;
    data['transmission_type'] = this.transmissionType;
    data['price'] = this.price;
    data['brand_id'] = this.brandId;
    data['color_id'] = this.colorId;
    return data;
  }
}
