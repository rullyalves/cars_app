import 'package:flutter/material.dart';

class ColorModel {
  ColorModel({
    required this.colorId,
    required this.name,
  });

  final int colorId;
  final String name;

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    final colorId = json['color_id'];
    return ColorModel(
      colorId: colorId is String ? int.parse(colorId) : colorId,
      name: json['name'],
    );
  }

  Color get color => colorsMapping[colorId]!;

  static const colorsMapping = {
    1: Colors.white,
    2: Colors.grey,
    3: Colors.black,
    4: Colors.red,
  };

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color_id'] = this.colorId;
    data['name'] = this.name;
    return data;
  }
}
