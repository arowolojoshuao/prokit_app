import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/eventApp/model/EAForYouModel.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAColors.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EADataProvider.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAapp_widgets.dart';
import 'package:prokit_flutter/main.dart';

class EAExplorerScreen extends StatefulWidget {
  @override
  EAExplorerScreenState createState() => EAExplorerScreenState();
}

class EAExplorerScreenState extends State<EAExplorerScreen> {
  List<EAForYouModel> explorerList = getMayKnowData();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Top Host", style: boldTextStyle()).paddingSymmetric(horizontal: 16),
            HorizontalList(
              itemCount: explorerList.length,
              padding: EdgeInsets.all(8),
              itemBuilder: (BuildContext context, int index) {
                EAForYouModel data = explorerList[index];
                return Container(
                  height: 230,
                  margin: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonCachedNetworkImage(
                        data.image,
                        fit: BoxFit.cover,
                        width: 160,
                        height: 160,
                      ).cornerRadiusWithClipRRect(16),
                      16.height,
                      Text(data.name!, style: boldTextStyle()).paddingOnly(left: 16),
                      4.height,
                      Text(data.add!, style: secondaryTextStyle()).paddingOnly(left: 16),
                    ],
                  ),
                );
              },
            ),
            Text("MAYBE YOU LIKE", style: boldTextStyle()).paddingOnly(left: 16),
            ListView.builder(
              padding: EdgeInsets.all(8),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: explorerList.length,
              itemBuilder: (BuildContext context, int index) {
                EAForYouModel data = explorerList[index];
                return Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      commonCachedNetworkImage(
                        data.image,
                        fit: BoxFit.cover,
                        height: 60,
                        width: 60,
                      ).cornerRadiusWithClipRRect(35),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.name!, style: boldTextStyle()),
                          4.height,
                          Text(data.add!, style: secondaryTextStyle()),
                        ],
                      ).expand(),
                      IconButton(
                        onPressed: () {
                          data.fev = !data.fev!;
                          setState(() {});
                        },
                        icon: data.fev!
                            ? Icon(Icons.person_remove,
                                color: data.fev!
                                    ? primaryColor1
                                    : appStore.isDarkModeOn
                                        ? white
                                        : black)
                            : Icon(Icons.person_add_alt_1,
                                color: data.fev!
                                    ? primaryColor1
                                    : appStore.isDarkModeOn
                                        ? white
                                        : black),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ).paddingSymmetric(vertical: 16),
      ),
    );
  }
}
