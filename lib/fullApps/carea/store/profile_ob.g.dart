// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_ob.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileOb on _ProfileOb, Store {
  late final _$pickedFileAtom =
      Atom(name: '_ProfileOb.pickedFile', context: context);

  @override
  XFile? get pickedFile {
    _$pickedFileAtom.reportRead();
    return super.pickedFile;
  }

  @override
  set pickedFile(XFile? value) {
    _$pickedFileAtom.reportWrite(value, super.pickedFile, () {
      super.pickedFile = value;
    });
  }

  late final _$pickedValuseOfDropDownMenu1Atom =
      Atom(name: '_ProfileOb.pickedValuseOfDropDownMenu1', context: context);

  @override
  double get pickedValuseOfDropDownMenu1 {
    _$pickedValuseOfDropDownMenu1Atom.reportRead();
    return super.pickedValuseOfDropDownMenu1;
  }

  @override
  set pickedValuseOfDropDownMenu1(double value) {
    _$pickedValuseOfDropDownMenu1Atom
        .reportWrite(value, super.pickedValuseOfDropDownMenu1, () {
      super.pickedValuseOfDropDownMenu1 = value;
    });
  }

  late final _$pickedValuseOfDropDownMenu2Atom =
      Atom(name: '_ProfileOb.pickedValuseOfDropDownMenu2', context: context);

  @override
  double get pickedValuseOfDropDownMenu2 {
    _$pickedValuseOfDropDownMenu2Atom.reportRead();
    return super.pickedValuseOfDropDownMenu2;
  }

  @override
  set pickedValuseOfDropDownMenu2(double value) {
    _$pickedValuseOfDropDownMenu2Atom
        .reportWrite(value, super.pickedValuseOfDropDownMenu2, () {
      super.pickedValuseOfDropDownMenu2 = value;
    });
  }

  late final _$pickImageAsyncAction =
      AsyncAction('_ProfileOb.pickImage', context: context);

  @override
  Future<void> pickImage() {
    return _$pickImageAsyncAction.run(() => super.pickImage());
  }

  @override
  String toString() {
    return '''
pickedFile: ${pickedFile},
pickedValuseOfDropDownMenu1: ${pickedValuseOfDropDownMenu1},
pickedValuseOfDropDownMenu2: ${pickedValuseOfDropDownMenu2}
    ''';
  }
}
