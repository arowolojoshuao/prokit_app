import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizConstant.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class QuizEmailRequest extends StatefulWidget {
  static String tag = '/QuizEmailRequest';

  @override
  _QuizEmailRequestState createState() => _QuizEmailRequestState();
}

class _QuizEmailRequestState extends State<QuizEmailRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: text(quiz_lbl_email, fontSize: textSizeNormal, fontFamily: fontMedium),
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
                  Container(
                    margin: EdgeInsets.all(24.0),
                    decoration: boxDecoration(bgColor: context.cardColor, showShadow: true, radius: 10),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(16, 22, 16, 22),
                            hintText: "antonio@gmail.com",
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: quiz_textColorSecondary),
                          ),
                        ),
                        quizDivider(),
                        Container(
                          child: TextField(
                            maxLines: 5,
                            autocorrect: false,
                            decoration: InputDecoration(
                              hintText: quiz_hint_Description,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontSize: textSizeMedium,
                                color: quiz_textColorSecondary,
                                fontFamily: fontRegular,
                              ),
                            ),
                          ).paddingOnly(left: 16, right: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                      margin: EdgeInsets.all(24.0),
                      child: quizButton(
                          textContent: quiz_lbl_save,
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pop();
                              toasty(context, quiz_Submitted);
                            });
                          }))
                ],
              ),
            ),
          ),
        ));
  }
}
