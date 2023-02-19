import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/colors.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/images.dart';
import 'package:prokit_flutter/main.dart';
import 'package:url_launcher/url_launcher.dart';

Widget CommonCachedNetworkImage(
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

Widget CommonButton({String? buttonText, Function()? onTap, double? width, double? margin}) {
  return AppButton(
    onTap: onTap,
    width: width,
    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    margin: EdgeInsets.symmetric(horizontal: margin.validate()),
    child: Text(buttonText.validate(), style: boldTextStyle(color: Colors.white)),
    color: primaryColor,
    padding: EdgeInsets.symmetric(vertical: 16),
  );
}

PreferredSizeWidget commonAppBarWidget(BuildContext context, {bool? showLeadingIcon = true, Color? iconColor, String? title, bool? changeIcon, Widget? iconWidget1, Widget? iconWidget2, Color? appBarColor}) {
  return AppBar(
    title: Text(title!, style: boldTextStyle(color: context.iconColor, size: 20)),
    backgroundColor: appBarColor ?? context.scaffoldBackgroundColor,
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        finish(context);
      },
      icon: Icon(changeIcon.validate() ? Icons.arrow_back_outlined : Icons.close, color: iconColor ?? context.iconColor, size: 22).visible(showLeadingIcon.validate()),
      color: context.iconColor,
    ),
    actions: [iconWidget1.validate(), iconWidget2.validate()],
    elevation: 0,
  );
}

InputDecoration inputDecoration(BuildContext context, {Widget? suffixIcon, Widget? prefixIcon, String? labelText, double? borderRadius}) {
  return InputDecoration(
    contentPadding: EdgeInsets.only(left: 12, bottom: 10, top: 10, right: 10),
    labelText: labelText,
    labelStyle: secondaryTextStyle(),
    alignLabelWithHint: true,
    prefixIcon: prefixIcon,
    enabledBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide(color: Colors.transparent, width: 0.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide(color: Colors.red, width: 0.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide(color: Colors.red, width: 1.0),
    ),
    errorMaxLines: 2,
    errorStyle: primaryTextStyle(color: Colors.red, size: 12),
    focusedBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide(color: primaryColor, width: 0.0),
    ),
    filled: true,
    fillColor: appStore.isDarkModeOn ? cardDarkColor : gray.withOpacity(0.1),
  );
}

extension strEtx on String {
  Widget iconImage({double? size, Color? color, BoxFit? fit}) {
    return Image.asset(
      this,
      height: size ?? 24,
      width: size ?? 24,
      fit: fit ?? BoxFit.cover,
      color: color ?? (appStore.isDarkModeOn ? Colors.white : gray.withOpacity(0.6)),
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(ic_message, height: size ?? 24, width: size ?? 24);
      },
    );
  }
}

Widget paymentComponent(String paymentImage, {Color? logo_color}) {
  return Container(
    padding: EdgeInsets.all(6),
    margin: EdgeInsets.only(right: 4),
    decoration: boxDecorationWithRoundedCorners(
      boxShape: BoxShape.circle,
      border: Border.all(color: white),
      backgroundColor: logo_color ?? yellow,
    ),
    child: CommonCachedNetworkImage(paymentImage, width: 22, height: 22, fit: BoxFit.cover),
  );
}

Decoration commonDecoration() {
  return boxDecorationWithRoundedCorners(
    backgroundColor: appStore.isDarkModeOn ? cardDarkColor : gray.withOpacity(0.1),
  );
}

Widget portfolioType({String? image, String? portfolioTitle}) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(12),
        decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: primaryColor),
        child: CommonCachedNetworkImage(image.validate(), fit: BoxFit.cover, color: white, height: 20, width: 20),
      ),
      16.height,
      Text(portfolioTitle.validate(), style: boldTextStyle()),
    ],
  );
}

Widget get trailing {
  return ic_arrow_right.iconImage(size: 22);
}

Widget settingIconWidget({IconData? icon}) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.symmetric(vertical: 8),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(color: primaryColor, shape: BoxShape.circle),
    child: Icon(icon, color: white, size: 20),
  );
}

Widget commonSocialLoginButton(BuildContext context) {
  return Row(
    children: [
      OutlinedButton(
        onPressed: () {
          //
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0, color: appStore.isDarkModeOn ? white : gray.withOpacity(0.1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonCachedNetworkImage(google_logo, fit: BoxFit.cover, width: 20, height: 20),
            8.width,
            Text('Google', style: boldTextStyle(color: context.iconColor)),
          ],
        ),
      ).expand(),
      16.width,
      OutlinedButton(
        onPressed: () {
          //
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0, color: appStore.isDarkModeOn ? white : gray.withOpacity(0.1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonCachedNetworkImage(apple_logo, fit: BoxFit.cover, width: 20, height: 20),
            8.width,
            Text('Apple', style: boldTextStyle(color: context.iconColor)),
          ],
        ),
      ).expand()
    ],
  );
}

Future<void> commonLaunchUrl(String address, {LaunchMode launchMode = LaunchMode.inAppWebView}) async {
  await launchUrl(Uri.parse(address), mode: launchMode).catchError((e) {
    toast('Invalid URL: $address');
  });
}

Widget commonImageWidget({String? image}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: primaryColor),
        width: 150,
        height: 150,
      ),
      Positioned(
        bottom: -40,
        child: CommonCachedNetworkImage(image.validate(), fit: BoxFit.cover, width: 150, height: 150, color: white),
      ),
    ],
  );
}
