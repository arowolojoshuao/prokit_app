import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/screens/BMMapScreen.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMBottomSheet.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMColors.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMCommonWidgets.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class BMFloatingActionComponent extends StatelessWidget {
  const BMFloatingActionComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(color: bmTextColorDarkMode, borderRadius: radius(32)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          bmCommonCachedNetworkImage('$BaseUrl/images/beauty_master/adjust.png', height: 20, color: Colors.white),
          4.width,
          Text('Filter', style: secondaryTextStyle(color: Colors.white)).onTap(() {
            showFilterBottomSheet(context);
          }),
          Text(' | ', style: primaryTextStyle(color: Colors.white)),
          Icon(Icons.map_outlined, color: Colors.white),
          Text('Map', style: secondaryTextStyle(color: Colors.white)).onTap(() {
            BMMapScreen().launch(context);
          }),
        ],
      ),
    );
  }
}
