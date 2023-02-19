import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIAPickDietScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIACommomWidgets.dart';

class WalkThroughModelScreen extends StatefulWidget {
  const WalkThroughModelScreen({Key? key}) : super(key: key);

  @override
  _WalkThroughModelScreenState createState() => _WalkThroughModelScreenState();
}

class _WalkThroughModelScreenState extends State<WalkThroughModelScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  List<WalkThroughModelClass> walkThroughList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    walkThroughList.add(WalkThroughModelClass(
        title: 'Personalized meal planning',
        subTitle: 'Pick your week\'s meal in minutes. With over 200 personalization options eat exactly how you want to eat.',
        image: 'images/mealime/walkthrough_one.png'));
    walkThroughList.add(WalkThroughModelClass(
        title: 'Simple, stress-free grocery shopping', subTitle: 'Grocery shop once per week with an organized "done for you" shopping list.', image: 'images/mealime/walkthrough_two.png'));
    walkThroughList.add(WalkThroughModelClass(
        title: 'Delicious healthy meals made easy', subTitle: 'Easily cook healthy, delicious meals in about 30 minutes, from start to finish.', image: 'images/mealime/walkthrough_three.png'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: miaAppBar(context),
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: pageController,
            children: walkThroughList.map((e) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(e.title!, style: boldTextStyle(size: 30), textAlign: TextAlign.center).paddingAll(20),
                  30.height,
                  Image.asset(e.image!, height: 230, fit: BoxFit.cover),
                  30.height,
                  Text(e.subTitle!, style: secondaryTextStyle(size: 16, color: miaSecondaryTextColor), textAlign: TextAlign.center).paddingAll(20),
                ],
              );
            }).toList(),
          ),
          Positioned(
            bottom: 100,
            child: DotIndicator(
              indicatorColor: miaSecondaryColor,
              pageController: pageController,
              pages: walkThroughList,
              unselectedIndicatorColor: miaSecondaryTextColor,
              onPageChanged: (index) {
                setState(
                  () {
                    currentPage = index;
                  },
                );
              },
            ),
          ),
          Positioned(
            bottom: 20,
            child: AppButton(
              color: miaPrimaryColor,
              text: 'Continue',
              textStyle: boldTextStyle(color: white),
              onTap: () {
                MIAPickDietScreen().launch(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
