import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:desafio_dryve/home/interfaces/color_dao.dart';
import 'package:desafio_dryve/home/interfaces/color_facade.dart';
import 'package:desafio_dryve/home/interfaces/color_repository.dart';
import 'package:desafio_dryve/home/models/color.dart';

class ColorFacadeImpl implements ColorFacade {
  ColorFacadeImpl(
    this._colorRepository,
    this._colorDao,
    this._dataConnectionChecker,
  );
  
  final ColorRepository _colorRepository;
  final ColorDao _colorDao;
  final DataConnectionChecker _dataConnectionChecker;

  @override
  Stream<List<ColorModel>> findAllColors() {
    _dataConnectionChecker.connectionStatus.then((value) {
      if (value == DataConnectionStatus.connected) {
        return _colorRepository.findAll().then((value) {
          _colorDao.saveAll(value);
        });
      }
    });
    return _colorDao.findAllAsStream();
  }
}
