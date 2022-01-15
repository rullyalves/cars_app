import 'dart:async';
import 'dart:convert';

import 'package:desafio_dryve/home/interfaces/color_dao.dart';
import 'package:desafio_dryve/home/models/color.dart';
import 'package:hive/hive.dart';

class HiveColorDao implements ColorDao {
  HiveColorDao() {
    _boxCompleter.complete(Hive.openBox(_kBoxKey));
  }

  final _boxCompleter = Completer<Box>();
  static const String _kBoxKey = "colors";

  List<ColorModel> _map(dynamic value) {
    if (value == null) {
      return [];
    }
    final items = jsonDecode(value) as List;
    return items.map((e) => ColorModel.fromJson(e)).toList();
  }

  @override
  Future<void> delete(ColorModel vehicle) async {
    final box = await _boxCompleter.future;
    final items = await findAll();

    items.remove(vehicle);
    await box.put(_kBoxKey, jsonEncode(items));
  }

  @override
  Future<List<ColorModel>> findAll() async {
    final box = await _boxCompleter.future;
    final data = box.get(_kBoxKey);
    if (data != null) {
      return _map(data);
    }
    return [];
  }

  @override
  Stream<List<ColorModel>> findAllAsStream() async* {
    final box = await _boxCompleter.future;

    yield _map(box.get(_kBoxKey));

    await for (final event in box.watch(key: _kBoxKey)) {
      yield _map(event.value);
    }
  }

  @override
  Future<void> saveAll(List<ColorModel> vehicles) async {
    final box = await _boxCompleter.future;
    await box.put(_kBoxKey, jsonEncode(vehicles));
  }

  @override
  Future<void> update(ColorModel vehicle) async {
    final box = await _boxCompleter.future;
    final items = await findAll();
    final index = items.indexOf(vehicle);
    items[index] = vehicle;
    await box.put(_kBoxKey, jsonEncode(items));
  }
}
