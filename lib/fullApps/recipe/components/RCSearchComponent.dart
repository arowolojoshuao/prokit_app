import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/screens/RCSearchedComponentScreen.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCSearchModel.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCCommon.dart';

class RCSearchScreen extends StatelessWidget {
  List<RCSearchModel> list = getShareNameList();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: context.statusBarHeight + 16),
        Text('Search', style: boldTextStyle(size: 30, fontFamily: GoogleFonts.playfairDisplay().fontFamily)),
        16.height,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: boxDecorationDefault(borderRadius: radius(16), color: appStore.isDarkModeOn ? rcSecondaryTextColor : rcSecondaryColor),
          child: Row(
            children: [
              Icon(LineIcons.search),
              8.width,
              AppTextField(
                textFieldType: TextFieldType.NAME,
                textStyle: boldTextStyle(),
                decoration: InputDecoration(hintText: 'Search', hintStyle: secondaryTextStyle(), border: InputBorder.none),
              ).expand()
            ],
          ),
        ),
        16.height,
        Text('Suggest', style: boldTextStyle()),
        16.height,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: list.map((e) {
            return Container(
              width: context.width() / 3 - 16,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: radius(16),
                color: appStore.isDarkModeOn ? rcSecondaryTextColor : rcSecondaryColor,
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                rcCommonCachedNetworkImage(e.image, height: 80),
                16.height,
                Text(e.name, style: secondaryTextStyle()),
              ]),
            ).onTap(() {
              RCSearchedComponentScreen(element: e).launch(context);
            }, splashColor: Colors.transparent, highlightColor: Colors.transparent);
          }).toList(),
        )
      ]).paddingAll(16),
    );
  }
}
