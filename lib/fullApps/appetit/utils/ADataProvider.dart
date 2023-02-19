import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class AWalkThroughModel {
  String? heading;
  String? title;
  String? subtitle;
  String? image;
  double? progress;

  AWalkThroughModel({
    this.heading,
    this.title,
    this.subtitle,
    this.image,
    this.progress,
  });
}

final List<AWalkThroughModel> modal = [
  AWalkThroughModel(
    heading: 'Appetit',
    title: 'Share Your Recipes',
    subtitle: 'Learn and Share your recipes with getting amazing rewards published by amazon ',
    image: '$BaseUrl/images/appetit/p1.jpg',
    progress: 0.33,
  ),
  AWalkThroughModel(
    heading: 'Appetit',
    title: 'Learn to cook',
    subtitle: 'Learn and Share your recipes with getting amazing rewards published by amazon ',
    image: '$BaseUrl/images/appetit/p3.jpg',
    progress: 0.66,
  ),
  AWalkThroughModel(
    heading: 'Appetit',
    title: 'Become a Master Chef',
    subtitle: 'Learn and Share your recipes with getting amazing rewards published by amazon ',
    image: '$BaseUrl/images/appetit/p2.jpg',
    progress: 1,
  ),
];

class Category {
  String? data;
  String? image;
  String? numberofrecipe;
  String? views;
  String? categoryicon;
  bool isBookMark;

  Category({
    this.data,
    this.image,
    this.numberofrecipe,
    this.views,
    this.categoryicon,
    required this.isBookMark,
  });
}

final List<Category> categorymodal = [
  Category(
    data: 'Soup',
    image: "$BaseUrl/images/appetit/category1.jpg",
    numberofrecipe: '15 recipes',
    views: '28 views',
    categoryicon: "$BaseUrl/images/appetit/categoryicon1.png",
    isBookMark: false,
  ),
  Category(
    data: 'Seafood',
    image: "$BaseUrl/images/appetit/category2.jpg",
    numberofrecipe: '3 recipes',
    views: '120 views',
    categoryicon: "$BaseUrl/images/appetit/categoryicon2.png",
    isBookMark: false,
  ),
  Category(
    data: 'Sushi',
    image: "$BaseUrl/images/appetit/category3.jpg",
    numberofrecipe: '9 recipes',
    views: '92 views',
    categoryicon: "$BaseUrl/images/appetit/categoryicon3.png",
    isBookMark: false,
  ),
  Category(
    data: 'Cake',
    image: "$BaseUrl/images/appetit/category4.jpg",
    numberofrecipe: '24 recipes',
    views: '27 views',
    categoryicon: "$BaseUrl/images/appetit/categoryicon4.png",
    isBookMark: false,
  ),
  Category(
    data: 'Noodles',
    image: "$BaseUrl/images/appetit/category5.jpg",
    numberofrecipe: '13 recipes',
    views: '54 views',
    isBookMark: false,
  ),
  Category(
    data: 'Coffee',
    image: "$BaseUrl/images/appetit/category6.jpg",
    numberofrecipe: '27 recipes',
    views: '74 views',
    isBookMark: false,
  ),
];

class SearchPage {
  String? text;
  String? image;

  SearchPage({
    this.text,
    this.image,
  });
}

final List<SearchPage> searchitems = [
  SearchPage(
    text: 'Food Recipes',
    image: "$BaseUrl/images/appetit/search1.png",
  ),
  SearchPage(
    text: 'Live',
    image: "$BaseUrl/images/appetit/search2.png",
  ),
  SearchPage(
    text: 'Galleries',
    image: "$BaseUrl/images/appetit/search3.png",
  ),
  SearchPage(
    text: 'Top Cheif',
    image: "$BaseUrl/images/appetit/search4.png",
  ),
];

class Ingredients {
  String? image;
  String? data;

  Ingredients({
    this.image,
    this.data,
  });
}

final List<Ingredients> ingredientsmodal = [
  Ingredients(
    data: "6 peeled boiled egg",
    image: "$BaseUrl/images/appetit/ingredients8.png",
  ),
  Ingredients(
    data: "1/4 cup mayonnaise",
    image: "$BaseUrl/images/appetit/ingredients9.png",
  ),
  Ingredients(
    data: "1 tpsp lemon juice",
    image: "$BaseUrl/images/appetit/ingredients10.png",
  ),
  Ingredients(
    data: "1 tpsp yellow mustard",
    image: "$BaseUrl/images/appetit/ingredients1.png",
  ),
  Ingredients(
    data: "1/4 tpsp salt",
    image: "$BaseUrl/images/appetit/ingredients2.png",
  ),
  Ingredients(
    data: "1/4 tpsp pepper",
    image: "$BaseUrl/images/appetit/ingredients3.png",
  ),
  Ingredients(
    data: "60g chopped celery",
    image: "$BaseUrl/images/appetit/ingredients4.png",
  ),
  Ingredients(
    data: "18g sliced green onion",
    image: "$BaseUrl/images/appetit/ingredients5.png",
  ),
  Ingredients(
    data: "8 slices white bread",
    image: "$BaseUrl/images/appetit/ingredients6.png",
  ),
  Ingredients(
    data: "4 lettuce leaves",
    image: "$BaseUrl/images/appetit/ingredients7.png",
  ),
];

