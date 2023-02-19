import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCWalkThroughComponents.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCWalkThroughModel.dart';
import 'package:prokit_flutter/fullApps/recipe/screens/RCSignUpScreen.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/main.dart';

class RCWalkThroughScreen extends StatefulWidget {
  const RCWalkThroughScreen({Key? key}) : super(key: key);

  @override
  _RCWalkThroughScreenState createState() => _RCWalkThroughScreenState();
}

class _RCWalkThroughScreenState extends State<RCWalkThroughScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;

  List<RCWalkThroughModel> walkThroughList = getListWalkThrough();

  @override
  void initState() {
    super.initState();
    setStatusBarColor(appStore.isDarkModeOn ? Colors.black : Colors.white);
  }

  Widget getWalkThroughComponent() {
    if (currentIndexPage == 0) {
      return RCWalkThroughComponentOne();
    } else if (currentIndexPage == 1) {
      return RCWalkThroughComponentTwo();
    } else {
      return RCWalkThroughComponentThree();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appStore.isDarkModeOn ? Colors.black : Colors.white,
        body: Stack(
          children: [
            Container(
              width: context.width(),
              height: context.height(),
              child: PageView(
                controller: pageController,
                children: [RCWalkThroughComponentOne(), RCWalkThroughComponentTwo(), RCWalkThroughComponentThree()],
                onPageChanged: (value) {
                  setState(() => currentIndexPage = value);
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            Positioned(
              right: 20,
              top: context.statusBarHeight + 40,
              child: Text('Skip', style: boldTextStyle(color: primaryColor)).onTap(() {
                RCSignUpScreen(selectedIndex: 0).launch(context);
              }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
            ),
            Positioned(
              top: context.statusBarHeight + 40,
              left: 20,
              child: DotIndicator(
                pageController: pageController,
                pages: walkThroughList,
                indicatorColor: primaryColor,
                unselectedIndicatorColor: rcSecondaryColor,
              ),
            ),
          ],
        ));
  }
}
