import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/walletApp/model/WalletAppModel.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WADataGenerator.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WAWidgets.dart';

class WARecentPayeesComponent extends StatefulWidget {
  static String tag = '/WARecentPayeesComponent';

  @override
  WARecentPayeesComponentState createState() => WARecentPayeesComponentState();
}

class WARecentPayeesComponentState extends State<WARecentPayeesComponent> {
  List<WARecentPayeesModel> recentPayeesList = waRecentPayeesList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: HorizontalList(
        spacing: 16,
        padding: EdgeInsets.only(left: 16, right: 16),
        itemCount: recentPayeesList.take(4).length,
        itemBuilder: (BuildContext context, int index) {
          WARecentPayeesModel mData = recentPayeesList[index];
          return index == 3
              ? Stack(
                  children: [
                    Container(
                      width: 90,
                      height: 105,
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.circular(12),
                        // backgroundColor: context.cardColor,
                      ),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          waCommonCachedNetworkImage(mData.image.validate(), height: 50, width: 50),
                          4.height,
                          Text(mData.name.toString(), style: boldTextStyle(size: 12), maxLines: 1),
                          Text(mData.number.toString(), style: secondaryTextStyle(size: 11), maxLines: 1),
                        ],
                      ),
                    ),
                    Container(
                      width: 90,
                      height: 105,
                      alignment: Alignment.center,
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.circular(8),
                        backgroundColor: Colors.black87.withOpacity(0.7),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: white, size: 18),
                          Text('3', style: secondaryTextStyle(color: white)),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(
                  width: 90,
                  decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      waCommonCachedNetworkImage(mData.image.validate(), height: 50, width: 50).cornerRadiusWithClipRRect(30),
                      4.height,
                      Text(mData.name.toString(), style: boldTextStyle(size: 12), maxLines: 1),
                      Text(mData.number.toString(), style: secondaryTextStyle(size: 11), maxLines: 1),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
