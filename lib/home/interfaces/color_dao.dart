import 'package:desafio_dryve/home/models/color.dart';

abstract class ColorDao {

  Future<List<ColorModel>> findAll();

  Stream<List<ColorModel>> findAllAsStream();

  Future<void> saveAll(List<ColorModel> vehicles);

  Future<void> update(ColorModel vehicle);

  Future<void> delete(ColorModel vehicle);
  
}
