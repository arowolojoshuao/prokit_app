import 'package:mobx/mobx.dart';
import 'package:prokit_flutter/fullApps/mealime/models/MIAMealModel.dart';

part 'MIAStore.g.dart';

class MIAStore = MIAStoreBase with _$MIAStore;

abstract class MIAStoreBase with Store {
  @observable
  List<MIAMealModel> addedMeals = <MIAMealModel>[].asObservable();

  @action
  void addMeal({required String header, required MIAMealModel element}) {
    addedMeals.add(MIAMealModel(image: element.image, pro: element.pro, added: element.added, text: element.text, header: header));
  }

  @action
  void removeMeal({required String header, required MIAMealModel element, required String name}) {
    addedMeals.removeWhere((element) => element.header == header && element.text == name);
  }
}
