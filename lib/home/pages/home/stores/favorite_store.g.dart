// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteStore on _FavoriteStoreBase, Store {
  final _$_vehiclesAtom = Atom(name: '_FavoriteStoreBase._vehicles');

  @override
  ObservableSet<int> get _vehicles {
    _$_vehiclesAtom.reportRead();
    return super._vehicles;
  }

  @override
  set _vehicles(ObservableSet<int> value) {
    _$_vehiclesAtom.reportWrite(value, super._vehicles, () {
      super._vehicles = value;
    });
  }

  final _$_FavoriteStoreBaseActionController =
      ActionController(name: '_FavoriteStoreBase');

  @override
  void add(int vehicleId) {
    final _$actionInfo = _$_FavoriteStoreBaseActionController.startAction(
        name: '_FavoriteStoreBase.add');
    try {
      return super.add(vehicleId);
    } finally {
      _$_FavoriteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(int vehicleId) {
    final _$actionInfo = _$_FavoriteStoreBaseActionController.startAction(
        name: '_FavoriteStoreBase.remove');
    try {
      return super.remove(vehicleId);
    } finally {
      _$_FavoriteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
