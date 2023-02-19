import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCBackComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCMiniStoryComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCHomeStoryModel.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCSearchModel.dart';
import 'package:prokit_flutter/fullApps/recipe/screens/RCSearchStoryScreen.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCBottomSheet.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/main.dart';

class RCSearchedComponentScreen extends StatefulWidget {
  RCSearchModel element;

  RCSearchedComponentScreen({required this.element});

  @override
  _RCSearchedComponentScreenState createState() => _RCSearchedComponentScreenState();
}

class _RCSearchedComponentScreenState extends State<RCSearchedComponentScreen> {
  List<RCHomeStoryModel> list = getSearchRecipeList();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: context.statusBarHeight + 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RCBackComponent(color: appStore.isDarkModeOn ? Colors.white : Colors.black, borderColor: rcSecondaryTextColor),
                Text(widget.element.name, style: boldTextStyle(size: 20, fontFamily: GoogleFonts.playfairDisplay().fontFamily)),
                Container(
                    decoration: BoxDecoration(border: Border.all(color: rcSecondaryTextColor), borderRadius: radius(16)),
                    margin: EdgeInsets.all(6),
                    child: IconButton(
                      icon: Icon(LineIcons.filter, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                      onPressed: () {
                        showFilterBottomSheet(context);
                      },
                    )),
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 16),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(8),
                width: context.width() / 2,
                decoration: BoxDecoration(border: Border.all(color: primaryColor, width: 2), borderRadius: radius(12), color: primaryColor.withAlpha(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(LineIcons.clock, color: primaryColor),
                        4.width,
                        Text('Latest', style: secondaryTextStyle(color: primaryColor)),
                      ],
                    ),
                    Icon(Icons.arrow_drop_down_rounded, color: rcSecondaryTextColor),
                  ],
                ),
              ).onTap(() {
                showSortBottomSheet(context);
              }),
            ).paddingSymmetric(horizontal: 16),
            16.height,
            Wrap(
                spacing: 24,
                runSpacing: 16,
                children: list.map((e) {
                  return RCMiniStoryComponentRecipe(element: e, isProfile: false).onTap(() {
                    RCSearchStoryScreen(element: e).launch(context);
                  }, splashColor: Colors.transparent, highlightColor: Colors.transparent);
                }).toList()),
            50.height,
          ],
        ),
      ),
    );
  }
}
