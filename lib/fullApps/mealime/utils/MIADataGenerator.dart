import 'package:prokit_flutter/fullApps/mealime/models/MIADashboardModel.dart';
import 'package:prokit_flutter/fullApps/mealime/models/MIAIngredientModel.dart';
import 'package:prokit_flutter/fullApps/mealime/models/MIAMealModel.dart';
import 'package:prokit_flutter/fullApps/mealime/models/MIASelectOptionsModel.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

List<MIASelectOptionsModel> getAllergiesList() {
  List<MIASelectOptionsModel> list = [];

  list.add(MIASelectOptionsModel(title: 'Gluten', selected: false));
  list.add(MIASelectOptionsModel(title: 'Peanut', selected: false));
  list.add(MIASelectOptionsModel(title: 'Tree Nut', selected: false));
  list.add(MIASelectOptionsModel(title: 'Soy', selected: false));
  list.add(MIASelectOptionsModel(title: 'Sesame', selected: false));
  list.add(MIASelectOptionsModel(title: 'Mustard', selected: false));
  list.add(MIASelectOptionsModel(title: 'Sulfite', selected: false));
  list.add(MIASelectOptionsModel(title: 'Nightshade', selected: false));

  return list;
}

List<MIASelectOptionsModel> getDislikesList() {
  List<MIASelectOptionsModel> list = [];

  list.add(MIASelectOptionsModel(title: 'avocado', selected: false));
  list.add(MIASelectOptionsModel(title: 'beets', selected: false));
  list.add(MIASelectOptionsModel(title: 'bell peppers', selected: false));
  list.add(MIASelectOptionsModel(title: 'brussels sprouts', selected: false));
  list.add(MIASelectOptionsModel(title: 'cauliflower', selected: false));
  list.add(MIASelectOptionsModel(title: 'eggplant', selected: false));
  list.add(MIASelectOptionsModel(title: 'mushrooms', selected: false));
  list.add(MIASelectOptionsModel(title: 'olives', selected: false));
  list.add(MIASelectOptionsModel(title: 'quinoa', selected: false));
  list.add(MIASelectOptionsModel(title: 'tofu', selected: false));
  list.add(MIASelectOptionsModel(title: 'turnips', selected: false));

  return list;
}

List<MIASelectOptionsModel> getServingsList() {
  List<MIASelectOptionsModel> list = [];

  list.add(MIASelectOptionsModel(title: '2 servings', subtitle: 'for two, or one with leftovers', selected: true));
  list.add(MIASelectOptionsModel(title: '4 servings', subtitle: 'for four, or two-three with leftovers', selected: false));
  list.add(MIASelectOptionsModel(title: '6 servings', subtitle: 'for a family of 5+', selected: false));

  return list;
}

List<MIADashboardModel> getFragmentsList() {
  List<MIADashboardModel> list = [];

  list.add(MIADashboardModel(image: 'images/mealime/knife.png', tab: 'Meal Plan'));
  list.add(MIADashboardModel(image: 'images/mealime/shopping-basket.png', tab: 'Groceries'));
  list.add(MIADashboardModel(image: 'images/mealime/romantic-novel.png', tab: 'Favourites'));
  list.add(MIADashboardModel(image: 'images/mealime/setting.png', tab: 'Settings'));

  return list;
}

List<MIAMealModel> getMealList() {
  List<MIAMealModel> list = [];

  list.add(MIAMealModel(image: '$BaseUrl/images/mealime/plate_one.jpg', text: 'Brussels Sprouts, Mashed Potatoes & Sausage Bowl with sugar', added: false, pro: true));
  list.add(MIAMealModel(image: '$BaseUrl/images/mealime/plate_two.jpg', text: 'Roasted Cauliflower & Black Bean Burrito Bowl with Cilantro Lights', added: false, pro: false));
  list.add(MIAMealModel(image: '$BaseUrl/images/mealime/plate_three.jpg', text: 'Creamy Cashew Zucchini Noodles with Vegan Sausage, Article', added: false, pro: false));
  list.add(MIAMealModel(image: '$BaseUrl/images/mealime/plate_four.jpg', text: 'Lebanese Lentils, Rice & fried Onions (Mujadara) with Chocolate', added: false, pro: true));
  list.add(MIAMealModel(image: '$BaseUrl/images/mealime/plate_five.jpg', text: 'Brussels Sprouts, Mashed Potatoes & Sausage Bowl with sugar', added: false, pro: false));

  list.shuffle();

  return list;
}

