import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFColors.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFConstant.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFImages.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../main.dart';

Widget socialLoginButton(BuildContext context, {String? socialImage, String? socialLoginName}) {
  return OutlinedButton(
    onPressed: () {},
    style: OutlinedButton.styleFrom(
      backgroundColor: context.scaffoldBackgroundColor,
      side: BorderSide(color: context.dividerColor, width: 1),
      padding: EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        commonCacheImageWidget(socialImage!, 20, fit: BoxFit.cover),
        8.width,
        Text(socialLoginName!, style: primaryTextStyle()),
      ],
    ),
  ).paddingSymmetric(horizontal: 24);
}

InputDecoration rfInputDecoration({Widget? suffixIcon, String? hintText, Widget? prefixIcon, bool? showPreFixIcon, String? lableText, bool showLableText = false}) {
  return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: gray.withOpacity(0.4)),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      hintText: hintText,
      hintStyle: secondaryTextStyle(),
      labelStyle: secondaryTextStyle(),
      labelText: showLableText.validate() ? lableText! : null,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: rf_primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: gray.withOpacity(0.4)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: redColor.withOpacity(0.4)),
      ),
      filled: true,
      fillColor: appStore.isDarkModeOn ? scaffoldDarkColor : white,
      suffix: suffixIcon.validate(),
      prefixIcon: showPreFixIcon.validate() ? prefixIcon.validate() : null);
}

Widget rfCommonRichText({String? title, String? subTitle, int? textSize, double? textHeight, Color? titleTextColor, Color? subTitleTextColor, TextStyle? titleTextStyle, TextStyle? subTitleTextStyle}) {
  return RichText(
    //textAlign: TextAlign.center,
    text: TextSpan(
      text: title.validate(),
      style: titleTextStyle ?? primaryTextStyle(size: textSize ?? 14, height: textHeight ?? 0, letterSpacing: 1.5),
      children: [
        TextSpan(
          text: subTitle.validate(),
          style: subTitleTextStyle ?? primaryTextStyle(color: subTitleTextColor ?? rf_primaryColor, size: textSize ?? 14, letterSpacing: 1.5),
        ),
      ],
    ),
  );
}

Widget socialLoginWidget(BuildContext context, {Function? callBack, String? title1, String? title2}) {
  return Column(
    children: [
      Column(
        children: [
          28.height,
          Text('Or Sign Up with', style: primaryTextStyle()),
          16.height,
          socialLoginButton(context, socialImage: rf_facebook_logo, socialLoginName: "Continue With Facebook").onTap(() {
            //
          }),
          16.height,
          socialLoginButton(context, socialImage: rf_google_logo, socialLoginName: "Continue With Google").onTap(() {
            //
          }),
          24.height,
          rfCommonRichText(title: title1, subTitle: title2).paddingAll(8).onTap(() {
            callBack!.call();
          })
        ],
      )
    ],
  );
}

Decoration shadowWidget(BuildContext context) {
  return boxDecorationWithRoundedCorners(
    backgroundColor: context.cardColor,
    boxShadow: [
      BoxShadow(spreadRadius: 0.4, blurRadius: 3, color: gray.withOpacity(0.1), offset: Offset(1, 6)),
    ],
  );
}

Widget rfCommonCachedNetworkImage(
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
    return Image.asset(url, height: height, width: width, fit: fit, color: color, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius}) {
  return Image.asset('images/app/placeholder.jpg', height: height, width: width, fit: fit ?? BoxFit.cover, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
}

Widget viewAllWidget({String? title, String? subTitle, Function? onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title!, style: boldTextStyle()),
      TextButton(
        onPressed: onTap!(),
        child: Text(subTitle!, style: secondaryTextStyle(decoration: TextDecoration.underline)),
      )
    ],
  );
}

Future<void> commonLaunchUrl(String address, {LaunchMode launchMode = LaunchMode.inAppWebView}) async {
  await launchUrl(Uri.parse(address), mode: launchMode).catchError((e) {
    toast('Invalid URL: $address');
  });
}

void launchMail(String? url) {
  if (url.validate().isNotEmpty) {
    commonLaunchUrl('mailto:' + url!, launchMode: LaunchMode.externalApplication);
  }
}

void launchCall(String? url) {
  if (url.validate().isNotEmpty) {
    if (isIOS)
      commonLaunchUrl('tel://' + url!, launchMode: LaunchMode.externalApplication);
    else
      commonLaunchUrl('tel:' + url!, launchMode: LaunchMode.externalApplication);
  }
}

PreferredSizeWidget commonAppBarWidget(BuildContext context, {String? title, double? appBarHeight, bool? showLeadingIcon, bool? bottomSheet, bool? roundCornerShape}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(appBarHeight ?? 100.0),
    child: AppBar(
      title: Text(title!, style: boldTextStyle(color: whiteColor, size: 20)),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      backgroundColor: rf_primaryColor,
      centerTitle: true,
      leading: showLeadingIcon.validate()
          ? SizedBox()
          : IconButton(
              onPressed: () {
                finish(context);
              },
              icon: Icon(Icons.arrow_back_ios_new, color: whiteColor, size: 18),
              color: rf_primaryColor,
            ),
      elevation: 0,
      shape: roundCornerShape.validate()
          ? RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)))
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
    ),
  );
}

extension strExt on String {
  Widget iconImage({Color? iconColor, double size = bottomNavigationIconSize}) {
    return Image.asset(
      this,
      width: size,
      height: size,
      color: iconColor ?? gray,
      errorBuilder: (_, __, ___) => placeHolderWidget(width: size, height: size),
    );
  }
}
