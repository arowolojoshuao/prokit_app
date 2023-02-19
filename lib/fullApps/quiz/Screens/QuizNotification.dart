import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizDashboard.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizImages.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class QuizNotification extends StatefulWidget {
  static String tag = '/QuizNotification';

  @override
  _QuizNotificationState createState() => _QuizNotificationState();
}

class _QuizNotificationState extends State<QuizNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: quiz_colorPrimary, size: 24).onTap(() {
          finish(context);
        }),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: context.height(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              48.height,
              CachedNetworkImage(
                placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                imageUrl: quiz_ic_notification,
                height: 200,
                width: 200,
              ).cornerRadiusWithClipRRect(100).center(),
              Text(
                quiz_lbl_notifications,
                style: boldTextStyle(color: appStore.isDarkModeOn ? white : quiz_textColorPrimary, size: 24),
              ).paddingOnly(top: 24),
              16.height,
              Text(
                quiz_info_notification,
                style: secondaryTextStyle(color: quiz_textColorSecondary),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 130,
                decoration: boxDecoration(bgColor: quiz_colorPrimary, radius: 16),
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  children: [
                    Text("Allow", style: boldTextStyle(color: quiz_white)).paddingOnly(left: 8, right: 8),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, color: quiz_colorPrimaryDark),
                        width: 35,
                        height: 35,
                        child: Icon(Icons.arrow_forward, color: quiz_white, size: 20).paddingAll(8),
                      ),
                    ),
                  ],
                ),
              ).onTap(
                () {
                  setState(
                    () {
                      QuizDashboard().launch(context);
                    },
                  );
                },
              ).paddingOnly(top: 24),
              24.height,
              Text(quiz_lbl_skip, style: boldTextStyle(color: quiz_textColorSecondary)).onTap(() {
                setState(
                  () {
                    QuizDashboard().launch(context);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
