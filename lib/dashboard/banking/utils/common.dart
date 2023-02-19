import 'package:flutter/cupertino.dart';
import 'package:prokit_flutter/dashboard/banking/utils/colors.dart';

Gradient primaryLinearGradient() {
  return LinearGradient(
    colors: [primaryBankingColor2, primaryBankingColor1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
