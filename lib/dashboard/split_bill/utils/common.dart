import 'package:flutter/material.dart';
import 'package:prokit_flutter/dashboard/split_bill/utils/colors.dart';

Gradient primarySplitBillLinearGradient() {
  return LinearGradient(
    colors: [bottomNavBackgroundColor, lightBackgroundColor],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    tileMode: TileMode.mirror,
  );
}

Gradient primarySplitBillLightGradient() {
  return LinearGradient(
    colors: [primarySplitBillColor, Colors.white],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    tileMode: TileMode.mirror,
    stops: [0.4, 1],
  );
}
