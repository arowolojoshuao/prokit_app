import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/coinPro/components/CPIdCardScreen.dart';
import 'package:prokit_flutter/fullApps/coinPro/components/CPVerifyEmail.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPColors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CPWalkThroughScreen extends StatefulWidget {
  @override
  State<CPWalkThroughScreen> createState() => _CPWalkThroughScreenState();
}

class _CPWalkThroughScreenState extends State<CPWalkThroughScreen> with AfterLayoutMixin<CPWalkThroughScreen> {
  final pageController = PageController();
  List<Widget> pages = [];
  double? currentPage = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    pageController.addListener(
      () {
        setState(() {
          currentPage = pageController.page;
        });
      },
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    pages = [
      CPVerifyEmail(),
      CPIdCardScreen(),
    ];
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(controller: pageController, children: pages.map((e) => e).toList()),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 2,
                axisDirection: Axis.horizontal,
                effect: ExpandingDotsEffect(
                  dotColor: Color(0xff9e9e9e),
                  activeDotColor: CPPrimaryColor,
                  dotHeight: 3,
                  dotWidth: 16,
                  radius: 16,
                  spacing: 8,
                  expansionFactor: 3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
