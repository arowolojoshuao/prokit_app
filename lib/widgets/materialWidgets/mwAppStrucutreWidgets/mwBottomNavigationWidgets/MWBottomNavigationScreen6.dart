import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/model/SampleListModel.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWBottomNavigationScreen6 extends StatefulWidget {
  const MWBottomNavigationScreen6({Key? key}) : super(key: key);

  @override
  _MWBottomNavigationScreen6State createState() => _MWBottomNavigationScreen6State();
}

class _MWBottomNavigationScreen6State extends State<MWBottomNavigationScreen6> {
  List<SampleListModel> SampleData = [];

  int selectedIndex = 0;

  @override
  void initState() {
    SampleData.add(
      SampleListModel(
        title: "Home",
        launchWidget: Text("Home View", style: boldTextStyle(size: 24)),
        icon: Icons.home,
        alternateIcon: Icons.home_outlined,
        colors: Colors.blue,
      ),
    );
    SampleData.add(
      SampleListModel(
        title: "Search",
        launchWidget: Text("Search View", style: boldTextStyle(size: 24)),
        icon: Icons.search,
        alternateIcon: Icons.search,
        colors: Colors.orange,
      ),
    );
    SampleData.add(
      SampleListModel(
        title: "Favorite",
        launchWidget: Text("Favorite View", style: boldTextStyle(size: 24)),
        icon: Icons.favorite,
        alternateIcon: Icons.favorite_outline,
        colors: Colors.red,
      ),
    );
    SampleData.add(
      SampleListModel(
        title: "Profile",
        launchWidget: Text("Profile View", style: boldTextStyle(size: 24)),
        icon: Icons.account_circle,
        alternateIcon: Icons.account_circle_outlined,
        colors: Colors.purple,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, ''),
      body: SampleData[selectedIndex].launchWidget.center(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.primaryColor,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          toast("Hurray");
          setState(() {});
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.hardEdge,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              ...List.generate(
                SampleData.length,
                (index) {
                  SampleListModel data = SampleData[index];
                  return Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        selectedIndex == index ? Icon(data.icon, size: 24, color: data.colors) : Icon(data.alternateIcon, size: 24, color: Colors.blueGrey[300]),
                        Text(selectedIndex == index ? data.title.validate() : "", style: boldTextStyle(color: data.colors, size: 14)),
                      ],
                    ),
                  ).onTap(() {
                    selectedIndex = index;
                    setState(() {});
                  }).expand();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
