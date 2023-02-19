import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/learner/Screens/LearnerDashboard.dart';
import 'package:prokit_flutter/fullApps/learner/Screens/LearnerLogin.dart';
import 'package:prokit_flutter/fullApps/learner/model/LearnerModels.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerDataGenerator.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerImages.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerStrings.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/dots_indicator/dots_indicator.dart';

class LearnerWalkThrough extends StatefulWidget {
  static String tag = '/learner';

  @override
  _LearnerWalkThroughState createState() => _LearnerWalkThroughState();
}

class _LearnerWalkThroughState extends State<LearnerWalkThrough> {
  int currentIndexPage = 0;
  int? pageLength;
  var titles = ['Welcome', 'Select Course', 'Learn Topics'];
  var subTitles = [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text ",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text  ",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text"
  ];

  List<LearnerWalk>? mList1;

  @override
  void initState() {
    super.initState();
    mList1 = learnerWalkImg();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 24),
              width: MediaQuery.of(context).size.width,
              child: PageView(
                children: <Widget>[
                  WalkThrough(textContent: learner_walk_1),
                  WalkThrough(textContent: learner_walk_2),
                  WalkThrough(textContent: learner_walk_3),
                ],
                onPageChanged: (value) {
                  setState(() => currentIndexPage = value);
                },
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: 50,
              top: MediaQuery.of(context).size.height * 0.45,
              // left: MediaQuery.of(context).size.width * 0.35,
              child: Align(
                alignment: Alignment.center,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: currentIndexPage,
                  decorator: DotsDecorator(color: learner_greyColor, activeColor: learner_colorPrimary),
                ),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: MediaQuery.of(context).size.height * 0.5,
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(titles[currentIndexPage], style: boldTextStyle(size: 20, color: learner_textColorPrimary)),
                    SizedBox(height: 10),
                    Text(
                      subTitles[currentIndexPage],
                      style: primaryTextStyle(size: 18, color: learner_textColorSecondary),
                      textAlign: TextAlign.center,
                    ).center(),
                    SizedBox(height: 50),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        alignment: Alignment.center,
                        child: LearnerButton(
                          onPressed: () {
                            LearnerDashboard().launch(context);
                          },
                          textContent: learner_Get_Started,
                        ),
                      ),
                    ),
                    16.height,
                    Text(
                      "Login",
                      style: primaryTextStyle(decoration: TextDecoration.underline, color: learner_greyColor),
                    ).onTap(
                      () {
                        LearnerLogin().launch(context);
                      },
                    )
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        finish(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WalkThrough extends StatelessWidget {
  final String textContent;

  WalkThrough({Key? key, required this.textContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: SizedBox(
        child: Stack(
          children: <Widget>[
            Image.asset(learner_walk_BackImg, fit: BoxFit.fill, width: MediaQuery.of(context).size.width, height: (MediaQuery.of(context).size.height) * 0.4),
            SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height) * 0.4,
                alignment: Alignment.center,
                child: CachedNetworkImage(
                  placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                  imageUrl: textContent,
                  width: 300,
                  height: (MediaQuery.of(context).size.height) * 0.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
