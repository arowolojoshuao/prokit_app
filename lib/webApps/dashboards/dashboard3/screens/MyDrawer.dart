import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/models/DrawerModel.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Colors.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Constants.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/DataProvider.dart';

class MyDrawer extends StatefulWidget {
  int selectedIndex = 0;

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int _currentSelected = 0;
  bool isHovering = false;

  List<DrawerModel> _menuDrawerList = menuDrawerList();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: context.height(),
      width: context.width() < 1200 ? context.width() * 0.5 : context.width(),
      color: secondaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('CRM', style: boldTextStyle(size: 30, color: primaryColor)).paddingAll(16),
            ).onTap(() {
              finish(context);
            }),
            ListView.builder(
              itemCount: _menuDrawerList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                DrawerModel data = _menuDrawerList[index];
                return HoverWidget(
                  builder: (context, isHover) {
                    return Container(
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: radius(cardRadius.toDouble()),
                        backgroundColor: _currentSelected == index ? primaryColor : secondaryColor,
                      ),
                      child: SettingItemWidget(
                        padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
                        onTap: () {
                          _currentSelected = index;
                          log(index.toString());
                          widget.selectedIndex = index;
                          setState(() {});
                        },
                        title: '${data.name}',
                        titleTextStyle: primaryTextStyle(
                          color: _currentSelected == index ? secondaryColor : primaryColor,
                        ),
                        leading: Icon(
                          data.icon,
                          color: _currentSelected == index ? secondaryColor : primaryColor,
                        ),
                        trailing: data.count != null
                            ? Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                decoration: boxDecorationWithRoundedCorners(
                                  borderRadius: radius(cardRadius),
                                  backgroundColor: _currentSelected == index ? secondaryColor : primaryColor,
                                ),
                                child: Text(
                                  data.count.toString(),
                                  style: boldTextStyle(color: _currentSelected == index ? primaryColor : white),
                                ),
                              )
                            : Offstage(),
                      ),
                    );
                  },
                );
              },
            ),
            Container(
              height: context.height() * 0.38,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: context.height() * 0.35,
                    width: context.width(),
                    padding: EdgeInsets.all(8),
                    decoration: boxDecorationRoundedWithShadow(
                      8,
                      gradient: LinearGradient(
                        colors: [Color(0xFF1E2983), Color(0xFF0F1537)],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        8.height,
                        Column(
                          children: [
                            Text(
                              'Become a pro to get more features',
                              style: primaryTextStyle(color: white),
                              textAlign: TextAlign.center,
                            ),
                            16.height,
                            AppButton(
                              shapeBorder: RoundedRectangleBorder(
                                borderRadius: radius(cardRadius.toDouble()),
                              ),
                              padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                              text: 'Upgrade Now',
                              textStyle: boldTextStyle(size: 16),
                              textColor: primaryColor,
                              color: white,
                              onTap: () {
                                toasty(context, "Can't upgrade");
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    child: Image.asset(
                      'images/webDashBoard3/robo.png',
                      height: context.height() * 0.25,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
