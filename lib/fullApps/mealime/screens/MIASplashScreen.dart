import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/mia_store/MIAStore.dart';
import 'package:prokit_flutter/fullApps/mealime/models/MIAMealModel.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIAWelcomeScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIADataGenerator.dart';

MIAStore miaStore = MIAStore();

List<MIAMealModel> mealMostPopularList = getMealList();
List<MIAMealModel> mealRecentlyCreatedList = getMealList();
List<MIAMealModel> mealTopRatedList = getMealList();
List<MIAMealModel> mealQuickEasyList = getMealList();

class MIASplashScreen extends StatefulWidget {
  static String tag = '/mealile';

  const MIASplashScreen({Key? key}) : super(key: key);

  @override
  _MIASplashScreenState createState() => _MIASplashScreenState();
}

class _MIASplashScreenState extends State<MIASplashScreen> {
  @override
  void initState() {
    super.initState();
    //
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.transparent);
    await 3.seconds.delay;
    finish(context);
    MIAWelcomeScreen().launch(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Image.asset('images/mealime/mealime_app_logo.png', height: 200).center());
  }
}
