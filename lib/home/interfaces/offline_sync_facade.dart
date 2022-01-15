import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:desafio_dryve/home/interfaces/brand_facade.dart';
import 'package:desafio_dryve/home/interfaces/color_facade.dart';
import 'package:desafio_dryve/home/services/offline_sync_facade_impl.dart';
import 'package:desafio_dryve/home/interfaces/vehicle_facade.dart';

abstract class OfflineSyncFacade {
  void syncDataWithNetwork();
  Future<void> stopSync();

  static OfflineSyncFacade create() {
    return OfflineSyncFacadeImpl(
      DataConnectionChecker(),
      ColorFacade.create(),
      BrandFacade.create(),
      VehicleFacade.create(),
    );
  }
}
