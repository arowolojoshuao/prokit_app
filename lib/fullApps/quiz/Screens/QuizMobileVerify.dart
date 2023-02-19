import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizDashboard.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizVerifcation.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizWidget.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/codePicker/country_code_picker.dart';

class QuizMobileVerify extends StatefulWidget {
  static String tag = '/QuizMobileVerify';

  @override
  _QuizMobileVerifyState createState() => _QuizMobileVerifyState();
}

class _QuizMobileVerifyState extends State<QuizMobileVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quiz_lbl_let_started, style: boldTextStyle()),
        leading: Icon(Icons.arrow_back, color: quiz_colorPrimary, size: 24).onTap(
          () {
            finish(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Text(
              quiz_lbl_skip,
              style: boldTextStyle(color: quiz_textColorSecondary),
            ).paddingOnly(top: 16, right: 8).onTap(
              () {
                setState(
                  () {
                    QuizDashboard().launch(context);
                  },
                );
              },
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                16.height,
                Text(
                  quiz_info_let_started,
                  style: boldTextStyle(color: quiz_textColorSecondary),
                  textAlign: TextAlign.center,
                ).center(),
                16.height,
                Container(
                  margin: EdgeInsets.all(24.0),
                  decoration: boxDecoration(bgColor: context.cardColor, showShadow: true, radius: 10),
                  child: Row(
                    children: <Widget>[
                      4.height,
                      CountryCodePicker(onChanged: print, showFlag: false),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: quiz_colorPrimary,
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      ),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          style: primaryTextStyle(),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(16, 22, 16, 22),
                            counterText: "",
                            hintText: quiz_hint_Mobile_Number,
                            hintStyle: primaryTextStyle(color: appStore.isDarkModeOn ? white : quiz_textColorPrimary),
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                16.height,
                Container(
                  child: Column(
                    children: [
                      Text(quiz_lbl_already_have_an_account, style: primaryTextStyle()),
                      4.height,
                      Text(quiz_lbl_sign_in, style: boldTextStyle(color: quiz_colorPrimary)),
                    ],
                  ).onTap(
                    () {
                      finish(context);
                    },
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
                          QuizVerification().launch(context);
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
    );
  }
}
