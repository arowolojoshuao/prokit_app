import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizConstant.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class QuizChangePassword extends StatefulWidget {
  static String tag = '/QuizChangePassword';

  @override
  _QuizChangePasswordState createState() => _QuizChangePasswordState();
}

class _QuizChangePasswordState extends State<QuizChangePassword> {
  var oldObscureText = true;
  var newObscureText = true;
  var confirmObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text(quiz_lbl_Change_password, fontSize: textSizeNormal, fontFamily: fontMedium),
        iconTheme: IconThemeData(color: quiz_colorPrimary, size: 24),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                16.height,
                Text(
                  'Enter your new password below\n the old password',
                  style: boldTextStyle(color: quiz_textColorSecondary),
                  textAlign: TextAlign.center,
                ).center(),
                Container(
                  margin: EdgeInsets.all(24.0),
                  decoration: boxDecoration(bgColor: context.cardColor, showShadow: true, radius: 10),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
                        obscureText: oldObscureText,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(16, 22, 16, 22),
                          border: InputBorder.none,
                          hintText: quiz_hint_Old_Password,
                          labelStyle: primaryTextStyle(size: 20, color: quiz_textColorPrimary),
                          suffix: text(oldObscureText ? "Show" : "Hide", textColor: quiz_textColorSecondary, fontSize: textSizeMedium, fontFamily: fontMedium).onTap(
                            () {
                              setState(
                                () {
                                  oldObscureText = !oldObscureText;
                                },
                              );
                            },
                          ),
                          //suffixText: (obscureText ? "show" : "hide")
                        ),
                      ),
                      quizDivider(),
                      TextFormField(
                        style: TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
                        obscureText: newObscureText,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(16, 22, 16, 22),
                          border: InputBorder.none,
                          hintText: quiz_hint_new_Password,
                          labelStyle: primaryTextStyle(size: 20, color: quiz_textColorPrimary),
                          suffix: text(newObscureText ? "Show" : "Hide", textColor: quiz_textColorSecondary, fontSize: textSizeMedium, fontFamily: fontMedium).onTap(
                            () {
                              setState(
                                () {
                                  newObscureText = !newObscureText;
                                },
                              );
                            },
                          ),
                          //suffixText: (obscureText ? "show" : "hide")
                        ),
                      ),
                      quizDivider(),
                      TextFormField(
                        style: TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
                        obscureText: confirmObscureText,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(16, 22, 16, 22),
                          border: InputBorder.none,
                          hintText: quiz_hint_confirm_password,
                          labelStyle: primaryTextStyle(size: 20, color: quiz_textColorPrimary),
                          suffix: text(confirmObscureText ? "Show" : "Hide", textColor: quiz_textColorSecondary, fontSize: textSizeMedium, fontFamily: fontMedium).onTap(
                            () {
                              setState(
                                () {
                                  confirmObscureText = !confirmObscureText;
                                },
                              );
                            },
                          ),
                          //suffixText: (obscureText ? "show" : "hide")
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  margin: EdgeInsets.all(24.0),
                  child: quizButton(
                    textContent: quiz_lbl_Submit,
                    onPressed: () {
                      setState(
                        () {
                          finish(context);
                          toasty(context, quiz_Password_Updated);
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
