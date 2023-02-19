import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/home/components/SVForumRepliesComponent.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/home/components/SVForumTopicComponent.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVColors.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVCommon.dart';

class SVForumScreen extends StatefulWidget {
  const SVForumScreen({Key? key}) : super(key: key);

  @override
  State<SVForumScreen> createState() => _SVForumScreenState();
}

class _SVForumScreenState extends State<SVForumScreen> {
  List<String> tabList = ['Topics', 'Replies', 'Engagement', 'Favourite'];

  int selectedTab = 0;

  @override
  void initState() {
    super.initState();
  }

  Widget getTabContainer() {
    if (selectedTab == 0) {
      return SVForumTopicComponent(isFavTab: false);
    } else if (selectedTab == 1) {
      return SVForumRepliesComponent();
    } else if (selectedTab == 2) {
      return Offstage();
    } else
      return SVForumTopicComponent(isFavTab: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: svGetScaffoldColor(),
      appBar: AppBar(
        backgroundColor: svGetScaffoldColor(),
        iconTheme: IconThemeData(color: context.iconColor),
        title: Text('Forum', style: boldTextStyle(size: 20)),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(color: context.cardColor, borderRadius: radius(8)),
              child: AppTextField(
                textFieldType: TextFieldType.NAME,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search Here',
                  hintStyle: secondaryTextStyle(color: svGetBodyColor()),
                  prefixIcon: Image.asset('images/socialv/icons/ic_Search.png', height: 16, width: 16, fit: BoxFit.cover, color: svGetBodyColor()).paddingAll(16),
                ),
              ),
            ),
            HorizontalList(
              spacing: 0,
              padding: EdgeInsets.all(16),
              itemCount: tabList.length,
              itemBuilder: (context, index) {
                return AppButton(
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(8)),
                  text: tabList[index],
                  textStyle: boldTextStyle(color: selectedTab == index ? Colors.white : svGetBodyColor(), size: 14),
                  onTap: () {
                    selectedTab = index;
                    setState(() {});
                  },
                  elevation: 0,
                  color: selectedTab == index ? SVAppColorPrimary : svGetScaffoldColor(),
                );
              },
            ),
            getTabContainer(),
          ],
        ),
      ),
    );
  }
}
