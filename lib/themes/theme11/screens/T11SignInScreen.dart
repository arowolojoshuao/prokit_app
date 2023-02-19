import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Images.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Strings.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Widget.dart';

import '../../../main.dart';

class T11SignInScreen extends StatefulWidget {
  static String tag = '/T11SignInScreen';

  @override
  T11SignInScreenState createState() => T11SignInScreenState();
}

class T11SignInScreenState extends State<T11SignInScreen> {
  @override
  void initState() {
    setStatusBarColor(appStore.appBarColor!, statusBarIconBrightness: Brightness.dark);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            commonCacheImageWidget(t11_ic_music_logo, 100, width: 100),
            16.height,
            t11EditTextStyle(t11_hint_Email, TextFieldType.NAME),
            8.height,
            t11EditTextStyle(t11_hint_password, TextFieldType.PASSWORD),
            8.height,
            Align(
              alignment: Alignment.centerRight,
              child: Text(t11_lbl_forgot_your_password, style: secondaryTextStyle()),
            ),
            16.height,
            Container(
              decoration: boxDecorationRoundedWithShadow(24, backgroundColor: appColorPrimary),
              width: context.width(),
              padding: EdgeInsets.all(12),
              alignment: Alignment.center,
              child: Text(t11_lbl_login, style: boldTextStyle(color: white)),
            ).onTap(() {
              finish(context);
            }),
            16.height,
            createRichText(
              list: <TextSpan>[
                TextSpan(text: t11_lbl_need_an_account + ' ', style: secondaryTextStyle()),
                TextSpan(
                  text: t11_lbl_sign_up,
                  style: secondaryTextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                ),
              ],
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
