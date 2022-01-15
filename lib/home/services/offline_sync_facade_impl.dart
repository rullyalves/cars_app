import 'dart:async';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:desafio_dryve/home/interfaces/brand_facade.dart';
import 'package:desafio_dryve/home/interfaces/color_facade.dart';
import 'package:desafio_dryve/home/interfaces/offline_sync_facade.dart';
import 'package:desafio_dryve/home/interfaces/vehicle_facade.dart';

class OfflineSyncFacadeImpl implements OfflineSyncFacade {
  final DataConnectionChecker _dataConnectionChecker;
  final ColorFacade _colorFacade;
  final BrandFacade _brandFacade;
  final VehicleFacade _vehicleFacade;
  StreamSubscription? _subscription;

  OfflineSyncFacadeImpl(
    this._dataConnectionChecker,
    this._colorFacade,
    this._brandFacade,
    this._vehicleFacade,
  );

  void _syncCache() {
    _vehicleFacade.findAllVehicles();
    _colorFacade.findAllColors();
    _brandFacade.findAllBrands();
  }

  @override
  void syncDataWithNetwork() async {
    _dataConnectionChecker.checkInterval = const Duration(seconds: 3);
    _subscription = _dataConnectionChecker.onStatusChange
        .distinct()
        .where((event) => event == DataConnectionStatus.connected)
        .listen((event) {
      _syncCache();
    });
  }

  Future<void> stopSync() async {
    await _subscription?.cancel();
    _subscription = null;
  }
}
