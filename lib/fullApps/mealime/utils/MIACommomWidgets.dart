import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIABuildMealScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';

PreferredSizeWidget miaAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, color: miaPrimaryColor),
      onPressed: () {
        finish(context);
      },
    ).paddingSymmetric(horizontal: 8),
    title: TextButton(
      child: Text('Back', style: primaryTextStyle(color: miaPrimaryColor)),
      onPressed: () {
        finish(context);
      },
    ),
    elevation: 0,
    titleSpacing: 0,
    leadingWidth: 30,
  );
}

PreferredSizeWidget miaFragmentAppBar(BuildContext context, String name, bool isMealFragment) {
  return AppBar(
    toolbarHeight: 100,
    title: Text(name, style: boldTextStyle(size: 24)).paddingOnly(top: 30, bottom: 20),
    leadingWidth: 0,
    leading: SizedBox(),
    elevation: 0,
    actions: [
      isMealFragment
          ? IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                MIABuildMealScreen().launch(context);
              },
            )
          : Offstage(),
    ],
  );
}

Widget miaCommonCachedNetworkImage(
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
    return miaCommonCachedNetworkImage(url, height: height, width: width, fit: fit, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius}) {
  return Image.asset('images/app/placeholder.jpg', height: height, width: width, fit: fit ?? BoxFit.cover, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
}
