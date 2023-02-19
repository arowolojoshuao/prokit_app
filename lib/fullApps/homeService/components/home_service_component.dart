import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prokit_flutter/fullApps/homeService/custom_widget/space.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/homeService/models/services_model.dart';
import 'package:prokit_flutter/fullApps/homeService/screens/service_providers_screen.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/colors.dart';

class HomeServiceComponent extends StatefulWidget {
  @override
  State<HomeServiceComponent> createState() => _HomeServiceComponentState();
}

class _HomeServiceComponentState extends State<HomeServiceComponent> {
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
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        children: List.generate(
          serviceProviders.length,
          (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ServiceProvidersScreen(index: index)),
              );
              for (var i = 0; i < serviceProviders.length; i++) {
                if (i == index) {
                  serviceProviders[i].isSelected = true;
                } else {
                  serviceProviders[i].isSelected = false;
                }
                setState(() {});
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      color: serviceProviders[index].isSelected ? blackColor : textFieldColor,
                      child: Observer(
                        builder: (context) {
                          return Icon(
                            serviceProviders[index].serviceIcon,
                            size: 28,
                            color: appStore.isDarkModeOn
                                ? Colors.white
                                : serviceProviders[index].isSelected
                                    ? whiteColor
                                    : blackColor,
                          );
                        },
                      ),
                    ),
                  ),
                  Space(8),
                  FittedBox(child: Text(serviceProviders[index].subName)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