class Directions {
  String? data;

  Directions({this.data});
}

final List<Directions> directionmodal = [
  Directions(
    data: 'Chopped eggs',
  ),
  Directions(
    data: "Mix mayonnaise,lemon juice, mustard, salt and pepper in medium bowl",
  ),
  Directions(
    data: 'Add chopped eggs, celery and green onions; mix well',
  ),
  Directions(
    data: 'Refrigerate, covered to blend flavours',
  ),
  Directions(
    data: 'Chopped cereals and mix well',
  ),
];

class LiveCooking {
  String? data;
  String? image;
  String? chefname;
  String? chefpic;
  String? calories;

  LiveCooking({
    this.data,
    this.image,
    this.chefname,
    this.chefpic,
    this.calories,
  });
}

final List<LiveCooking> cookingmodal = [
  LiveCooking(
    data: 'Special Strand Pasta ',
    image: "$BaseUrl/images/appetit/livecooking1.jpg",
    chefname: 'Jeff Mcinnis',
    chefpic: "$BaseUrl/images/appetit/topchef1.jpg",
    calories: "$BaseUrl/images/appetit/calories1.jpg",
  ),
  LiveCooking(
    data: 'Person Slicing Vegetable',
    image: "$BaseUrl/images/appetit/livecooking2.jpg",
    chefname: 'Bobby Flay',
    chefpic: "$BaseUrl/images/appetit/topchef2.jpg",
    calories: "$BaseUrl/images/appetit/calories2.jpg",
  ),
  LiveCooking(
    data: 'Brocolli Masala vegetables',
    image: "$BaseUrl/images/appetit/livecooking3.jpg",
    chefname: 'Bobby Chinn',
    chefpic: "$BaseUrl/images/appetit/topchef3.jpg",
    calories: "$BaseUrl/images/appetit/calories3.jpg",
  ),
  LiveCooking(
    data: 'Special Corn Soup ',
    image: "$BaseUrl/images/appetit/livecooking4.jpg",
    chefname: 'Tyler Kord',
    chefpic: "$BaseUrl/images/appetit/topchef4.jpg",
    calories: "$BaseUrl/images/appetit/calories4.jpg",
  ),
  LiveCooking(
    data: 'Lanzhou stretched noodles',
    image: "$BaseUrl/images/appetit/livecooking5.jpg",
    chefname: 'Hung Huynh',
    chefpic: "$BaseUrl/images/appetit/topchef5.jpg",
    calories: "$BaseUrl/images/appetit/calories5.jpg",
  ),
];

class TopChef {
  String? name;
  String? image;
  String? recipe;

  TopChef({
    this.name,
    this.image,
    this.recipe,
  });
}

final List<TopChef> topchefmodal = [
  TopChef(
    name: 'Jeff Mcinnis',
    image: "$BaseUrl/images/appetit/topchef1.jpg",
    recipe: "57 recipes",
  ),
  TopChef(
    name: 'Gordon Cheif',
    image: "$BaseUrl/images/appetit/topchef6.jpg",
    recipe: "35 recipes",
  ),
  TopChef(
    name: 'Bobby Chinn',
    image: "$BaseUrl/images/appetit/topchef3.jpg",
    recipe: "29 recipes",
  ),
  TopChef(
    name: 'Tyler Kord',
    image: "$BaseUrl/images/appetit/topchef4.jpg",
    recipe: "35 recipes",
  ),
  TopChef(
    name: 'Hung Huynh',
    image: "$BaseUrl/images/appetit/topchef5.jpg",
    recipe: "25 recipes",
  ),
  TopChef(
    name: 'Bobby Flay',
    image: "$BaseUrl/images/appetit/topchef2.jpg",
    recipe: "43 recipes",
  ),
];

class Notification {
  String? name;
  String? message;
  String? time;
  String? image;
  String? recipeimage;

  Notification({
    this.image,
    this.name,
    this.message,
    this.recipeimage,
    this.time,
  });
}

