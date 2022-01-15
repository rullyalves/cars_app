import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:desafio_dryve/home/interfaces/vehicle_dao.dart';
import 'package:desafio_dryve/home/models/vehicle.dart';
import 'package:desafio_dryve/home/pages/home/stores/filter_store.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  
  _HomeStoreBase(this._vehicleDao, this._dataConnectionChecker);
    
  final VehicleDao _vehicleDao;
  final DataConnectionChecker _dataConnectionChecker;

  @observable
  late ObservableStream<DataConnectionStatus> _connectionStatus = _dataConnectionChecker.onStatusChange.asObservable();

  ObservableStream<DataConnectionStatus> get connectionStatus => _connectionStatus;

  @computed
  bool get isDisconnected => connectionStatus.value == DataConnectionStatus.disconnected;

  @observable
  late ObservableStream<List<Vehicle>> _vehicles = _vehicleDao.findAllAsStream().asObservable();

  ObservableStream<List<Vehicle>> get vehicles => _vehicles;

  @computed
  bool get isLoading => _vehicles.status == StreamStatus.waiting;

  @observable
  ObservableSet<int> filterBrands = ObservableSet<int>();

  @observable
  ObservableSet<int> filterColors = ObservableSet<int>();

  @observable
  ObservableList<Filter<Vehicle>> filters = <Filter<Vehicle>>[].asObservable();

  @action
  void filter() {
    filters.clear();

    if(filterBrands.isNotEmpty) {
      final filter = (List<Vehicle> vechileList) => vechileList.where((element) => filterBrands.contains(element.brandId)).toList();
      filters.add(filter);
    }

    if(filterColors.isNotEmpty) {
      final filter = (List<Vehicle> vechileList) => vechileList.where((element) => filterColors.contains(element.colorId)).toList();
      filters.add(filter);
    }

   final filterChain = FilterChain<Vehicle>(filters);
   _vehicles = _vehicleDao.findAllAsStream().map(filterChain.doFilter).asObservable();
  }

  @action
  void clearFilters() {
    filters.clear();
    _vehicles = _vehicleDao.findAllAsStream().asObservable();
  }
}
