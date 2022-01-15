

import 'package:desafio_dryve/home/models/brand.dart';

abstract class BrandDao {

  Future<List<Brand>> findAll();

  Stream<List<Brand>> findAllAsStream();

  Future<void> saveAll(List<Brand> vehicles);

  Future<void> update(Brand vehicle);

  Future<void> delete(Brand vehicle);
  
}
