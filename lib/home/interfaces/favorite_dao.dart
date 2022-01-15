import 'package:desafio_dryve/home/data/hive_favorite_dao.dart';

abstract class FavoriteDao {
  Future<List<int>> findAll();

  Stream<List<int>> findAllAsStream();

  Future<void> saveAll(Iterable<int> vehicles);

  static FavoriteDao create() {
    return HiveFavoriteDao();
  }
}
