import 'package:desafio_dryve/home/interfaces/brand_dao.dart';
import 'package:desafio_dryve/home/models/brand.dart';
import 'package:mobx/mobx.dart';
import 'package:desafio_dryve/shared/utils/string_filter_utils.dart';
part 'mark_store.g.dart';

class MarkStore = _MarkStoreBase with _$MarkStore;

abstract class _MarkStoreBase with Store {
  final BrandDao _brandDao;

  _MarkStoreBase(this._brandDao);

  @observable
  String searchTerm = "";

  @observable
  late ObservableStream<List<Brand>> _brands = _brandDao.findAllAsStream().asObservable();
  
  @computed
  List<Brand>? get brands {
    final items = _brands.value;

    if(items == null) {
      return null;
    }

    if (searchTerm.isEmpty) {
      return items;
    } else {
      return items
          .where((element) => element.name.containsAny(searchTerm))
          .toList();
    }
  }

  @observable
  ObservableSet<int> _filterBrands = ObservableSet<int>();
  ObservableSet<int> get filterBrands => _filterBrands;

  bool contains(int brandId) {
    return _filterBrands.contains(brandId);
  }
  
  @action
  void addBrand(int brandId) {
    _filterBrands = {..._filterBrands, brandId}.asObservable();
  }

  @action
  void removeBrand(int brandId) {
    final newSet = Set.of(_filterBrands);
    newSet.remove(brandId);
    _filterBrands = newSet.asObservable();
  }

  @action
  void clear() {
    _filterBrands = ObservableSet<int>();
  }
}
