class Brand {
  Brand({
    required this.brandId,
    required this.name,
    required this.imagePath,
  });

  final int brandId;
  final String name;
  final String imagePath;

  static const imagePaths = {
    '1': "assets/logo_audi.png",
    '2': "assets/logo_chevrolet.png",
    '3': "assets/logo_hyundai.png",
  };

  factory Brand.fromJson(Map<String, dynamic> json) {
    final brandId = json['brand_id'];
    return Brand(
      brandId: brandId is String ? int.parse(brandId) : brandId,
      name: json['name'],
      imagePath: imagePaths[brandId.toString()]!,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagePath'] = imagePath;
    data['brand_id'] = this.brandId;
    data['name'] = this.name;
    return data;
  }
}
