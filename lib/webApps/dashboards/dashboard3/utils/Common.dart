import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Colors.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Constants.dart';

bool isHovered = false;

Decoration commonCardDecoration(BuildContext context, {bool? isHover}) {
  if (isHover != null) {
    return boxDecorationWithRoundedCorners(borderRadius: radius(cardRadius), backgroundColor: isHover ? primaryColor : white);
  } else {
    return boxDecorationWithRoundedCorners(borderRadius: radius(cardRadius), backgroundColor: white);
  }
}
