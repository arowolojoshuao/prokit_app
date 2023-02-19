import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSDrawerScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSFilteredResultsComponent.dart';
import 'package:prokit_flutter/fullApps/jobSearch/model/JSPopularCompanyModel.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSCompanyProfileScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSQuestionsScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSReviewsScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSImage.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSWidget.dart';
import 'package:prokit_flutter/main.dart';

class JSCompanyProfileScreens extends StatefulWidget {
  final JSPopularCompanyModel? popularCompanyList;
  final int? tabIndex;

  JSCompanyProfileScreens({this.popularCompanyList, this.tabIndex});

  @override
  _JSCompanyProfileScreensState createState() => _JSCompanyProfileScreensState();
}

class _JSCompanyProfileScreensState extends State<JSCompanyProfileScreens> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  TabController? controller;

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
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        key: scaffoldKey,
        drawer: JSDrawerScreen(),
        appBar: jsAppBar(context, notifications: true, message: true, bottomSheet: true, backWidget: true, homeAction: true, callBack: () {
          setState(() {});
          scaffoldKey.currentState!.openDrawer();
        }),
        body: Column(
          children: [
            Container(
              color: js_primaryColor,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      commonCachedNetworkImage(widget.popularCompanyList!.companyImage.validate(), height: 50, width: 50, fit: BoxFit.cover),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.popularCompanyList!.companyName.validate(), style: boldTextStyle(color: white)),
                          8.height,
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text("${widget.popularCompanyList!.companyRatting.validate()}", style: boldTextStyle(color: white)),
                                  8.width,
                                  commonCachedNetworkImage(js_smile, height: 20, width: 20, fit: BoxFit.cover),
                                ],
                              ),
                              8.width,
                              Container(height: 15, width: 1, color: white.withOpacity(0.5)),
                              8.width,
                              Row(
                                children: [
                                  Text("${widget.popularCompanyList!.companyRatting.validate()}", style: boldTextStyle(color: white)),
                                  8.width,
                                  Icon(Icons.star, color: white, size: 16),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  16.height,
                  AppButton(
                    color: white,
                    width: context.width(),
                    onTap: () {
                      //JSCompleteProfileTwoScreen().launch(context);
                    },
                    child: Text("Follow", style: boldTextStyle(color: js_primaryColor)),
                  ),
                  8.height,
                  Text("Get weekly updates, new jobs and review", style: primaryTextStyle(color: white)),
                ],
              ),
            ),
            16.height,
            TabBar(
              labelColor: appStore.isDarkModeOn ? white : black,
              unselectedLabelColor: gray,
              isScrollable: true,
              indicatorColor: js_primaryColor,
              tabs: [
                Tab(
                  child: Text("Profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
                Tab(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("8.6 k", style: secondaryTextStyle()),
                      Text("Reviews", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("6.4 k", style: secondaryTextStyle()),
                      Text("Salaries", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("300", style: secondaryTextStyle()),
                      Text("Jobs", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("500", style: secondaryTextStyle()),
                      Text("Question?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
                Tab(child: Text("Interviews", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                Tab(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("30", style: secondaryTextStyle()),
                      Text("Photos", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
              ],
              controller: controller,
            ),
            TabBarView(children: [
              JSCompanyProfileScreen(popularCompanyList: widget.popularCompanyList),
              JSReviewsScreen(popularCompanyList: widget.popularCompanyList),
              JSFilteredResultsComponent(),
              JSFilteredResultsComponent(),
              JSQuestionsScreen(popularCompanyList: widget.popularCompanyList),
              JSFilteredResultsComponent(),
              JSFilteredResultsComponent(),
            ]).expand(),
          ],
        ),
      ),
    );
  }
}
