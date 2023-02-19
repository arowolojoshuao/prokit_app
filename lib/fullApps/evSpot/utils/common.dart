import 'package:prokit_flutter/fullApps/evSpot/utils/colors.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

InputDecoration inputDecoration(BuildContext context, {String? hintText, InputBorder? inputBorder}) {
  return InputDecoration(
    border: inputBorder ?? OutlineInputBorder(borderRadius: BorderRadius.circular(DEFAULT_RADIUS)),
    hintText: hintText ?? '',
    hintStyle: secondaryTextStyle(color: Colors.grey),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ev_primary_color), borderRadius: BorderRadius.circular(DEFAULT_RADIUS)),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(DEFAULT_RADIUS)),
  );
}

ButtonStyle getElevatedButtonStyle() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all(ev_primary_color),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(DEFAULT_RADIUS))),
  );
}
