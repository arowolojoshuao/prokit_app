import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/model/SampleListModel.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWBottomNavigationScreen7 extends StatefulWidget {
  const MWBottomNavigationScreen7({Key? key}) : super(key: key);

  @override
  _MWBottomNavigationScreen7State createState() => _MWBottomNavigationScreen7State();
}

class _MWBottomNavigationScreen7State extends State<MWBottomNavigationScreen7> {
  List<SampleListModel> sampleData = [];

  int selectedIndex = 0;

  @override
  void initState() {
    sampleData.add(
      SampleListModel(
        title: "Home",
        launchWidget: Text("Home View", style: boldTextStyle(size: 24)),
        icon: Icons.home,
        colors: Colors.blue,
      ),
    );
    sampleData.add(
      SampleListModel(
        title: "Search",
        launchWidget: Text("Search View", style: boldTextStyle(size: 24)),
        icon: Icons.search,
        colors: Colors.orange,
      ),
    );
    sampleData.add(
      SampleListModel(
        title: "Gallery",
        launchWidget: Text("Gallery View", style: boldTextStyle(size: 24)),
        icon: Icons.add_box,
        colors: Colors.red,
      ),
    );
    sampleData.add(
      SampleListModel(
        title: "Favorite",
        launchWidget: Text("Favorite View", style: boldTextStyle(size: 24)),
        icon: Icons.favorite,
        colors: Colors.red,
      ),
    );
    sampleData.add(
      SampleListModel(
        title: "Profile",
        launchWidget: Text("Profile View", style: boldTextStyle(size: 24)),
        icon: Icons.account_circle,
        colors: Colors.purple,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, ''),
      body: sampleData[selectedIndex].launchWidget.center(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: boxDecorationDefault(borderRadius: radius(0), color: context.cardColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            sampleData.length,
            (i) {
              SampleListModel data = sampleData[i];
              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                height: 40,
                decoration: BoxDecoration(
                  color: i == selectedIndex ? data.colors!.withAlpha(100) : context.cardColor,
                  borderRadius: radius(20),
                ),
                child: i == selectedIndex
                    ? Text(data.title.validate(), style: primaryTextStyle(color: Colors.blue, size: 16)).center()
                    : Icon(data.icon, size: 30).onTap(
                        () {
                          selectedIndex = i;
                          setState(() {});
                        },
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
