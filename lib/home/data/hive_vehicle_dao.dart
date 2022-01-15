import 'dart:async';
import 'dart:convert';
import 'package:desafio_dryve/home/interfaces/vehicle_dao.dart';
import 'package:desafio_dryve/home/models/vehicle.dart';
import 'package:hive/hive.dart';

class HiveVehicleDao implements VehicleDao {
  HiveVehicleDao() {
    _boxCompleter.complete(Hive.openBox(_BOXKEY));
  }

  final _boxCompleter = Completer<Box>();
  static const String _BOXKEY = "vehicle";

  List<Vehicle> _map(dynamic value) {
    if (value == null) {
      return [];
    }
    final items = jsonDecode(value) as List;
    return items.map((e) => Vehicle.fromJson(e)).toList();
  }

  @override
  Future<void> delete(Vehicle vehicle) async {
    final box = await _boxCompleter.future;
    final items = await findAll();

    items.remove(vehicle);
    await box.put(_BOXKEY, jsonEncode(items));
  }

  @override
  Future<List<Vehicle>> findAll() async {
    final box = await _boxCompleter.future;
    final data = box.get(_BOXKEY);
    if (data == null) {
      return [];
    }

    final decoded = jsonDecode(data) as List;
    return decoded.map((e) => Vehicle.fromJson(e)).toList();
  }

  @override
  Stream<List<Vehicle>> findAllAsStream() async* {
    final box = await _boxCompleter.future;

    yield _map(box.get(_BOXKEY));

    await for (final event in box.watch(key: _BOXKEY)) {
      yield _map(event.value);
    }
  }

  @override
  Future<void> saveAll(List<Vehicle> vehicles) async {
    final box = await _boxCompleter.future;
    await box.put(_BOXKEY, jsonEncode(vehicles));
  }

  @override
  Future<void> update(Vehicle vehicle) async {
    final box = await _boxCompleter.future;
    final items = await findAll();
    final index = items.indexOf(vehicle);
    items[index] = vehicle;
    await box.put(_BOXKEY, jsonEncode(items));
  }
}
