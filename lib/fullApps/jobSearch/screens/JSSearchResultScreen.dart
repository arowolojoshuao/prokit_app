import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSFilteredResultsComponent.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSFilteredScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSWidget.dart';
import 'package:prokit_flutter/main.dart';

class JSSearchResultScreen extends StatefulWidget {
  final String? jobTitle;
  final String? city;

  JSSearchResultScreen({this.jobTitle, this.city});

  @override
  _JSSearchResultScreenState createState() => _JSSearchResultScreenState();
}

class _JSSearchResultScreenState extends State<JSSearchResultScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  String daysValue = 'Date Posted';

  var daysItems = ['Date Posted', 'Last 1 days', 'Last 2 days', 'Last 3 days', 'Last 4 days'];

  String jobCategoryValue = 'Job Category';

  var jobCategoryItems = ['Job Category', 'Web Designer', 'Project Manager', 'Graphics Designer', 'Team Leader'];

  String salaryValue = 'All Salaries';

  var salaryItems = ['All Salaries', '\$40,000', '\$45,000', '\$50,0000', '\$55,0000'];

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
    return Scaffold(
      key: scaffoldKey,
      appBar: jsAppBar(context, notifications: false, message: false, bottomSheet: false, backWidget: true, homeAction: true, callBack: () {
        setState(() {});
        scaffoldKey.currentState!.openDrawer();
      }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(left: 16, right: 16, top: 8),
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(spreadRadius: 3, blurRadius: 0.5, color: gray.withOpacity(0.2))],
              backgroundColor: context.scaffoldBackgroundColor,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.search, size: 18),
                    16.width,
                    Text(widget.jobTitle.validate(), style: primaryTextStyle()),
                  ],
                ),
                Divider(color: gray.withOpacity(0.5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 18),
                        16.width,
                        Text(widget.city.validate(), style: primaryTextStyle()),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.directions_car, size: 18),
                        8.width,
                        Text("25 mi", style: primaryTextStyle(size: 14)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                filteredWidget(widget: Icon(Icons.filter_list, size: 18)).cornerRadiusWithClipRRect(8).onTap(() {
                  JSFilteredScreen().launch(context);
                }),
                8.width,
                filteredWidget(widget: Text("Remote", style: primaryTextStyle(size: 14))),
                8.width,
                Container(
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.circular(8),
                    backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : js_backGroundColor,
                  ),
                  height: 35,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  child: DropdownButton(
                    isExpanded: false,
                    underline: Container(color: Colors.transparent),
                    value: daysValue,
                    icon: Icon(Icons.arrow_drop_down),
                    items: daysItems.map((String daysItems) {
                      return DropdownMenuItem(
                        value: daysItems,
                        child: Text(daysItems, style: primaryTextStyle(size: 14)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        daysValue = newValue!;
                      });
                    },
                  ),
                ),
                8.width,
                Container(
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.circular(8),
                    backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : js_backGroundColor,
                  ),
                  height: 35,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  child: DropdownButton(
                    isExpanded: false,
                    underline: Container(color: Colors.transparent),
                    value: jobCategoryValue,
                    icon: Icon(Icons.arrow_drop_down),
                    items: jobCategoryItems.map((String jobCategoryItems) {
                      return DropdownMenuItem(
                        value: jobCategoryItems,
                        child: Text(jobCategoryItems, style: primaryTextStyle(size: 14)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        jobCategoryValue = newValue!;
                      });
                    },
                  ),
                ),
                8.width,
                Container(
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.circular(8),
                    backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : js_backGroundColor,
                  ),
                  height: 35,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  child: DropdownButton(
                    isExpanded: false,
                    underline: Container(color: Colors.transparent),
                    value: salaryValue,
                    icon: Icon(Icons.arrow_drop_down),
                    items: salaryItems.map((String salaryItems) {
                      return DropdownMenuItem(
                        value: salaryItems,
                        child: Text(salaryItems, style: primaryTextStyle(size: 14)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        salaryValue = newValue!;
                      });
                    },
                  ),
                ),
                8.width,
                filteredWidget(widget: Text("Applications", style: primaryTextStyle(size: 14))),
              ],
            ),
          ),
          8.height,
          Text(
            "${widget.jobTitle.validate()} jobs in ${widget.city.validate()}, Greater ${widget.city.validate()}",
            style: primaryTextStyle(),
            textAlign: TextAlign.start,
          ).paddingOnly(left: 16),
          4.height,
          Row(
            children: [
              Text("page 1 of 545 jobs", style: secondaryTextStyle()),
              4.width,
              Icon(Icons.help, color: gray.withOpacity(0.5), size: 18),
            ],
          ).paddingOnly(left: 16),
          16.height,
          JSFilteredResultsComponent(city: widget.city.validate()).expand(),
        ],
      ),
    );
  }
}
