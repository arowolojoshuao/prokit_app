import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/component/NBAllNewsComponent.dart';
import 'package:prokit_flutter/fullApps/newsBlog/component/NBNewsComponent.dart';
import 'package:prokit_flutter/fullApps/newsBlog/model/NBModel.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBProfileScreen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBColors.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBDataProviders.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBImages.dart';
import 'package:prokit_flutter/main.dart';

class NBHomeScreen extends StatefulWidget {
  static String tag = '/NBHomeScreen';

  @override
  NBHomeScreenState createState() => NBHomeScreenState();
}

class NBHomeScreenState extends State<NBHomeScreen> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<NBDrawerItemModel> mDrawerList = nbGetDrawerItems();

  List<NBNewsDetailsModel> mNewsList = nbGetNewsDetails();
  List<NBNewsDetailsModel> mTechNewsList = [], mFashionNewsList = [], mSportsNewsList = [], mScienceNewsList = [];

  TabController? tabController;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    tabController = TabController(length: 5, vsync: this);
    mNewsList.forEach((element) {
      if (element.categoryName == 'Technology') {
        mTechNewsList.add(element);
      } else if (element.categoryName == 'Fashion') {
        mFashionNewsList.add(element);
      } else if (element.categoryName == 'Sports') {
        mSportsNewsList.add(element);
      } else if (element.categoryName == 'Science') {
        mScienceNewsList.add(element);
      }
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: appStore.isDarkModeOn ? white : black),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: Text('News Blog', style: boldTextStyle(size: 20)),
        backgroundColor: context.cardColor,
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(text: 'All News'),
            Tab(text: 'Technology'),
            Tab(text: 'Fashion'),
            Tab(text: 'Sports'),
            Tab(text: 'Science'),
          ],
          labelStyle: boldTextStyle(),
          labelColor: appStore.isDarkModeOn ? white : black,
          unselectedLabelStyle: primaryTextStyle(),
          unselectedLabelColor: grey,
          isScrollable: true,
          indicatorColor: NBPrimaryColor,
          indicatorWeight: 3,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      drawer: Drawer(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              child: DrawerHeader(
                margin: EdgeInsets.all(0),
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 0),
                  leading: CircleAvatar(backgroundImage: AssetImage(NBProfileImage), radius: 30),
                  title: Text('Robert Fox', style: boldTextStyle()),
                  subtitle: Text('View Profile', style: secondaryTextStyle()),
                  onTap: () {
                    NBProfileScreen().launch(context);
                  },
                ),
              ),
            ),
            ListView.separated(
              padding: EdgeInsets.all(8),
              separatorBuilder: (_, index) {
                return Divider();
              },
              itemCount: mDrawerList.length,
              itemBuilder: (_, index) {
                return Text('${mDrawerList[index].title}', style: boldTextStyle()).onTap(
                  () {
                    if (index == 0) {
                      finish(context);
                    } else {
                      mDrawerList[index].widget.launch(context);
                    }
                  },
                ).paddingAll(8);
              },
            ).expand()
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          NBAllNewsComponent(),
          NBNewsComponent(list: mTechNewsList),
          NBNewsComponent(list: mFashionNewsList),
          NBNewsComponent(list: mSportsNewsList),
          NBNewsComponent(list: mScienceNewsList),
        ],
      ),
    );
  }
}
