import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMColors.dart';
import 'package:prokit_flutter/main.dart';

Widget upperContainer({required Widget child, required BuildContext screenContext}) {
  return Container(
    color: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
    width: screenContext.width(),
    child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: bmSpecialColor, borderRadius: radiusOnly(bottomLeft: 40)),
      child: child,
    ),
  );
}

Widget lowerContainer({required Widget child, required BuildContext screenContext}) {
  return Container(
    color: bmSpecialColor,
    width: screenContext.width(),
    child: Container(
      decoration: BoxDecoration(
        color: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
        borderRadius: radiusOnly(topRight: 40),
      ),
      child: child,
    ),
  );
}

Widget headerText({required String title}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      50.height,
      Text(title, style: boldTextStyle(size: 30, color: white)),
      16.height,
    ],
  );
}

Widget titleText({required String title, int? size, int? maxLines}) {
  return Text(
    title,
    style: boldTextStyle(size: size != null ? size : 20, color: appStore.isDarkModeOn ? white : bmSpecialColorDark),
    maxLines: maxLines != null ? maxLines : 1,
    overflow: TextOverflow.ellipsis,
  );
}

Widget bmCommonCachedNetworkImage(
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
    return Image.network(url, height: height, width: width, fit: fit, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius}) {
  return Image.asset('images/app/placeholder.jpg', height: height, width: width, fit: fit ?? BoxFit.cover, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
}
