import 'package:desafio_dryve/home/interfaces/color_dao.dart';
import 'package:desafio_dryve/home/models/color.dart';
import 'package:mobx/mobx.dart';
part 'color_store.g.dart';

class ColorStore = _ColorStoreBase with _$ColorStore;

abstract class _ColorStoreBase with Store {
  _ColorStoreBase(this._colorDao);
  final ColorDao _colorDao;

  @observable
  late ObservableStream<List<ColorModel>> _colors = _colorDao.findAllAsStream().asObservable();

  ObservableStream<List<ColorModel>> get colors => _colors;

  @observable
  ObservableSet<int> _filterColors = ObservableSet<int>();
  ObservableSet<int> get filterColors => _filterColors;

  bool contains(int colorId) {
    return _filterColors.contains(colorId);
  }
 
  @action
  void addColor(int colorId) {
    _filterColors = {...filterColors, colorId}.asObservable();
  }
  
  @action
  void removeColor(int colorId) {
    final newSet = Set.of(_filterColors);
    newSet.remove(colorId);
    _filterColors = newSet.asObservable();
  }

  @action
  void clear() {
    _filterColors = ObservableSet<int>();
  }
}
