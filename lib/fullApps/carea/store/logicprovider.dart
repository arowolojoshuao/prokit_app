import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:prokit_flutter/fullApps/carea/commons/constants.dart';

part 'logicprovider.g.dart';

class LogicProvider = _LogicProvider with _$LogicProvider;

abstract class _LogicProvider with Store {
  @observable
  int conter = 0;

  @observable
  int x = 0;

  @observable
  int bottombarindex = 0;

  @observable
  List searclist = [].asObservable();

  @observable
  bool isIconTrue = false;

  @action
  void changeIconOfPassword() {
    isIconTrue = !isIconTrue;
  }

  @observable
  List IconList = List.generate(
    ListOfCarImg.length,
    (index) => Icon(Icons.favorite_border_rounded),
  ).toList().asObservable();

  @action
  void changeIconOfFavarite(int index) {
    (IconList[index].icon == Icon(Icons.favorite, color: Colors.pink).icon) ? IconList[index] = Icon(Icons.favorite_border_rounded) : IconList[index] = Icon(Icons.favorite, color: Colors.pink);
  }

  @action
  void addToSearchList(int index, int item) {
    searclist.insert(index, item);
  }

  @action
  void removeElementToSearchList(int index) {
    searclist.removeAt(index);
  }

  @action
  void chanegeBottombarIndex(int index) => bottombarindex = index;

  @observable
  int lodingscreen = 0;

  @action
  void changeLoadingPage(int i) => lodingscreen = i;

  @observable
  List listofcolor = <Color>[
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ].asObservable();

  @observable
  List listofTextColor = <Color>[
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ].asObservable();

  @action
  void changeIndex(int index) => x = index;

  @action
  void changeCurrColor(int index, Color clr) => listofcolor[index] = clr;

  @action
  void changeColor(Color bgColor, Color textColor, int index) {
    for (int i = 0; i < listofTextColor.length; i++) {
      listofTextColor[i] = Colors.black;
      listofcolor[i] = Colors.white;
    }
    listofcolor[index] = bgColor;
    listofTextColor[index] = textColor;
  }
}
