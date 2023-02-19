import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/stockMarket/model/stock_invest_model.dart';
import 'package:prokit_flutter/fullApps/stockMarket/screens/signin_screen.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/images.dart';
import 'package:prokit_flutter/main.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> with SingleTickerProviderStateMixin {
  PageController pageController = PageController();
  int currentPage = 0;
  List<StockInvestModel> list = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    list.add(StockInvestModel(title: 'The Simplest Way to Invest', subTitle: "Invest with only three taps on your phone \nand enjoy the low fee.", image: walkThrough1));
    list.add(StockInvestModel(title: 'Get Better Returns', subTitle: "Invest in the world leading brands & \nunlock amazing returns.", image: walkThrough2));
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            PageView(
              controller: pageController,
              children: list.map((e) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: boxDecorationWithShadow(boxShape: BoxShape.circle, backgroundColor: greenColor),
                          width: 350,
                          height: 350,
                        ),
                        CommonCachedNetworkImage(e.image.validate(), fit: BoxFit.cover, width: context.width() * 0.8, radius: 16),
                      ],
                    ),
                    32.height,
                    Text(e.title.validate(), style: boldTextStyle(size: 26), textAlign: TextAlign.center),
                    16.height,
                    Text(e.subTitle.validate(), style: secondaryTextStyle(height: 1.5), textAlign: TextAlign.center),
                  ],
                ).paddingOnly(top: 170);
              }).toList(),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      SignInScreen().launch(context);
                    },
                    child: Text('Skip', style: boldTextStyle()),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: appStore.isDarkModeOn ? white : gray.withOpacity(0.1)),
                    ),
                  ).paddingOnly(left: 16),
                  DotIndicator(
                    indicatorColor: appStore.isDarkModeOn ? white : Colors.black,
                    pageController: pageController,
                    pages: list,
                    currentDotSize: 45,
                    currentDotWidth: 5,
                    dotSize: 27,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    boxShape: BoxShape.rectangle,
                    currentBoxShape: BoxShape.rectangle,
                    currentBorderRadius: radius(),
                    unselectedIndicatorColor: Colors.grey.shade400,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                  ).paddingOnly(right: 16),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 32,
              child: CommonButton(
                buttonText: "Get Started",
                margin: 16,
                onTap: () {
                  SignInScreen().launch(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
