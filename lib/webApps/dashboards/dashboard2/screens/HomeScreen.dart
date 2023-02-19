import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/component/Drawer.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/screens/ComingSoonScreen.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard2/screens/OverviewScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Widget> data = [
    const OverviewScreen(),
    const ComingSoon(),
    const ComingSoon(),
    const ComingSoon(),
    const ComingSoon(),
    const ComingSoon(),
    const ComingSoon(),
    const ComingSoon(),
  ];

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
      body: Row(
        children: [
          Drawer(
            elevation: 0,
            child: drawer(),
          ).expand(flex: 1),
          Container(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 60,
                        width: context.width() * 0.6,
                        child: AppTextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(16),
                            filled: true,
                            hintText: 'Search here',
                            hintStyle: secondaryTextStyle(size: 16),
                            prefixIcon: const Icon(Icons.search, color: black),
                            border: OutlineInputBorder(borderRadius: radius(30), borderSide: BorderSide.none),
                            // fillColor: Color(0xFFF6EDDD),
                            fillColor: const Color(0xFFFBF8F1),
                          ),
                          onTap: () {},
                          textFieldType: TextFieldType.OTHER,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(FontAwesome.bell_o, size: 16),
                            onPressed: () {},
                          ),
                          4.width,
                          Image.asset('images/webDashboard2/mentor_1.jpg', fit: BoxFit.cover, height: 40, width: 40).cornerRadiusWithClipRRect(40)
                        ],
                      )
                    ],
                  ),
                  data[drawer().selectedIndex],
                ],
              ),
            ),
          ).expand(flex: 5),
        ],
      ),
    );
  }
}
