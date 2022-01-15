import 'package:desafio_dryve/home/models/brand.dart';
import 'package:desafio_dryve/home/models/color.dart';
import 'package:desafio_dryve/home/models/vehicle.dart';

abstract class IVehiclesRepository {
  Future<List<Vehicle>> getVehicles();
  Future<List<ColorModel>> getVehiclesColors();
  Future<List<Brand>> getVehiclesBrands();
}
