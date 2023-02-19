import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHColors.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHConstants.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHImages.dart';

import 'BHAccountInformationScreen.dart';
import 'BHInviteFriendsScreen.dart';
import 'BHNotificationScreen.dart';
import 'BHPaymentScreen.dart';

class BHProfileScreen extends StatefulWidget {
  static String tag = '/ProfileScreen';

  @override
  BHProfileScreenState createState() => BHProfileScreenState();
}

class BHProfileScreenState extends State<BHProfileScreen> {
  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          contentTextStyle: TextStyle(color: BHAppTextColorSecondary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
          actionsPadding: EdgeInsets.symmetric(horizontal: 16.0),
          title: Text(BHTxtLogoutDialog, style: boldTextStyle()),
          content: Text(BHTxtLogoutMsg, style: secondaryTextStyle()),
          actions: <Widget>[
            TextButton(
              child: Text(BHBtnYes, style: TextStyle(color: Colors.blue, fontSize: 14)),
              onPressed: () {
                finish(context);
              },
            ),
            TextButton(
              child: Text(BHBtnNo, style: TextStyle(color: Colors.blue, fontSize: 14)),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        height: context.height(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(backgroundImage: Image.network(BHdDashedBoardImage5).image, radius: 50),
                  ),
                  8.height,
                  Text('Theresa Cohen', style: boldTextStyle()),
                  8.height,
                  Text('theresacohen@gmail.com', style: secondaryTextStyle()),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.cardColor,
                  boxShadow: [
                    BoxShadow(color: BHGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0),
                  ],
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(BHPaymentIcon, height: 23, width: 23, color: BHColorPrimary),
                        8.width,
                        Text(BHTxtPaymentMethods, style: secondaryTextStyle()).expand(),
                      ],
                    ).onTap(() {
                      BHPaymentScreen().launch(context);
                    }),
                    16.height,
                    Row(
                      children: [
                        Image.asset(BHInformationIcon, height: 23, width: 23, color: BHColorPrimary),
                        8.width,
                        Text(BHTxtAccountInformation, style: secondaryTextStyle()).expand(),
                      ],
                    ).onTap(() {
                      BHAccountInformationScreen().launch(context);
                    }),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.cardColor,
                  boxShadow: [
                    BoxShadow(color: BHGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0),
                  ],
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(BHNotificationIcon, height: 23, width: 23, color: BHColorPrimary),
                        8.width,
                        Text(BHTxtNotification, style: secondaryTextStyle()).expand(),
                      ],
                    ).onTap(() {
                      BHNotificationScreen().launch(context);
                    }),
                    16.height,
                    Row(
                      children: [
                        Image.asset(BHInviteFriendsIcon, height: 23, width: 23, color: BHColorPrimary),
                        8.width,
                        Text(BHTxtInviteFriends, style: secondaryTextStyle()).expand(),
                      ],
                    ).onTap(() {
                      BHInviteFriendsScreen().launch(context);
                    }),
                    16.height,
                    Row(
                      children: [
                        Image.asset(BHSettingIcon, height: 23, width: 23, color: BHColorPrimary),
                        8.width,
                        Text(BHTxtSetting, style: secondaryTextStyle()).expand(),
                      ],
                    ).onTap(() {}),
                    16.height,
                    Row(
                      children: [
                        Image.asset(BHTerms_and_ServicesIcon, height: 23, width: 23, color: BHColorPrimary),
                        8.width,
                        Text(BHTxtTermsOfServices, style: secondaryTextStyle()).expand(),
                      ],
                    ).onTap(() {}),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 16),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.cardColor,
                  boxShadow: [
                    BoxShadow(color: BHGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(BHLogoutIcon, height: 23, width: 23, color: BHColorPrimary),
                    8.width,
                    Text(BHTxtLogout, style: secondaryTextStyle()).expand(),
                  ],
                ).onTap(
                  () {
                    _showDialog();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
