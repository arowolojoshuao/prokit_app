import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/quizEmailRequest.dart';
import 'package:prokit_flutter/fullApps/quiz/model/QuizModels.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizConstant.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizDataGenerator.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:url_launcher/url_launcher.dart';

class QuizContactUs extends StatefulWidget {
  static String tag = '/QuizContactUs';

  @override
  _QuizContactUsState createState() => _QuizContactUsState();
}

class _QuizContactUsState extends State<QuizContactUs> {
  late List<QuizContactUsModel> mList;

  @override
  void initState() {
    super.initState();
    mList = quizContactUsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: text(quiz_lbl_contact_us, fontSize: textSizeNormal, fontFamily: fontMedium),
          iconTheme: IconThemeData(color: quiz_colorPrimary, size: 24),
          /*  leading: Icon(
            Icons.arrow_back,
            color: quiz_colorPrimary,
            size: 24,
          ).onTap(() {
            finish(context);
          }),*/
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
                8.height,
                ListView.builder(
                  itemCount: mList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) => GestureDetector(
                    onTap: () {
                      print(index);
                      if (index == 0) {
                        setState(() async {
                          var phone = "+00 356 646 234";
                          launch("tel:$phone");
                        });
                      } else {
                        setState(() {
                          QuizEmailRequest().launch(context);
                        });
                      }
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              text(mList[index].title, textColor: quiz_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontSemibold),
                              text(mList[index].subtitle, textColor: quiz_textColorSecondary, fontSize: textSizeMedium, fontFamily: fontRegular),
                            ],
                          ).paddingOnly(left: 16, right: 16),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                          color: blackColor,
                        ).paddingOnly(right: 16),
                      ],
                    ),
                  ).paddingOnly(top: 16, bottom: 16),
                )
              ]),
            ),
          ),
        ));
  }
}
