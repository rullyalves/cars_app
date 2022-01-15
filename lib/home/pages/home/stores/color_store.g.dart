// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ColorStore on _ColorStoreBase, Store {
  final _$_colorsAtom = Atom(name: '_ColorStoreBase._colors');

  @override
  ObservableStream<List<ColorModel>> get _colors {
    _$_colorsAtom.reportRead();
    return super._colors;
  }

  @override
  set _colors(ObservableStream<List<ColorModel>> value) {
    _$_colorsAtom.reportWrite(value, super._colors, () {
      super._colors = value;
    });
  }

  final _$_filterColorsAtom = Atom(name: '_ColorStoreBase._filterColors');

  @override
  ObservableSet<int> get _filterColors {
    _$_filterColorsAtom.reportRead();
    return super._filterColors;
  }

  @override
  set _filterColors(ObservableSet<int> value) {
    _$_filterColorsAtom.reportWrite(value, super._filterColors, () {
      super._filterColors = value;
    });
  }

  final _$_ColorStoreBaseActionController =
      ActionController(name: '_ColorStoreBase');

  @override
  void addColor(int colorId) {
    final _$actionInfo = _$_ColorStoreBaseActionController.startAction(
        name: '_ColorStoreBase.addColor');
    try {
      return super.addColor(colorId);
    } finally {
      _$_ColorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeColor(int colorId) {
    final _$actionInfo = _$_ColorStoreBaseActionController.startAction(
        name: '_ColorStoreBase.removeColor');
    try {
      return super.removeColor(colorId);
    } finally {
      _$_ColorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$_ColorStoreBaseActionController.startAction(
        name: '_ColorStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$_ColorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
