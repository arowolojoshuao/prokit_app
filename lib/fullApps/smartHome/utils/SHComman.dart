import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'SHColors.dart';

settIngContainer({String? title, IconData? icon, Function? onTap, Color? textColor}) {
  return Container(
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 8),
    decoration: BoxDecoration(color: SHContainerColor, borderRadius: BorderRadius.circular(16)),
    child: Row(
      children: [Icon(icon, color: white), 16.width, Text(title!, style: primaryTextStyle(color: textColor))],
    ),
  ).onTap(onTap);
}

Widget commonSHCachedNetworkImage(
  String? url, {
  double? height,
  double? width,
  BoxFit? fit,
  AlignmentGeometry? alignment,
  bool usePlaceholderIfUrlEmpty = true,
  double? radius,
  Color? color,
}) {
  if (url!.validate().isEmpty) {
    return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      color: color,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return SizedBox();
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
    );
  } else {
    return Image.asset(
      url,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment ?? Alignment.center,
    ).cornerRadiusWithClipRRect(
      radius ?? defaultRadius,
    );
  }
}

Widget placeHolderWidget({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius, Focus? focus}) {
  return Image.asset('images/dating/placeholder.jpg', height: height, width: width, fit: fit ?? BoxFit.cover, alignment: alignment ?? Alignment.center)
      .cornerRadiusWithClipRRect(radius ?? defaultRadius);
}

InputDecoration buildSHInputDecoration(
  String name, {
  Widget? prefixIcon,
  Widget? suffixIcon,
  Color? textColor,
}) {
  return InputDecoration(
    contentPadding: EdgeInsets.only(left: 16),
    prefixIcon: prefixIcon,
    hintText: name,
    hintStyle: secondaryTextStyle(color: textColor),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0), borderSide: BorderSide(color: grey, width: 0.5)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0), borderSide: BorderSide(color: grey, width: 0.5)),
  );
}

Widget memberAccessWidget({double? width, String? name}) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: SHContainerColor,
    ),
    width: width,
    child: Row(
      children: [
        Text(name!, style: primaryTextStyle(color: white)).expand(),
        Text('All', style: boldTextStyle(color: tomato)),
        Icon(Icons.arrow_drop_down, color: tomato),
      ],
    ),
  );
}

Widget appButton({IconData? icon, String? text}) {
  return AppButton(
    color: SHScaffoldDarkColor,
    shapeBorder: RoundedRectangleBorder(borderRadius: radius(16)),
    onTap: () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.power_settings_new, color: Colors.red),
        8.width,
        Text("Turn Off", style: primaryTextStyle(color: Colors.red)),
      ],
    ),
  );
}

Widget button({double? width, String? text, Color? textColor, Function? onTap, required BuildContext context}) {
  return Container(
    width: context.width(),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      //color: SHSecondaryColor
      gradient: LinearGradient(
        colors: [button1Color, button2Color],
        begin: FractionalOffset.topLeft,
        end: FractionalOffset.centerRight,
      ),
    ),
    child: TextButton(
      child: Text(
        text!,
        style: boldTextStyle(color: textColor),
      ),
      onPressed: onTap as void Function()?,
    ),
  );
}
