

import '../models/vehicle.dart';

abstract class VehicleRepository{
   Future<List<Vehicle>> findAll();
}