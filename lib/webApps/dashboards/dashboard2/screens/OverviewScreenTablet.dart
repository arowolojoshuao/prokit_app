import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/component/CategoryList.Dart.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/component/MentorDataTablet.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/model/DashBoard2DataModel.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/utils/CommanVariables.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/utils/DashBoard2DataProvider.dart';

class OverviewScreenTablet extends StatefulWidget {
  @override
  OverviewScreenTabletState createState() => OverviewScreenTabletState();
}

class OverviewScreenTabletState extends State<OverviewScreenTablet> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<Offset> _offsetAnimationHorizontal = Tween<Offset>(
    begin: const Offset(1.0, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.decelerate));

  late final Animation<Offset> _offsetAnimationVertical = Tween<Offset>(
    begin: const Offset(0, -1),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.decelerate));

  late final Animation<double> _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

  final List<DashBoard2DataModel> _categoryList = categoryList();
  final List<DashBoard2DataModel> _mentorList = mentorList();
  final List<DashBoard2DataModel> _courseInProgressList = courseInProgressList();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    if (getBoolAsync(animatedContainer) == false) {
      _controller = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this,
      )..forward();
      setValue(animatedContainer, true);
      setState(() {});
    } else {
      _controller = AnimationController(
        duration: const Duration(seconds: 0),
        vsync: this,
      )..forward();
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Course in Progress', style: boldTextStyle(size: 16)),
                    TextButton(
                        child: Text('View All', style: boldTextStyle(size: 16)),
                        onPressed: () {
                          //
                        }),
                  ],
                ),
                16.height,
                FadeTransition(
                  opacity: _animation,
                  child: SlideTransition(
                    position: _offsetAnimationVertical,
                    child: Wrap(runSpacing: 16, spacing: 16),
                  ),
                ),
              ],
            ),
          ),
          8.height,
          Container(
            height: context.width() * 0.4,
            padding: const EdgeInsets.all(16),
            width: context.width(),
            decoration: boxDecorationRoundedWithShadow(8, backgroundColor: const Color(0xFFFEEFD2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                8.height,
                Column(
                  children: [
                    Text(
                      'You have 5 days left on your subscription',
                      style: primaryTextStyle(),
                      textAlign: TextAlign.center,
                    ),
                    8.height,
                    AppButton(
                      padding: const EdgeInsets.all(16),
                      text: 'Upgrade to Pro',
                      textStyle: boldTextStyle(size: 16),
                      color: const Color(0xFFF9B313),
                      onTap: () {
                        toasty(context, "Can't upgrade");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          12.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  width: context.width() * 0.35,
                  decoration: boxDecorationRoundedWithShadow(8, backgroundColor: const Color(0xFFDBEBDE)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      4.height,
                      Text('Popular Categories', style: boldTextStyle(size: 16)),
                      8.height,
                      SizedBox(
                        height: context.height() * 0.4,
                        child: FadeTransition(
                          opacity: _animation,
                          child: SlideTransition(
                            position: _offsetAnimationVertical,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _categoryList.length,
                              itemBuilder: (context, index) {
                                DashBoard2DataModel data = _categoryList[index];
                                return CategoryData(data: data);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                16.width,
                Container(
                  padding: const EdgeInsets.all(8),
                  width: context.width() * 0.5,
                  decoration: boxDecorationRoundedWithShadow(8, backgroundColor: const Color(0xFFE4F6FA)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Top Mentors', style: boldTextStyle(size: 16)),
                          TextButton(
                            child: Text('View All', style: boldTextStyle(size: 16)),
                            onPressed: () {
                              //
                            },
                          ),
                        ],
                      ),
                      4.height,
                      SizedBox(
                        height: context.height() * 0.4,
                        child: FadeTransition(
                          opacity: _animation,
                          child: SlideTransition(
                            position: _offsetAnimationVertical,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _mentorList.length,
                              itemBuilder: (context, index) {
                                DashBoard2DataModel data = _mentorList[index];
                                return MentorDataTablet(data: data);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ).expand(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