final List<Notification> mynotifications = [
  Notification(
    name: 'Jenny Wilson',
    image: '$BaseUrl/images/appetit/a_face2.jpeg',
    time: '1 hour ago',
    message: ' has follow you back',
    recipeimage: '$BaseUrl/images/appetit/category1.jpg',
  ),
  Notification(
    name: 'Hannah Beson',
    image: '$BaseUrl/images/appetit/user2.png',
    time: '12 hour ago',
    message: ' loved your recipes',
    recipeimage: '$BaseUrl/images/appetit/category2.jpg',
  ),
  Notification(
    name: 'Mauric Reylonds',
    image: '$BaseUrl/images/appetit/user3.jpg',
    time: '29m ago',
    message: ' has started following you',
    recipeimage: '$BaseUrl/images/appetit/category3.jpg',
  ),
  Notification(
    name: 'Harry Gardner',
    image: '$BaseUrl/images/appetit/user4.jpg',
    time: '38m ago',
    message: ' has posted his new recipe',
    recipeimage: '$BaseUrl/images/appetit/category4.jpg',
  ),
  Notification(
    name: 'Victor Pocheco',
    image: '$BaseUrl/images/appetit/a_face.jpeg',
    time: '16 hour ago',
    message: ' is now following you',
    recipeimage: '$BaseUrl/images/appetit/category5.jpg',
  ),
  Notification(
    name: 'Gordon Cheiff',
    image: '$BaseUrl/images/appetit/user6.jpg',
    time: '2 days ago',
    message: ' has updated his gallery recipes',
    recipeimage: '$BaseUrl/images/appetit/category6.jpg',
  ),
  Notification(
    name: 'Jeff Mcinnis',
    image: '$BaseUrl/images/appetit/user7.jpg',
    time: '44m ago',
    message: ' has commented on your recipe post',
    recipeimage: '$BaseUrl/images/appetit/category1.jpg',
  ),
];

class Discussion {
  String? name;
  String? image;
  String? comment;
  String? likes;
  String? reviewpic;
  bool? isLiked;

  Discussion({
    this.image,
    this.name,
    this.comment,
    this.likes,
    this.reviewpic,
    this.isLiked,
  });
}

final List<Discussion> discussionmodal = [
  Discussion(
    name: 'Jenny Wilson',
    image: '$BaseUrl/images/appetit/a_face2.jpeg',
    comment: 'Due to variation of slices it taste uniquely.',
    likes: '23',
    reviewpic: '$BaseUrl/images/appetit/soup.jpg',
    isLiked: true,
  ),
  Discussion(
    name: 'Hannah Beson',
    image: '$BaseUrl/images/appetit/user2.png',
    comment: 'The vegetables are chopped too thinner to have antique taste ,delicious.',
    likes: '423',
    reviewpic: '$BaseUrl/images/appetit/p1.jpg',
    isLiked: true,
  ),
  Discussion(
    name: 'Mauric Reylonds',
    image: '$BaseUrl/images/appetit/user3.jpg',
    comment: 'The eggs are boiled as per demand ,good service.',
    likes: '67',
    reviewpic: '$BaseUrl/images/appetit/category4.jpg',
    isLiked: true,
  ),
  Discussion(
    name: 'Harry Gardner',
    image: '$BaseUrl/images/appetit/user4.jpg',
    comment: 'Coffee view is too good ,enjoyed to have it.',
    likes: '41',
    reviewpic: '$BaseUrl/images/appetit/p2.jpg',
    isLiked: true,
  ),
  Discussion(
    name: 'Victor Pocheco',
    image: '$BaseUrl/images/appetit/a_face.jpeg',
    comment: 'Cake design was really attractive.',
    likes: '142',
    reviewpic: '$BaseUrl/images/appetit/p3.jpg',
    isLiked: true,
  ),
  Discussion(
    name: 'Gordon Cheiff',
    image: '$BaseUrl/images/appetit/user6.jpg',
    comment: 'The Bread served was perfectly baked enjoyed while having it.',
    likes: '256',
    reviewpic: '$BaseUrl/images/appetit/p1.jpg',
    isLiked: true,
  ),
  Discussion(
    name: 'Jeff Mcinnis',
    image: '$BaseUrl/images/appetit/user7.jpg',
    comment: 'Types of sauce made the dishes extraordinary antique taste.',
    likes: '69',
    reviewpic: '$BaseUrl/images/appetit/soup.jpg',
    isLiked: true,
  ),
];

List<LanguageDataModel> languageList() {
  return [
    LanguageDataModel(id: 1, name: 'English', languageCode: 'en', fullLanguageCode: 'en-US', flag: '$BaseUrl/images/flag/ic_us.png'),
    LanguageDataModel(id: 2, name: 'Hindi', languageCode: 'hi', fullLanguageCode: 'hi-IN', flag: '$BaseUrl/images/flag/ic_hi.png'),
    LanguageDataModel(id: 3, name: 'Arabic', languageCode: 'ar', fullLanguageCode: 'ar-AR', flag: '$BaseUrl/images/flag/ic_ar.png'),
    LanguageDataModel(id: 4, name: 'French', languageCode: 'fr', fullLanguageCode: 'fr-FR', flag: '$BaseUrl/images/flag/ic_fr.png'),
  ];
}