List<MIASelectOptionsModel> getCookwareList() {
  List<MIASelectOptionsModel> list = [];

  list.add(MIASelectOptionsModel(title: 'can opener'));
  list.add(MIASelectOptionsModel(title: 'fry pan'));
  list.add(MIASelectOptionsModel(title: 'saute pan'));
  list.add(MIASelectOptionsModel(title: 'sauce pan'));
  list.add(MIASelectOptionsModel(title: 'wok'));
  list.add(MIASelectOptionsModel(title: 'French Oven'));
  list.add(MIASelectOptionsModel(title: 'cinnamon, ground'));
  list.add(MIASelectOptionsModel(title: 'cumin, ground'));
  list.add(MIASelectOptionsModel(title: 'can opener'));
  list.add(MIASelectOptionsModel(title: 'fry pan'));
  list.add(MIASelectOptionsModel(title: 'saute pan'));
  list.add(MIASelectOptionsModel(title: 'wok'));
  list.add(MIASelectOptionsModel(title: 'French Oven'));
  list.add(MIASelectOptionsModel(title: 'cinnamon, ground'));
  list.add(MIASelectOptionsModel(title: 'cumin, ground'));

  return list;
}

List<MIASelectOptionsModel> getIngredientsList() {
  List<MIASelectOptionsModel> list = [];

  list.add(MIASelectOptionsModel(title: 'basmati rice', subtitle: '1/2 cup'));
  list.add(MIASelectOptionsModel(title: 'chicken or vegetable broth', subtitle: '16 fl oz'));
  list.add(MIASelectOptionsModel(title: 'cilantro', subtitle: '1/2 small bunch'));
  list.add(MIASelectOptionsModel(title: 'coconut milk', subtitle: '1/2 (13.5 dl oz) can'));
  list.add(MIASelectOptionsModel(title: 'garlic', subtitle: '2 cloves'));
  list.add(MIASelectOptionsModel(title: 'ginger root', subtitle: '1(1 inch) piece'));
  list.add(MIASelectOptionsModel(title: 'grape tomatoes', subtitle: '1/2 pint'));
  list.add(MIASelectOptionsModel(title: 'jalapeno pepper', subtitle: '1'));
  list.add(MIASelectOptionsModel(title: 'yellow onion', subtitle: '1 medium'));
  list.add(MIASelectOptionsModel(title: 'cinnamon, ground', subtitle: ''));
  list.add(MIASelectOptionsModel(title: 'cumin, ground', subtitle: ''));
  list.add(MIASelectOptionsModel(title: 'basmati rice', subtitle: '1/2 cup'));
  list.add(MIASelectOptionsModel(title: 'chicken or vegetable broth', subtitle: '16 fl oz'));
  list.add(MIASelectOptionsModel(title: 'cilantro', subtitle: '1/2 small bunch'));
  list.add(MIASelectOptionsModel(title: 'coconut milk', subtitle: '1/2 (13.5 dl oz) can'));

  return list;
}

List<MIAInstructionsModel> getInstructions() {
  List<MIAInstructionsModel> list = [];

  list.add(MIAInstructionsModel(
    title: 'Using a strainer or colander, rinse the rice under cold, running water, then drain and transfer to small saucepan. Add both and bring the mixture to boil over high heat.',
    subtitles: [
      '1/2 cup basmati rice',
      '8 fl oz (1 cup) chicken or vegetable',
    ],
  ));
  list.add(MIAInstructionsModel(
    title: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
    subtitles: [
      '1 (1 inch) piece ginger root',
      '1 jalapeno',
      '1/2 small bunch cilantro',
      '1/2 piny grape tomatoes',
    ],
  ));
  list.add(MIAInstructionsModel(
    title: 'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
    subtitles: [
      '1/2 cup basmati rice',
      '8 fl oz (1 cup) chicken or vegetable',
      '1/2 small bunch cilantro',
      '1/2 piny grape tomatoes',
    ],
  ));

  return list;
}

