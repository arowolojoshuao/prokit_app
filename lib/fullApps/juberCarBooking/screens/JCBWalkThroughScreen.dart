import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBWelcomeScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';

class JCBWalkThroughScreen extends StatefulWidget {
  const JCBWalkThroughScreen({Key? key}) : super(key: key);

  @override
  State<JCBWalkThroughScreen> createState() => _JCBWalkThroughScreenState();
}

class _JCBWalkThroughScreenState extends State<JCBWalkThroughScreen> {
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
      title: 'Request a Ride',
      subTitle: 'Request a ride get picked up by a \nnearby community driver',
      image: 'images/juberCarBooking/jcb_walkthrough1.png',
    ));
    walkThroughList.add(WalkThroughModelClass(
      title: 'Vehicle Selection',
      subTitle: 'Users have the liberty to choose the \ntype of vehicles as per their need.',
      image: 'images/juberCarBooking/jcb_walkthrough2.png',
    ));
    walkThroughList.add(WalkThroughModelClass(
      title: 'Live Ride Tracking',
      subTitle: 'Know your driver in advance and be \nable to view current location in real \ntime on the map',
      image: 'images/juberCarBooking/jcb_walkthrough3.png',
    ));
    walkThroughList.add(WalkThroughModelClass(
      title: 'Trip Sharing',
      subTitle: 'Passengers can share their ride details with family and friends for safety reasons.',
      image: 'images/juberCarBooking/jcb_walkthrough4.png',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: jcbSecBackGroundColor,
      body: Column(
        children: [
          Container(
            height: context.height() * 0.88,
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                currentPage = index;
                setState(() {});
              },
              children: walkThroughList.map((e) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.statusBarHeight + 30),
                    Text(
                      e.title.validate(),
                      style: boldTextStyle(
                        size: 34,
                        fontFamily: jcbFont,
                        color: jcbDarkColor,
                        weight: FontWeight.w900,
                      ),
                    ).paddingSymmetric(horizontal: 24),
                    18.height,
                    Text(
                      e.subTitle.validate(),
                      style: primaryTextStyle(color: jcbDarkColor, weight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ).paddingSymmetric(horizontal: 24).expand(),
                    Image.asset(e.image.validate(), width: context.width(), height: context.height() * 0.63, fit: BoxFit.cover),
                  ],
                );
              }).toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: jcbDarkColor,
            width: context.width(),
            height: context.height() * 0.12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Skip', style: boldTextStyle(size: 14, color: Colors.white)).onTap(
                  () {
                    JCBWelcomeScreen().launch(context);
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                DotIndicator(
                  pageController: pageController,
                  pages: walkThroughList,
                  unselectedIndicatorColor: Colors.grey.withOpacity(0.5),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Text(currentPage == 3 ? 'FINISH' : 'NEXT', style: boldTextStyle(size: 14, color: Colors.white)),
                  decoration: BoxDecoration(color: jcbSecondaryColor, borderRadius: radius(32)),
                ).onTap(() {
                  if (currentPage == 3) {
                    JCBWelcomeScreen().launch(context);
                  } else {
                    pageController.nextPage(duration: Duration(milliseconds: 550), curve: Curves.decelerate);
                  }
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
