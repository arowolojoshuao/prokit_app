import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCSortModel.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/main.dart';

class RCSortComponent extends StatefulWidget {
  @override
  _RCSortComponentState createState() => _RCSortComponentState();
}

class _RCSortComponentState extends State<RCSortComponent> {
  late int selectedIndex = 1;

  List<RCSortModel> sortList = getSortList();

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: sortList.map((e) {
      int index = sortList.indexOf(e);
      return Column(
        children: [
          SettingItemWidget(
            title: e.title,
            titleTextStyle: boldTextStyle(
                color: selectedIndex == index
                    ? primaryColor
                    : appStore.isDarkModeOn
                        ? Colors.white
                        : Colors.black),
            leading: Icon(
              e.icon,
              color: selectedIndex == index
                  ? primaryColor
                  : appStore.isDarkModeOn
                      ? Colors.white
                      : Colors.black,
            ),
            trailing: selectedIndex == index ? Icon(LineIcons.check, color: primaryColor) : Offstage(),
            onTap: () {
              selectedIndex = index;
              setState(() {});
            },
          ),
          Divider()
        ],
      );
    }).toList());
  }
}
