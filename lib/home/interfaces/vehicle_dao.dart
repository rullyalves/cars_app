import 'package:desafio_dryve/home/models/vehicle.dart';


abstract class VehicleDao {

  Future<List<Vehicle>> findAll();

  Stream<List<Vehicle>> findAllAsStream();

  Future<void> saveAll(List<Vehicle> vehicles);

  Future<void> update(Vehicle vehicle);

  Future<void> delete(Vehicle vehicle);
  
}
