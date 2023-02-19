import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/model/JSPopularCompanyModel.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/main.dart';

class JSCompanyProfileScreen extends StatefulWidget {
  final JSPopularCompanyModel? popularCompanyList;

  JSCompanyProfileScreen({this.popularCompanyList});

  @override
  _JSCompanyProfileScreenState createState() => _JSCompanyProfileScreenState();
}

class _JSCompanyProfileScreenState extends State<JSCompanyProfileScreen> {
  String jobTitleValue = 'MBA';
  String locationValue = 'Delhi 80 reviews';
  String languageValue = 'Any';

  var jobTitleItems = ['Software Engineer', 'MBA', 'Marketing Manager', 'ENGINEERING', 'Data Entry', 'Sales Manager'];

  var locationItems = ['Mumbai 12 reviews', 'Surat 30 reviews', 'Delhi 80 reviews', 'Chennai1 10 reviews', 'Bangalore 12 reviews', 'Pune 60 reviews'];

  var languageItems = ['Any', 'English', 'Hindi'];

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.height,
          Text(
            "${widget.popularCompanyList!.companyName.validate()} Employee Reviews",
            style: boldTextStyle(size: 22),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ).paddingOnly(left: 16),
          16.height,
          Container(
            padding: EdgeInsets.all(16),
            width: context.width(),
            height: context.height(),
            color: appStore.isDarkModeOn ? scaffoldDarkColor : js_backGroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Job Title", style: boldTextStyle()),
                8.height,
                Container(
                  decoration: boxDecorationWithRoundedCorners(
                    border: Border.all(color: gray.withOpacity(0.4)),
                    backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: DropdownButton(
                    isExpanded: true,
                    underline: Container(color: Colors.transparent),
                    value: jobTitleValue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: jobTitleItems.map((String jobTitleItems) {
                      return DropdownMenuItem(
                        value: jobTitleItems,
                        child: Text(jobTitleItems),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        jobTitleValue = newValue!;
                      });
                    },
                  ),
                ),
                16.height,
                Text("Location", style: boldTextStyle()),
                8.height,
                Container(
                  decoration: boxDecorationWithRoundedCorners(
                    border: Border.all(color: gray.withOpacity(0.4)),
                    backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: DropdownButton(
                    isExpanded: true,
                    underline: Container(color: Colors.transparent),
                    value: locationValue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: locationItems.map((String locationItems) {
                      return DropdownMenuItem(
                        value: locationItems,
                        child: Text(locationItems),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        locationValue = newValue!;
                      });
                    },
                  ),
                ),
                16.height,
                Text("Language", style: boldTextStyle()),
                8.height,
                Container(
                  decoration: boxDecorationWithRoundedCorners(
                    border: Border.all(color: gray.withOpacity(0.4)),
                    backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: DropdownButton(
                    isExpanded: true,
                    underline: Container(color: Colors.transparent),
                    value: languageValue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: languageItems.map((String languageItems) {
                      return DropdownMenuItem(
                        value: languageItems,
                        child: Text(languageItems),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        languageValue = newValue!;
                      });
                    },
                  ),
                ),
                16.height,
                Text("Ratings breakdown", style: boldTextStyle()),
                8.height,
                Row(
                  children: [
                    Text("${widget.popularCompanyList!.companyRatting.validate()}", style: boldTextStyle(color: js_ratingBgColor)),
                    8.width,
                    Icon(Icons.star, color: js_ratingBgColor, size: 16),
                    8.width,
                    Container(
                      width: context.width(),
                      height: 5,
                      decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(8), backgroundColor: js_ratingBgColor),
                    ).expand(),
                    8.width,
                    Text("1.7 k", style: secondaryTextStyle())
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
