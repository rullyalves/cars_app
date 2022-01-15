import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:desafio_dryve/home/interfaces/vehicle_dao.dart';
import 'package:desafio_dryve/home/interfaces/vehicle_facade.dart';
import 'package:desafio_dryve/home/interfaces/vehicle_repository.dart';
import 'package:desafio_dryve/home/models/vehicle.dart';

class VehicleFacadeImpl implements VehicleFacade {
  final VehicleRepository _vehicleRepository;
  final VehicleDao _vehicleDao;
  final DataConnectionChecker _dataConnectionChecker;

  VehicleFacadeImpl(
      this._vehicleRepository, this._vehicleDao, this._dataConnectionChecker);

  @override
  Stream<List<Vehicle>> findAllVehicles() {
    _dataConnectionChecker.connectionStatus.then((value) {
      if (value == DataConnectionStatus.connected) {
        return _vehicleRepository.findAll().then((value) {
          _vehicleDao.saveAll(value);
        });
      }
    });
    return _vehicleDao.findAllAsStream();
  }
}
