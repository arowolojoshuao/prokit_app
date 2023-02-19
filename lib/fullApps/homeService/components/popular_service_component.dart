import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/homeService/screens/service_providers_screen.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/images.dart';

class PopularServiceComponent extends StatefulWidget {
  @override
  _PopularServiceComponentState createState() => _PopularServiceComponentState();
}

class _PopularServiceComponentState extends State<PopularServiceComponent> {
  List<String> servicesList = [plumber, electrician, painter1, carpenter];

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
      height: 125,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        children: List.generate(
          servicesList.length,
          (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ServiceProvidersScreen(index: index)),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: 110,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(servicesList[index], fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
