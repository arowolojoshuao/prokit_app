import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIASplashScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIACommomWidgets.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIADialogs.dart';
import 'package:prokit_flutter/main.dart';

class MIAAddMealBotttomNavComponent extends StatefulWidget {
  @override
  _MIAAddMealBotttomNavComponentState createState() => _MIAAddMealBotttomNavComponentState();
}

class _MIAAddMealBotttomNavComponentState extends State<MIAAddMealBotttomNavComponent> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: boxDecorationDefault(borderRadius: radius(0), color: context.cardColor),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(borderRadius: radius(50)),
              child: HorizontalList(
                padding: EdgeInsets.all(0),
                itemCount: miaStore.addedMeals.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      displayDeleteDialog(context, miaStore.addedMeals[index]);
                    },
                    child: Container(
                      decoration: BoxDecoration(border: Border.all(color: appStore.isDarkModeOn ? Colors.white : Colors.black, width: 2), borderRadius: radius(100)),
                      child: miaCommonCachedNetworkImage(miaStore.addedMeals[index].image, height: 48, width: 48, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                    ),
                  );
                },
              ).cornerRadiusWithClipRRect(50),
            ).expand(),
            8.width,
            AppButton(
              color: miaPrimaryColor,
              text: 'Build Plan',
              textStyle: boldTextStyle(color: white),
              onTap: () {
                finish(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
