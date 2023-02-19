import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIAAllergiesScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIACommomWidgets.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAConstants.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MIAPickDietScreen extends StatefulWidget {
  const MIAPickDietScreen({Key? key}) : super(key: key);

  @override
  _MIAPickDietScreenState createState() => _MIAPickDietScreenState();
}

class _MIAPickDietScreenState extends State<MIAPickDietScreen> {
  List<String> dietList = ['Classic', 'Low Carb', 'Keto', 'Flexitarian', 'Paleo', 'Vegetarian', 'Pescetarian', 'Vegan'];

  int selectedIndex = 0;

  @override
  void initState() {
    changeStatusColor(appStore.scaffoldBackground!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: miaAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pick your diet', style: boldTextStyle(size: 30)),
            20.height,
            Column(
              children: dietList.map((e) {
                int index = dietList.indexOf(e);
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? miaContainerColor
                          : appStore.isDarkModeOn
                              ? context.cardColor
                              : miaContainerSecondaryColor,
                      borderRadius: radius(miaDefaultRadius)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e,
                          style: boldTextStyle(
                              color: appStore.isDarkModeOn
                                  ? selectedIndex == index
                                      ? Colors.black
                                      : Colors.white
                                  : Colors.black)),
                      selectedIndex == index ? Text('No holds barred', style: primaryTextStyle(color: Colors.brown)) : Offstage(),
                    ],
                  ),
                ).onTap(() {
                  selectedIndex = index;
                  setState(() {});
                }, borderRadius: radius(miaDefaultRadius));
              }).toList(),
            ),
            50.height,
            AppButton(
              color: miaPrimaryColor,
              text: 'Continue',
              textStyle: boldTextStyle(color: white),
              onTap: () {
                MIAAllergiesScreen().launch(context);
              },
            ).center(),
            50.height,
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
