import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/profile/components/SVProfileHeaderComponent.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/profile/components/SVProfilePostsComponent.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVColors.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVCommon.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVConstants.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class SVGroupProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: svGetScaffoldColor(),
      appBar: AppBar(
        backgroundColor: svGetScaffoldColor(),
        iconTheme: IconThemeData(color: context.iconColor),
        title: Text('Group', style: boldTextStyle(size: 20)),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SVProfileHeaderComponent(),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Avengers Group', style: boldTextStyle(size: 20)),
                4.width,
                Image.asset('images/socialv/icons/ic_TickSquare.png', height: 14, width: 14, fit: BoxFit.cover),
              ],
            ),
            8.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/socialv/icons/ic_GlobeAntarctic.png',
                  height: 16,
                  width: 16,
                  fit: BoxFit.cover,
                  color: context.iconColor,
                ),
                8.width,
                Text('Public Group', style: secondaryTextStyle(color: svGetBodyColor())),
                18.width,
                Image.asset(
                  'images/socialv/icons/ic_Calendar.png',
                  height: 16,
                  width: 16,
                  fit: BoxFit.cover,
                  color: context.iconColor,
                ),
                8.width,
                Text('03 Years Ago', style: secondaryTextStyle(color: svGetBodyColor())),
              ],
            ),
            16.height,
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(color: context.cardColor, borderRadius: radius(SVAppCommonRadius)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                              decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2), borderRadius: radius(100)),
                              child: svCommonCachedNetworkImage('$BaseUrl/images/socialv/faces/face_2.png', height: 32, width: 32, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                            ),
                            Positioned(
                              left: 14,
                              child: Container(
                                decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2), borderRadius: radius(100)),
                                child: svCommonCachedNetworkImage('$BaseUrl/images/socialv/faces/face_3.png', height: 32, width: 32, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                              ),
                            ),
                            Positioned(
                              left: 30,
                              child: Container(
                                decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2), borderRadius: radius(100)),
                                child: svCommonCachedNetworkImage('$BaseUrl/images/socialv/faces/face_4.png', height: 32, width: 32, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                              ),
                            ),
                            Positioned(
                              left: 46,
                              child: Container(
                                decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2), borderRadius: radius(100)),
                                child: svCommonCachedNetworkImage('$BaseUrl/images/socialv/faces/face_5.png', height: 32, width: 32, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2), borderRadius: radius(100)),
                                child: svCommonCachedNetworkImage('$BaseUrl/images/socialv/faces/face_1.png', height: 32, width: 32, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                              ),
                            ),
                          ],
                        ),
                      ),
                      16.width,
                      Text('+6 Members', style: secondaryTextStyle(color: context.iconColor)),
                    ],
                  ),
                  28.height,
                  AppButton(
                    shapeBorder: RoundedRectangleBorder(borderRadius: radius(4)),
                    text: 'Join Group',
                    textStyle: boldTextStyle(color: Colors.white),
                    onTap: () {},
                    elevation: 0,
                    color: SVAppColorPrimary,
                    width: context.width() - 64,
                  ),
                  10.height,
                ],
              ),
            ),
            16.height,
            SVProfilePostsComponent(),
            16.height,
          ],
        ),
      ),
    );
  }
}
