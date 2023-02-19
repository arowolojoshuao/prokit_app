import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/homeService/custom_widget/space.dart';
import 'package:prokit_flutter/fullApps/homeService/models/home_construction_model.dart';
import 'package:prokit_flutter/fullApps/homeService/screens/service_providers_screen.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/colors.dart';

class HomeConstructionComponent extends StatefulWidget {
  @override
  _HomeConstructionComponentState createState() => _HomeConstructionComponentState();
}

class _HomeConstructionComponentState extends State<HomeConstructionComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        children: List.generate(
          homeConstruction.length,
          (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ServiceProvidersScreen(index: index)),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(right: 8, left: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      color: textFieldColor,
                      child: homeConstruction[index].iconPath,
                    ),
                  ),
                  Space(8),
                  FittedBox(child: Text(homeConstruction[index].title)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
