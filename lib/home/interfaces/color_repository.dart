

import '../models/color.dart';

abstract class ColorRepository{
  Future<List<ColorModel>> findAll();
}