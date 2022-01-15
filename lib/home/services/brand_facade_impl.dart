import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:desafio_dryve/home/interfaces/brand_dao.dart';
import 'package:desafio_dryve/home/interfaces/brand_facade.dart';
import 'package:desafio_dryve/home/interfaces/brand_repository.dart';
import 'package:desafio_dryve/home/models/brand.dart';

class BrandFacadeImpl implements BrandFacade {
  BrandFacadeImpl(
    this._brandRepository,
    this._brandDao,
    this._dataConnectionChecker,
  );

  final BrandRepository _brandRepository;
  final BrandDao _brandDao;
  final DataConnectionChecker _dataConnectionChecker;

  @override
  Stream<List<Brand>> findAllBrands() {
    _dataConnectionChecker.connectionStatus.then((value) {
      if (value == DataConnectionStatus.connected) {
        return _brandRepository.findAll().then((value) {
          _brandDao.saveAll(value);
        });
      }
    });
    return _brandDao.findAllAsStream();
  }
}
