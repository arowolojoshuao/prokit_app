import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizMobileVerify.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class QuizCreatePassword extends StatefulWidget {
  static String tag = '/QuizCreatePassword';

  @override
  _QuizCreatePasswordState createState() => _QuizCreatePasswordState();
}

class _QuizCreatePasswordState extends State<QuizCreatePassword> {
  var obscureText = true;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quiz_lbl_Create_password, style: boldTextStyle()),
        leading: Icon(Icons.arrow_back, color: quiz_colorPrimary, size: 24).onTap(
          () {
            finish(context);
          },
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: context.height(),
              child: Column(
                children: <Widget>[
                  Text(
                    quiz_info_create_password,
                    style: boldTextStyle(color: quiz_textColorSecondary),
                  ).paddingOnly(left: 40, right: 40, top: 16),
                  16.height,
                  Container(
                    margin: EdgeInsets.all(24.0),
                    decoration: boxDecoration(bgColor: context.cardColor, showShadow: true, radius: 10),
                    child: TextFormField(
                      style: primaryTextStyle(),
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(16, 22, 16, 22),
                        border: InputBorder.none,
                        hintStyle: primaryTextStyle(),
                        hintText: quiz_hint_your_password,
                        labelStyle: primaryTextStyle(size: 20, color: quiz_textColorPrimary),
                        suffix: Text(
                          obscureText ? "Show" : "Hide",
                          style: primaryTextStyle(color: quiz_textColorSecondary),
                        ).onTap(
                          () {
                            setState(
                              () {
                                obscureText = !obscureText;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
                  16.height,
                  Container(
                    margin: EdgeInsets.all(24.0),
                    child: quizButton(
                      textContent: quiz_lbl_continue,
                      onPressed: () {
                        setState(
                          () {
                            QuizMobileVerify().launch(context);
                          },
                        );
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
