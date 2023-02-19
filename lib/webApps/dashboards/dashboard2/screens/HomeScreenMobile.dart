import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/component/Drawer.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/screens/ComingSoonScreen.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/screens/OverViewScreenMobile.dart';

class HomeScreenMobile extends StatefulWidget {
  @override
  HomeScreenMobileState createState() => HomeScreenMobileState();
}

class HomeScreenMobileState extends State<HomeScreenMobile> {
  List<Widget> data = [
    OverviewScreenMobile(),
    const ComingSoon(),
    const ComingSoon(),
    const ComingSoon(),
    const ComingSoon(),
    const ComingSoon(),
    const ComingSoon(),
    const ComingSoon(),
  ];

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

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
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: Drawer(
        elevation: 0,
        child: drawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Entypo.list),
                      iconSize: 20,
                      onPressed: () {
                        _drawerKey.currentState!.openDrawer();
                      },
                    ),
                    SizedBox(
                      width: context.width() * 0.5,
                      child: AppTextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16),
                          filled: true,
                          hintText: 'Search here',
                          hintStyle: secondaryTextStyle(size: 16),
                          prefixIcon: const Icon(Icons.search, color: black),
                          border: OutlineInputBorder(borderRadius: radius(30), borderSide: BorderSide.none),
                          // fillColor: Color(0xFFF6EDDD),
                          fillColor: const Color(0xFFFAF9F5),
                        ),
                        onTap: () {},
                        textFieldType: TextFieldType.OTHER,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(icon: const Icon(FontAwesome.bell_o), iconSize: 16, onPressed: () {}),
                    4.width,
                    Image.asset('images/webDashboard2/mentor_1.jpg', fit: BoxFit.cover, height: 40, width: 40).cornerRadiusWithClipRRect(40),
                    8.width,
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: data[drawer().selectedIndex],
            ),
            // OverviewScreen(),
          ],
        ),
      ),
    );
  }
}
