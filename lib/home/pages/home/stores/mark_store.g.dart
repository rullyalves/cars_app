// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MarkStore on _MarkStoreBase, Store {
  Computed<List<Brand>?>? _$brandsComputed;

  @override
  List<Brand>? get brands =>
      (_$brandsComputed ??= Computed<List<Brand>?>(() => super.brands,
              name: '_MarkStoreBase.brands'))
          .value;

  final _$searchTermAtom = Atom(name: '_MarkStoreBase.searchTerm');

  @override
  String get searchTerm {
    _$searchTermAtom.reportRead();
    return super.searchTerm;
  }

  @override
  set searchTerm(String value) {
    _$searchTermAtom.reportWrite(value, super.searchTerm, () {
      super.searchTerm = value;
    });
  }

  final _$_brandsAtom = Atom(name: '_MarkStoreBase._brands');

  @override
  ObservableStream<List<Brand>> get _brands {
    _$_brandsAtom.reportRead();
    return super._brands;
  }

  @override
  set _brands(ObservableStream<List<Brand>> value) {
    _$_brandsAtom.reportWrite(value, super._brands, () {
      super._brands = value;
    });
  }

  final _$_filterBrandsAtom = Atom(name: '_MarkStoreBase._filterBrands');

  @override
  ObservableSet<int> get _filterBrands {
    _$_filterBrandsAtom.reportRead();
    return super._filterBrands;
  }

  @override
  set _filterBrands(ObservableSet<int> value) {
    _$_filterBrandsAtom.reportWrite(value, super._filterBrands, () {
      super._filterBrands = value;
    });
  }

  final _$_MarkStoreBaseActionController =
      ActionController(name: '_MarkStoreBase');

  @override
  void addBrand(int brandId) {
    final _$actionInfo = _$_MarkStoreBaseActionController.startAction(
        name: '_MarkStoreBase.addBrand');
    try {
      return super.addBrand(brandId);
    } finally {
      _$_MarkStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeBrand(int brandId) {
    final _$actionInfo = _$_MarkStoreBaseActionController.startAction(
        name: '_MarkStoreBase.removeBrand');
    try {
      return super.removeBrand(brandId);
    } finally {
      _$_MarkStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$_MarkStoreBaseActionController.startAction(
        name: '_MarkStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$_MarkStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchTerm: ${searchTerm},
brands: ${brands}
    ''';
  }
}
