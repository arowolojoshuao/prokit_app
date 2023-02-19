// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MIAStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MIAStore on MIAStoreBase, Store {
  final _$addedMealsAtom = Atom(name: 'MIAStoreBase.addedMeals');

  @override
  List<MIAMealModel> get addedMeals {
    _$addedMealsAtom.reportRead();
    return super.addedMeals;
  }

  @override
  set addedMeals(List<MIAMealModel> value) {
    _$addedMealsAtom.reportWrite(value, super.addedMeals, () {
      super.addedMeals = value;
    });
  }

  final _$MIAStoreBaseActionController = ActionController(name: 'MIAStoreBase');

  @override
  void addMeal({required String header, required MIAMealModel element}) {
    final _$actionInfo = _$MIAStoreBaseActionController.startAction(name: 'MIAStoreBase.addMeal');
    try {
      return super.addMeal(header: header, element: element);
    } finally {
      _$MIAStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
addedMeals: ${addedMeals}
    ''';
  }
}
