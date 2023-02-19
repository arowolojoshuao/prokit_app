import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/model/Dashboard1Model.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/utils/Colors.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard1/utils/DashBoard1DataProvider.dart';

class DrawerComponentWidget extends StatefulWidget {
  @override
  _DrawerComponentWidgetState createState() => _DrawerComponentWidgetState();

  const DrawerComponentWidget({Key? key}) : super(key: key);
}

class _DrawerComponentWidgetState extends State<DrawerComponentWidget> {
  List<DashBoard1Model> drawerList = getSideDrawerList();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: DScaffoldColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                child: Image.asset('images/webDashboard1/logo.png'),
              ).onTap(() {
                finish(context);
              }),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: drawerList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  DashBoard1Model data = drawerList[index];
                  selectedIndex = index;

                  return HoverWidget(
                    builder: (BuildContext context, bool isHovering) {
                      return SettingItemWidget(
                        decoration: BoxDecoration(color: isHovering ? Colors.white54 : null),
                        leading: SvgPicture.asset(
                          data.img.validate(),
                          fit: BoxFit.cover,
                          height: 30,
                          width: 30,
                          color: isHovering ? black : grey,
                        ),
                        title: data.title.validate(),
                        titleTextStyle: boldTextStyle(color: Colors.white54),
                        onTap: () {
                          setState(
                            () {
                              selectedIndex = index;
                              setState(() {});
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
