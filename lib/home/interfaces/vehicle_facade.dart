import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:desafio_dryve/home/data/hive_vehicle_dao.dart';
import 'package:desafio_dryve/home/data/vehicle_service.dart';
import 'package:desafio_dryve/home/services/vehicle_facade_impl.dart';
import 'package:desafio_dryve/home/models/vehicle.dart';
import 'package:desafio_dryve/home/services/http_client.dart';

abstract class VehicleFacade {
  Stream<List<Vehicle>> findAllVehicles();

  static VehicleFacade create() {
    return VehicleFacadeImpl(
      RestVehicleRepository(DioHttpClient(baseUrl: "https://run.mocky.io/v3")),
      HiveVehicleDao(),
      DataConnectionChecker(),
    );
  }
}
