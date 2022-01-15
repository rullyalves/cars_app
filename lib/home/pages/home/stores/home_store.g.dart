// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<bool>? _$isDisconnectedComputed;

  @override
  bool get isDisconnected =>
      (_$isDisconnectedComputed ??= Computed<bool>(() => super.isDisconnected,
              name: '_HomeStoreBase.isDisconnected'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_HomeStoreBase.isLoading'))
          .value;

  final _$_connectionStatusAtom =
      Atom(name: '_HomeStoreBase._connectionStatus');

  @override
  ObservableStream<DataConnectionStatus> get _connectionStatus {
    _$_connectionStatusAtom.reportRead();
    return super._connectionStatus;
  }

  @override
  set _connectionStatus(ObservableStream<DataConnectionStatus> value) {
    _$_connectionStatusAtom.reportWrite(value, super._connectionStatus, () {
      super._connectionStatus = value;
    });
  }

  final _$_vehiclesAtom = Atom(name: '_HomeStoreBase._vehicles');

  @override
  ObservableStream<List<Vehicle>> get _vehicles {
    _$_vehiclesAtom.reportRead();
    return super._vehicles;
  }

  @override
  set _vehicles(ObservableStream<List<Vehicle>> value) {
    _$_vehiclesAtom.reportWrite(value, super._vehicles, () {
      super._vehicles = value;
    });
  }

  final _$filterBrandsAtom = Atom(name: '_HomeStoreBase.filterBrands');

  @override
  ObservableSet<int> get filterBrands {
    _$filterBrandsAtom.reportRead();
    return super.filterBrands;
  }

  @override
  set filterBrands(ObservableSet<int> value) {
    _$filterBrandsAtom.reportWrite(value, super.filterBrands, () {
      super.filterBrands = value;
    });
  }

  final _$filterColorsAtom = Atom(name: '_HomeStoreBase.filterColors');

  @override
  ObservableSet<int> get filterColors {
    _$filterColorsAtom.reportRead();
    return super.filterColors;
  }

  @override
  set filterColors(ObservableSet<int> value) {
    _$filterColorsAtom.reportWrite(value, super.filterColors, () {
      super.filterColors = value;
    });
  }

  final _$filtersAtom = Atom(name: '_HomeStoreBase.filters');

  @override
  ObservableList<Filter<Vehicle>> get filters {
    _$filtersAtom.reportRead();
    return super.filters;
  }

  @override
  set filters(ObservableList<Filter<Vehicle>> value) {
    _$filtersAtom.reportWrite(value, super.filters, () {
      super.filters = value;
    });
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void filter() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.filter');
    try {
      return super.filter();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilters() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.clearFilters');
    try {
      return super.clearFilters();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filterBrands: ${filterBrands},
filterColors: ${filterColors},
filters: ${filters},
isDisconnected: ${isDisconnected},
isLoading: ${isLoading}
    ''';
  }
}
