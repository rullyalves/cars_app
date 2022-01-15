import 'package:desafio_dryve/home/data/hive_favorite_dao.dart';
import 'package:desafio_dryve/home/models/vehicle.dart';
import 'package:mobx/mobx.dart';
part 'favorite_store.g.dart';

class FavoriteStore = _FavoriteStoreBase with _$FavoriteStore;

abstract class _FavoriteStoreBase with Store {
  final HiveFavoriteDao _hiveFavoriteDao;

  @observable
  ObservableSet<int> _vehicles = ObservableSet<int>();

  ObservableSet<int> get vehicles => _vehicles;

  _FavoriteStoreBase(this._hiveFavoriteDao) {
    _hiveFavoriteDao
        .findAll()
        .then((value) => _vehicles = ObservableSet<int>.of(value));
  }

  bool contains(int vehicleId) {
    return vehicles.contains(vehicleId);
  }

  @action
  void add(int vehicleId) {
    _vehicles.add(vehicleId);
    _saveOrReplace();
  }

  @action
  void remove(int vehicleId) {
    _vehicles.remove(vehicleId);
    _saveOrReplace();
  }

  void _saveOrReplace() {
    _hiveFavoriteDao.saveAll(List.from(_vehicles));
  }
}
