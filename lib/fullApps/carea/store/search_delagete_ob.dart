import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'search_delagete_ob.g.dart';

class SearchDelegateOb = _SearchDelagateOb with _$SearchDelegateOb;

abstract class _SearchDelagateOb with Store {
  @observable
  double sliderInitialIndex = 80000;

  @observable
  List list_of_image = [
    'images/carea/car1.png',
    'images/carea/car2.png',
    'images/carea/car3.png',
    'images/carea/car4.png',
    'images/carea/car5.png',
    'images/carea/car6.png',
    'images/carea/car7.png',
    'images/carea/car8.png',
    'images/carea/car9.png',
    'images/carea/car10.png',
    'images/carea/car11.png',
    'images/carea/car12.png',
  ].asObservable();

  @action
  void shuffle() {
    list_of_image.shuffle();
  }

  @observable
  List bgColor = [
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
  List textColor = [
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
  void changeColor(Color bgColor, Color textColor, int index) {
    for (int i = 0; i < this.bgColor.length; i++) {
      this.bgColor[i] = Colors.white;
      this.textColor[i] = Colors.black;
    }
    this.bgColor[index] = Colors.black;
    this.textColor[index] = Colors.white;
  }

  @action
  void changeSlider(double index) {
    sliderInitialIndex = index;
  }
}
