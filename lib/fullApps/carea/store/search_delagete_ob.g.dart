// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_delagete_ob.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchDelegateOb on _SearchDelagateOb, Store {
  late final _$sliderInitialIndexAtom =
      Atom(name: '_SearchDelagateOb.sliderInitialIndex', context: context);

  @override
  double get sliderInitialIndex {
    _$sliderInitialIndexAtom.reportRead();
    return super.sliderInitialIndex;
  }

  @override
  set sliderInitialIndex(double value) {
    _$sliderInitialIndexAtom.reportWrite(value, super.sliderInitialIndex, () {
      super.sliderInitialIndex = value;
    });
  }

  late final _$list_of_imageAtom =
      Atom(name: '_SearchDelagateOb.list_of_image', context: context);

  @override
  List<dynamic> get list_of_image {
    _$list_of_imageAtom.reportRead();
    return super.list_of_image;
  }

  @override
  set list_of_image(List<dynamic> value) {
    _$list_of_imageAtom.reportWrite(value, super.list_of_image, () {
      super.list_of_image = value;
    });
  }

  late final _$bgColorAtom =
      Atom(name: '_SearchDelagateOb.bgColor', context: context);

  @override
  List<dynamic> get bgColor {
    _$bgColorAtom.reportRead();
    return super.bgColor;
  }

  @override
  set bgColor(List<dynamic> value) {
    _$bgColorAtom.reportWrite(value, super.bgColor, () {
      super.bgColor = value;
    });
  }

  late final _$textColorAtom =
      Atom(name: '_SearchDelagateOb.textColor', context: context);

  @override
  List<dynamic> get textColor {
    _$textColorAtom.reportRead();
    return super.textColor;
  }

  @override
  set textColor(List<dynamic> value) {
    _$textColorAtom.reportWrite(value, super.textColor, () {
      super.textColor = value;
    });
  }

  late final _$_SearchDelagateObActionController =
      ActionController(name: '_SearchDelagateOb', context: context);

  @override
  void shuffle() {
    final _$actionInfo = _$_SearchDelagateObActionController.startAction(
        name: '_SearchDelagateOb.shuffle');
    try {
      return super.shuffle();
    } finally {
      _$_SearchDelagateObActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeColor(Color bgColor, Color textColor, int index) {
    final _$actionInfo = _$_SearchDelagateObActionController.startAction(
        name: '_SearchDelagateOb.changeColor');
    try {
      return super.changeColor(bgColor, textColor, index);
    } finally {
      _$_SearchDelagateObActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSlider(double index) {
    final _$actionInfo = _$_SearchDelagateObActionController.startAction(
        name: '_SearchDelagateOb.changeSlider');
    try {
      return super.changeSlider(index);
    } finally {
      _$_SearchDelagateObActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sliderInitialIndex: ${sliderInitialIndex},
list_of_image: ${list_of_image},
bgColor: ${bgColor},
textColor: ${textColor}
    ''';
  }
}
