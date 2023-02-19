import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSDatePostedComponent.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSRemoteFilterComponent.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSSortByComponent.dart';
import 'package:prokit_flutter/fullApps/jobSearch/model/JSPopularCompanyModel.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSDataGenerator.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSWidget.dart';

class JSFilteredScreen extends StatefulWidget {
  const JSFilteredScreen({Key? key}) : super(key: key);

  @override
  _JSFilteredScreenState createState() => _JSFilteredScreenState();
}

class _JSFilteredScreenState extends State<JSFilteredScreen> {
  int? remoteValue = 0;

  List<JSPopularCompanyModel> remoteList = getRemoteList();

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
      appBar: jsAppBar(context, bottomSheet: false, backWidget: true, homeAction: true),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: boxDecorationWithRoundedCorners(
                  boxShadow: [
                    BoxShadow(spreadRadius: 0.8, blurRadius: 1, color: gray.withOpacity(0.8)),
                  ],
                  borderRadius: BorderRadius.circular(0),
                  backgroundColor: context.scaffoldBackgroundColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: js_primaryColor, width: 2),
                        backgroundColor: context.scaffoldBackgroundColor,
                      ),
                      child: IconButton(
                          onPressed: () {
                            finish(context);
                          },
                          icon: Icon(Icons.close)),
                    ),
                    TextButton(onPressed: () {}, child: Text("Filters", style: boldTextStyle())),
                    TextButton(
                        onPressed: () {
                          finish(context);
                        },
                        child: Text("Reset", style: boldTextStyle(color: js_primaryColor))),
                  ],
                ).paddingOnly(left: 8, right: 8, bottom: 16),
              ),
              24.height,
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Remote", style: boldTextStyle(size: 18)).paddingOnly(left: 16),
                    16.height,
                    JSRemoteFilterComponent(),
                    Divider(color: gray.withOpacity(0.4)),
                    24.height,
                    Text("sort by", style: boldTextStyle(size: 18)).paddingOnly(left: 16),
                    16.height,
                    JSSortByComponent(),
                    Divider(color: gray.withOpacity(0.4)),
                    24.height,
                    Text("Date Posted", style: boldTextStyle(size: 18)).paddingOnly(left: 16),
                    16.height,
                    JSDatePostedComponent(),
                  ],
                ),
              ).expand(),
            ],
          ).paddingOnly(bottom: 80),
          Positioned(
            left: 0,
            right: 0,
            bottom: 8,
            child: AppButton(
              onTap: () {
                finish(context);
              },
              width: context.width(),
              margin: EdgeInsets.all(16),
              color: js_primaryColor,
              child: Text("Update", style: boldTextStyle(color: white)),
            ),
          )
        ],
      ),
    );
  }
}