List<MIASelectOptionsModel> getGroceryBottomSheetList() {
  List<MIASelectOptionsModel> list = [];

  list.add(MIASelectOptionsModel(title: 'Check off samples ypu already have.'));
  list.add(MIASelectOptionsModel(title: 'Add Grocery you may need.'));
  list.add(MIASelectOptionsModel(title: 'Shop easily in-store or online'));

  return list;
}

List<MIASelectOptionsModel> getGroceryList() {
  List<MIASelectOptionsModel> list = [];

  list.add(MIASelectOptionsModel(title: 'lemon', subtitle: '1/2', selected: false));
  list.add(MIASelectOptionsModel(title: 'lime', subtitle: '1', selected: false));
  list.add(MIASelectOptionsModel(title: 'mango', subtitle: '1/2', selected: false));
  list.add(MIASelectOptionsModel(title: 'orange', subtitle: '1/2', selected: false));
  list.add(MIASelectOptionsModel(title: 'avocado', subtitle: '1', selected: false));
  list.add(MIASelectOptionsModel(title: 'english cucumber', subtitle: '1/2', selected: false));
  list.add(MIASelectOptionsModel(title: 'garlic', subtitle: '6 cloves', selected: false));
  list.add(MIASelectOptionsModel(title: 'ginger root', subtitle: '2 (1 inch) pieces', selected: false));
  list.add(MIASelectOptionsModel(title: 'grape tomatoes', subtitle: '1/2 pint', selected: false));
  list.add(MIASelectOptionsModel(title: 'tomato', subtitle: '1', selected: false));

  return list;
}

List<MIASelectOptionsModel> getAddGroceryList() {
  List<MIASelectOptionsModel> list = [];

  list.add(MIASelectOptionsModel(title: 'bananas'));
  list.add(MIASelectOptionsModel(title: 'bread'));
  list.add(MIASelectOptionsModel(title: 'eggs'));
  list.add(MIASelectOptionsModel(title: 'apples'));
  list.add(MIASelectOptionsModel(title: 'milk'));
  list.add(MIASelectOptionsModel(title: 'almond milk'));
  list.add(MIASelectOptionsModel(title: 'mushrooms'));
  list.add(MIASelectOptionsModel(title: 'olives'));
  list.add(MIASelectOptionsModel(title: 'quinoa'));
  list.add(MIASelectOptionsModel(title: 'tofu'));
  list.add(MIASelectOptionsModel(title: 'turnips'));

  return list;
}

List<MIASelectOptionsModel> getShopsList() {
  List<MIASelectOptionsModel> list = [];

  list.add(MIASelectOptionsModel(title: 'Asda', subtitle: '$BaseUrl/images/mealime/asda.png', selected: false));
  list.add(MIASelectOptionsModel(title: 'Ocado', subtitle: '$BaseUrl/images/mealime/ocado.png', selected: false));
  list.add(MIASelectOptionsModel(title: 'Tesco', subtitle: '$BaseUrl/images/mealime/tesco.png', selected: false));

  return list;
}

List<MIADashboardModel> getSettingsList() {
  List<MIADashboardModel> list = [];

  list.add(MIADashboardModel(image: '$BaseUrl/images/mealime/adjust.png', tab: 'Eating Preferences'));
  list.add(MIADashboardModel(image: '$BaseUrl/images/mealime/book.png', tab: 'Your recipes'));
  list.add(MIADashboardModel(image: '$BaseUrl/images/mealime/gift.png', tab: 'Share Mealime'));
  list.add(MIADashboardModel(image: '$BaseUrl/images/mealime/chef.png', tab: 'Meet Our Chefs'));
  list.add(MIADashboardModel(image: '$BaseUrl/images/mealime/bulb.png', tab: 'Help Make Mealime Better'));

  return list;
}
