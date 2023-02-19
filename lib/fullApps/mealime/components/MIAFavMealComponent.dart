import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/models/MIAMealModel.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIACommomWidgets.dart';

class MIAFavMealComponent extends StatelessWidget {
  MIAMealModel element;

  MIAFavMealComponent({required this.element});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width() / 2 - 40,
      child: Column(
        children: [
          miaCommonCachedNetworkImage(element.image, height: 150, width: context.width() / 2 - 40, fit: BoxFit.cover).cornerRadiusWithClipRRect(32),
          8.height,
          Text(element.text, style: primaryTextStyle(), maxLines: 3, overflow: TextOverflow.ellipsis)
        ],
      ),
    ).paddingAll(8);
  }
}
