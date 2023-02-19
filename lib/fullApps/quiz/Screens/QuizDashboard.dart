import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizAllList.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizHome.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizProfile.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizImages.dart';

class QuizDashboard extends StatefulWidget {
  static String tag = '/QuizDashboard';

  @override
  _QuizDashboardState createState() => _QuizDashboardState();
}

class _QuizDashboardState extends State<QuizDashboard> {
  var selectedIndex = 0;

  var pages = [
    QuizHome(),
    QuizAllList(),
    QuizProfile(),
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  void _onItemTapped(int index) {
    setState(
      () {
        selectedIndex = index;
        if (selectedIndex == 0) {
        } else if (selectedIndex == 1) {
        } else if (selectedIndex == 2) {}
      },
    );
  }

  Widget quizItem(var pos, var icon, var title) {
    return Container(
      height: 55,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            icon,
            width: 20,
            height: 20,
            color: selectedIndex == pos ? quiz_colorPrimary : quiz_icon_color,
          ),
          Text(title, style: primaryTextStyle(color: selectedIndex == pos ? quiz_colorPrimary : quiz_icon_color))
        ],
      ),
    ).onTap(
      () {
        setState(
          () {
            _onItemTapped(pos);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.cardColor,
      body: SafeArea(child: pages[selectedIndex]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: context.cardColor,
          border: Border.all(
            color: quiz_ShadowColor,
          ),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: quiz_ShadowColor, blurRadius: 10, spreadRadius: 2, offset: Offset(0, 3.0)),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 0.0, right: 0, top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              quizItem(0, quiz_ic_homes, "Home"),
              quizItem(1, quiz_ic_quiz, "Quiz"),
              quizItem(2, quiz_ic_user, "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
