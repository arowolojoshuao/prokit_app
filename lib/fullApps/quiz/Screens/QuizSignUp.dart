import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizCreatePassword.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizConstant.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class QuizSignUp extends StatefulWidget {
  static String tag = '/QuizSignUp';

  @override
  _QuizSignUpState createState() => _QuizSignUpState();
}

class _QuizSignUpState extends State<QuizSignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: text(quiz_lbl_create_account, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
          leading: Icon(Icons.arrow_back, color: quiz_colorPrimary, size: 24).onTap(
            () {
              finish(context);
            },
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Container(
            height: context.height(),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  16.height,
                  Text(
                    quiz_info_sign_up,
                    style: boldTextStyle(color: quiz_textColorSecondary),
                    textAlign: TextAlign.center,
                  ).center(),
                  Container(
                    margin: EdgeInsets.all(24.0),
                    decoration: boxDecoration(bgColor: context.cardColor, showShadow: true, radius: 10),
                    child: quizEditTextStyle(quiz_hint_your_email, isPassword: false),
                  ),
                  16.height,
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(quiz_lbl_already_have_an_account, style: primaryTextStyle()),
                        4.height,
                        Text(quiz_lbl_sign_in, style: boldTextStyle(color: quiz_colorPrimary)),
                      ],
                    ),
                  ).onTap(
                    () {
                      finish(context);
                    },
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.all(24.0),
                    child: quizButton(
                      textContent: quiz_lbl_continue,
                      onPressed: () {
                        setState(() {
                          QuizCreatePassword().launch(context);
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
