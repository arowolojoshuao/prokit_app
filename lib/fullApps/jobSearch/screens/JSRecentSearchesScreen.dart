import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSSettingComponent.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';

class JSRecentSearchesScreen extends StatefulWidget {
  const JSRecentSearchesScreen({Key? key}) : super(key: key);

  @override
  _JSRecentSearchesScreenState createState() => _JSRecentSearchesScreenState();
}

class _JSRecentSearchesScreenState extends State<JSRecentSearchesScreen> {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent searches", style: boldTextStyle(size: 18)),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(side: BorderSide(width: 1.0, color: js_primaryColor)),
                    child: Text("Edit", style: boldTextStyle(color: js_primaryColor)),
                  )
                ],
              ),
              8.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ux designer", style: boldTextStyle()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("1,152 new in London,Greater", style: secondaryTextStyle()),
                      Icon(Icons.arrow_forward_ios, size: 18),
                    ],
                  ),
                ],
              ),
              Text("London", style: secondaryTextStyle()),
              24.height,
            ],
          ).paddingSymmetric(horizontal: 16),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("nd15n545lnz@privaterelay.applied.com", style: boldTextStyle()),
              Icon(Icons.arrow_forward_ios, size: 18),
            ],
          ).paddingOnly(left: 16, right: 16, top: 16, bottom: 16),
          JSSettingComponent(),
        ],
      ),
    );
  }
}
