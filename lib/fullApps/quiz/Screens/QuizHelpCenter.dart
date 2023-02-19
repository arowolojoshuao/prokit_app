import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizConstant.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class QuizHelpCenter extends StatefulWidget {
  static String tag = '/QuizHelpCenter';

  @override
  _QuizHelpCenterState createState() => _QuizHelpCenterState();
}

class _QuizHelpCenterState extends State<QuizHelpCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text(quiz_lbl_Help_Center, fontSize: textSizeNormal, fontFamily: fontMedium),
        iconTheme: IconThemeData(color: quiz_colorPrimary, size: 24),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              16.height,
              Container(
                margin: EdgeInsets.all(24.0),
                decoration: boxDecoration(bgColor: context.cardColor, showShadow: true, radius: 10),
                child: Column(
                  children: <Widget>[
                    quizEditTextStyle(quiz_hint_Mobile_Number, isPassword: false),
                    quizDivider(),
                    quizEditTextStyle(quiz_hint_your_email, isPassword: false),
                    quizDivider(),
                    Container(
                      height: 80,
                      child: TextField(
                        minLines: 10,
                        maxLines: 15,
                        autocorrect: false,
                        decoration: InputDecoration(
                          hintText: quiz_hint_Description,
                          border: InputBorder.none,
                          hintStyle: TextStyle(fontSize: textSizeMedium, color: quiz_textColorSecondary, fontFamily: fontRegular),
                        ),
                      ).paddingOnly(left: 16, right: 16),
                    ),
                  ],
                ),
              ),
              60.height,
              Container(
                margin: EdgeInsets.all(24.0),
                child: quizButton(
                  textContent: quiz_lbl_Submit,
                  onPressed: () {
                    setState(
                      () {
                        Navigator.of(context).pop();
                        toasty(context, quiz_Thank_you_Successfully_Added);
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
