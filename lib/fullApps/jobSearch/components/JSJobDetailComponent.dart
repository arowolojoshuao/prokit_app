import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/model/JSPopularCompanyModel.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSWidget.dart';
import 'package:prokit_flutter/main.dart';

class JSJobDetailComponent extends StatefulWidget {
  final JSPopularCompanyModel? filteredResultsList;

  JSJobDetailComponent({this.filteredResultsList});

  @override
  _JSJobDetailComponentState createState() => _JSJobDetailComponentState();
}

class _JSJobDetailComponentState extends State<JSJobDetailComponent> {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 30,
                  height: 5,
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.circular(4),
                    backgroundColor: appStore.isDarkModeOn ? white : black,
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 16, left: 24),
                ),
              ).expand(),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    finish(context);
                  },
                  padding: EdgeInsets.all(16),
                  icon: Icon(Icons.file_upload_outlined, size: 26),
                  alignment: Alignment.topRight,
                ),
              ),
            ],
          ),
          32.height,
          Text(widget.filteredResultsList!.companyName.validate(), style: boldTextStyle(size: 22)),
          8.height,
          Text(widget.filteredResultsList!.totalReview.validate(), style: primaryTextStyle()),
          8.height,
          Text('London . Remote', style: primaryTextStyle()),
          8.height,
          Container(
              padding: EdgeInsets.all(8),
              decoration: boxDecorationWithRoundedCorners(
                backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : js_backGroundColor,
              ),
              child: Text('Urgently needed', style: primaryTextStyle())),
          24.height,
          Text("Job details", style: boldTextStyle(size: 20)),
          16.height,
          Text("Salary", style: boldTextStyle()),
          4.height,
          Text(widget.filteredResultsList!.companyImage.validate(), style: primaryTextStyle()),
          16.height,
          Text("Job type", style: boldTextStyle()),
          4.height,
          jsGetPrimaryTitle("Full-time"),
          4.height,
          jsGetPrimaryTitle("Permanent"),
          4.height,
          jsGetPrimaryTitle("Fixed term"),
          4.height,
          jsGetPrimaryTitle("Remote"),
          16.height,
          Text("Number of position for this role", style: boldTextStyle()),
          8.height,
          Text("3", style: secondaryTextStyle()),
          Divider(),
          16.height,
          Text("Full Job Description", style: boldTextStyle(size: 20)),
          16.height,
          Text("Skills:", style: primaryTextStyle()),
          24.height,
          UL(
            children: [
              Text("Experience of working on a UX Designer, UI Designer or other relevant position.", style: primaryTextStyle()),
              //16.height,
              Text("Experience in working with sketch and find job.", style: primaryTextStyle())
            ],
          ),
        ],
      ).paddingOnly(left: 16, right: 16, bottom: 80),
    );
  }
}
