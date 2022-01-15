import 'dart:async';
import 'dart:convert';
import 'package:desafio_dryve/home/interfaces/favorite_dao.dart';
import 'package:hive/hive.dart';

class HiveFavoriteDao implements FavoriteDao {
  HiveFavoriteDao() {
    _boxCompleter.complete(Hive.openBox(_kBoxKey));
  }

  final _boxCompleter = Completer<Box>();
  static const String _kBoxKey = "favorites";

  @override
  Future<List<int>> findAll() async {
    final box = await _boxCompleter.future;
    final data = box.get(_kBoxKey);
    if (data == null) {
      return [];
    }

    return List.from(jsonDecode(data));
  }

  @override
  Stream<List<int>> findAllAsStream() async* {
    final box = await _boxCompleter.future;

    yield List<int>.from(box.get(_kBoxKey));

    await for (final event in box.watch(key: _kBoxKey)) {
      yield List<int>.from(event.value);
    }
  }

  @override
  Future<void> saveAll(Iterable<int> vehicles) async {
    final box = await _boxCompleter.future;
    await box.put(_kBoxKey, jsonEncode(vehicles));
  }
}
