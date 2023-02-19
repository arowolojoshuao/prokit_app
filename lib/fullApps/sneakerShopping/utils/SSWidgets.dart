import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/screen/SSProductScreen.dart';
import 'package:prokit_flutter/main.dart';

sSAppButton({
  Function? onPressed,
  String? title,
  required BuildContext context,
  Color? color,
  Color? textColor,
}) {
  return AppButton(
    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24), side: BorderSide(color: Color(0xff808080), width: 1)),
    text: title,
    color: color ?? Color(0xff000000),
    textColor: textColor ?? Color(0xfffffbfb),
    onTap: () {
      onPressed!();
    },
    width: context.width(),
  );
}

InputDecoration sSInputDecoration({String? name, BuildContext? context, Widget? icon}) {
  return InputDecoration(
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(color: appStore.isDarkModeOn ? context!.cardColor : Colors.grey.withOpacity(0.4), width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(color: appStore.isDarkModeOn ? context!.cardColor : Colors.grey.withOpacity(0.4), width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(color: appStore.isDarkModeOn ? context!.cardColor : Colors.grey.withOpacity(0.4), width: 1),
    ),
    labelText: name,
    labelStyle: primaryTextStyle(),
    hintStyle: TextStyle(fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 14, color: Color(0xff000000)),
    filled: true,
    fillColor: appStore.isDarkModeOn ? context!.cardColor : Color(0xfff2f2f3),
    isDense: false,
    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    suffixIcon: icon,
  );
}

Widget settingWidget({String? title, String? subtitle}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(title!, style: boldTextStyle()),
      Text(subtitle!, style: secondaryTextStyle(), maxLines: 2),
    ],
  );
}

Widget arrivalWidget({String? img, BuildContext? context}) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        SSProductScreen(img: img).launch(context!);
      },
      child: Stack(
        children: [
          commonCachedNetworkImage(img!, height: 250, width: context!.width(), fit: BoxFit.cover),
          Container(
            height: 250,
            decoration: BoxDecoration(color: Colors.black12),
          ),
        ],
      ),
    ),
  );
}
