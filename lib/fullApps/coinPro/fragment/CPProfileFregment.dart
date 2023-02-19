import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/coinPro/fragment/CPNotificationFragment.dart';
import 'package:prokit_flutter/fullApps/coinPro/model/CPModel.dart';
import 'package:prokit_flutter/fullApps/coinPro/screen/CPEditProfileScreen.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPColors.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPDataProvider.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPImages.dart';
import 'package:url_launcher/url_launcher.dart';

class CPProfileFragment extends StatefulWidget {
  @override
  CPProfileFragmentState createState() => CPProfileFragmentState();
}

class CPProfileFragmentState extends State<CPProfileFragment> {
  List<CPDataModel> profileList = getProfileDataModel();
  String? nameProfile;

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Color(0x00000000), width: 1),
        ),
        title: Text("Profile", style: boldTextStyle(size: 18)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 24, bottom: 8),
                  color: context.cardColor,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0.1),
                        child: Container(
                          height: 100,
                          width: 100,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(cp_user, fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        nameProfile.validate().isEmpty ? "Jelly Grande" : '$nameProfile',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: boldTextStyle(size: 18),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ImageIcon(
                              NetworkImage("https://cdn2.iconfinder.com/data/icons/browser-user-interface/154/user-avatar-skin-browser-login-512.png"),
                              size: 20,
                              color: Color(0xff3a57e8),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                "Normal Skin",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Color(0xff3a57e8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: profileList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    CPDataModel data = profileList[index];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (index == 0) {
                          String? name = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CPEditProfileScreen();
                              },
                            ),
                          );
                          nameProfile = name;
                          setState(() {});
                        } else if (index == 1) {
                          CPNotificationFragment(isNotification: true).launch(context);
                        } else if (index == 2) {
                          String url = 'https://wordpress.iqonic.design/docs/product/prokit-flutter/';
                          launch(url);
                        } else if (index == 3) {
                          toast("Setting");
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(vertical: 8),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color(0x273a57e8),
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0x00ffffff), width: 1),
                              ),
                              child: Icon(data.icon, color: Color(0xff3a57e8), size: 20),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                                child: Text(data.currencyUnit!, style: boldTextStyle()),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, color: CPPrimaryColor, size: 16),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  showConfirmDialogCustom(
                    context,
                    title: 'Do you want to logout from the app?',
                    onAccept: (v) {
                      finish(context);
                    },
                  );
                },
                child: Container(
                  // alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                  padding: EdgeInsets.only(left: 16),
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0x273a57e8),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24.0),
                      bottomRight: Radius.circular(24.0),
                    ),
                    border: Border.all(color: Color(0x00ffffff), width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.logout, color: Color(0xff3a57e8), size: 24),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child: Text(
                          "Sign Out",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            color: Color(0xff3a57e8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
