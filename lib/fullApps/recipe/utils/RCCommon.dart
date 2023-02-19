import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/main.dart';

Widget loginOptions() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        child: Image.asset('images/cloudStorage/google_logo.png', height: 30, width: 30),
        decoration: BoxDecoration(border: Border.all(color: rcSecondaryTextColor), borderRadius: radius(16)),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 16),
      ),
      Container(
        child: Image.asset('images/cloudStorage/apple.png', height: 30, width: 30, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        decoration: BoxDecoration(border: Border.all(color: rcSecondaryTextColor), borderRadius: radius(16)),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 16),
      ),
      Container(
        child: Image.asset('images/banking/Banking_ic_facebook.png', height: 30, width: 30),
        decoration: BoxDecoration(border: Border.all(color: rcSecondaryTextColor), borderRadius: radius(16)),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 16),
      ),
    ],
  );
}

Widget rcProfileImage(String path, double h, double w) {
  return rcCommonCachedNetworkImage(path, height: h, width: w, fit: BoxFit.cover).cornerRadiusWithClipRRect(12);
}

Widget rcCommonCachedNetworkImage(
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
    return rcCommonCachedNetworkImage(url, height: height, width: width, fit: fit, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius}) {
  return Image.asset('images/app/placeholder.jpg', height: height, width: width, fit: fit ?? BoxFit.cover, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
}
