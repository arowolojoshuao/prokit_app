import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/models/MIAIngredientModel.dart';
import 'package:prokit_flutter/fullApps/mealime/models/MIASelectOptionsModel.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIADataGenerator.dart';

Widget cookwareTab() {
  List<MIASelectOptionsModel> cookwareList = getCookwareList();

  return SingleChildScrollView(
    child: Column(
      children: cookwareList.map((e) {
        return Column(children: [
          ListTile(title: Text(e.title, style: boldTextStyle())),
          Divider(),
        ]);
      }).toList(),
    ),
  );
}

Widget ingredientsTab() {
  List<MIASelectOptionsModel> ingredientList = getIngredientsList();

  return SingleChildScrollView(
    child: Column(
      children: ingredientList.map((e) {
        return Column(children: [
          ListTile(
            title: Text(e.title, style: boldTextStyle()),
            trailing: Text(e.subtitle!),
          ),
          Divider()
        ]);
      }).toList(),
    ),
  );
}

Widget instructionsTab() {
  List<MIAInstructionsModel> instructions = getInstructions();

  return SingleChildScrollView(
    child: Column(
      children: instructions.map((e) {
        int index = instructions.indexOf(e) + 1;
        return Column(
          children: [
            16.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(index.toString(), style: boldTextStyle(color: miaSecondaryTextColor, size: 30)),
                10.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e.title, style: boldTextStyle()),
                    8.height,
                    ...List.generate(e.subtitles.length, (index) => Text(e.subtitles[index], style: secondaryTextStyle())),
                  ],
                ).expand()
              ],
            ),
            16.height,
            Divider(),
          ],
        );
      }).toList(),
    ).paddingSymmetric(horizontal: 16),
  );
}
