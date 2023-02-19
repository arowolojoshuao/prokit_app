import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/walletApp/screen/WAEditProfileScreen.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WAWidgets.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class WAMyProfileScreen extends StatefulWidget {
  static String tag = '/WAMyProfileScreen';

  @override
  WAMyProfileScreenState createState() => WAMyProfileScreenState();
}

class WAMyProfileScreenState extends State<WAMyProfileScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('My Profile', style: boldTextStyle(color: Colors.black, size: 20)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          brightness: Brightness.dark,
        ),
        body: Container(
          height: context.height(),
          width: context.width(),
          padding: EdgeInsets.only(top: 60),
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/walletApp/wa_bg.jpg'), fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                waCommonCachedNetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB8vuaWT6wGaoDz6T0UEilQ8wwcFO-hvserEgijbpPulSLBBpgbkxZBjwhUsU3ULuPazM&usqp=CAU',
                  fit: BoxFit.cover,
                  height: 120,
                  width: 120,
                ).cornerRadiusWithClipRRect(60),
                16.height,
                Text('Rose', style: boldTextStyle()),
                Text('rose@test.com', style: secondaryTextStyle()),
                16.height,
                SettingItemWidget(
                    title: 'Edit Profile',
                    decoration: boxDecorationRoundedWithShadow(12, backgroundColor: context.cardColor),
                    trailing: Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () {
                      WAEditProfileScreen(isEditProfile: true).launch(context);
                    }),
                16.height,
                SettingItemWidget(
                    title: 'Manage Wallet',
                    decoration: boxDecorationRoundedWithShadow(12, backgroundColor: context.cardColor),
                    trailing: Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () {
                      //
                    }),
                16.height,
                SettingItemWidget(
                    title: 'Transaction History',
                    decoration: boxDecorationRoundedWithShadow(12, backgroundColor: context.cardColor),
                    trailing: Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () {
                      //
                    }),
                16.height,
                SettingItemWidget(
                    title: 'Settings',
                    decoration: boxDecorationRoundedWithShadow(12, backgroundColor: context.cardColor),
                    trailing: Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () {
                      //
                    }),
              ],
            ).paddingAll(16),
          ),
        ),
      ),
    );
  }
}
