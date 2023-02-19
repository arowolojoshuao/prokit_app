import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/utils/Colors.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/utils/Constants.dart';

class AppBarComponent extends StatefulWidget {
  const AppBarComponent({Key? key}) : super(key: key);
  static const String routeName = '/home';

  @override
  _AppBarComponentState createState() => _AppBarComponentState();
}

class _AppBarComponentState extends State<AppBarComponent> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Container(
        child: Row(
          children: [
            Icon(Icons.menu, color: white).onTap(() {
              setState(() {});
            }),
            16.width,
            TextField(
              style: boldTextStyle(color: Colors.white),
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
      ),
      web: Container(
        child: Row(
          children: [
            Text("Dashboard", style: boldTextStyle(color: white)).expand(),
            TextField(
              style: boldTextStyle(color: Colors.white),
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
            ProfileCard(),
          ],
        ),
      ),
      tablet: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, color: white).onTap(() {}),
            16.width,
            TextField(
              style: boldTextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search",
                fillColor: secondaryColor,
                hintStyle: primaryTextStyle(color: white),
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
                text: 'Angelina joilie',
                textStyle: boldTextStyle(color: white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Container(
        margin: EdgeInsets.only(left: defaultPadding),
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: defaultPadding / 2,
        ),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white10),
        ),
        child: Row(
          children: [
            Image.asset("images/webDashboard1/profile_pic.png", height: 38),
            Text("Angelina Jolie", style: boldTextStyle(color: white)).paddingSymmetric(horizontal: 8),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
      tablet: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white10),
        ),
        child: Row(
          children: [
            Image.asset("images/webDashboard1/profile_pic.png", height: 38),
            Text("Angelina Jolie", style: boldTextStyle(color: white)).paddingSymmetric(horizontal: 8),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
      web: Container(
        margin: EdgeInsets.only(left: defaultPadding),
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: defaultPadding / 2,
        ),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white10),
        ),
        child: Row(
          children: [
            Image.asset("images/webDashboard1/profile_pic.png", height: 38),
            Text("Angelina Jolie", style: boldTextStyle(color: white)).paddingSymmetric(horizontal: 8),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}
