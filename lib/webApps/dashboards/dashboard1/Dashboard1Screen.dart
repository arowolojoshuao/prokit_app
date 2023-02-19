import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/component/DashBoardComponentWidget.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/component/DrawerComponentWidget.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/model/Dashboard1Model.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/utils/Colors.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/utils/Constants.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/utils/DashBoard1DataProvider.dart';

class Dashboard1Screen extends StatefulWidget {
  const Dashboard1Screen({Key? key}) : super(key: key);

  @override
  _Dashboard1ScreenState createState() => _Dashboard1ScreenState();
}

class _Dashboard1ScreenState extends State<Dashboard1Screen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<DashBoard1Model> drawerList = getSideDrawerList();
  int selectedIndex = 0;

  Widget appBarWidget() {
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(Icons.menu, color: white).onTap(
            () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          16.width,
          TextField(
            decoration: InputDecoration(
              hintText: "Search",
              fillColor: secondaryColor,
              hintStyle: primaryTextStyle(color: grey),
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              suffixIcon: InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(defaultPadding * 0.75),
                  margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                  decoration: BoxDecoration(
                    color: WDPrimaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SvgPicture.asset("images/webDashboard1/search.svg"),
                ),
              ),
            ),
          ).expand(),
          16.width,
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding / 2,
            ),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.white10),
            ),
            child: TextIcon(
              prefix: Image.asset('images/webDashboard1/profile_pic.png', height: 20, width: 20),
              text: 'Angelina  joilie',
              textStyle: boldTextStyle(color: white),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DScaffoldColor,
        key: _scaffoldKey,
        drawer: context.isDesktop() ? null : DrawerComponentWidget(),
        body: Responsive(
          mobile: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBarWidget(),
                DashBoardComponentWidget(),
              ],
            ),
          ),
          web: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerComponentWidget().expand(),
                DashBoardComponentWidget().expand(flex: 5),
              ],
            ),
          ),
          tablet: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBarWidget(),
                DashBoardComponentWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
