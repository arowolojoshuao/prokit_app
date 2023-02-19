import 'package:prokit_flutter/fullApps/carea/commons/images.dart';
import 'package:prokit_flutter/fullApps/carea/commons/widgets.dart';
import 'package:prokit_flutter/fullApps/carea/model/user_info.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class SetFingerPrintScreen extends StatefulWidget {
  SetFingerPrintScreen({Key? key}) : super(key: key);

  @override
  State<SetFingerPrintScreen> createState() => _SetFingerPrintScreenState();
}

class _SetFingerPrintScreenState extends State<SetFingerPrintScreen> {
  UserInfo? userInformation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return true;
      },
      child: Scaffold(
        appBar: careaAppBarWidget(context, titleText: "Set Your Fingerprint"),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 35),
                Text(
                  'Add a fingerprint to make your account \nmore secure',
                  style: secondaryTextStyle(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.2),
                Image.asset(fingerprint, color: context.iconColor, width: 150, height: 150, fit: BoxFit.cover),
                SizedBox(height: 60),
                Text(
                  'Please put your finger on the fingerprint \nscanner to get started',
                  style: secondaryTextStyle(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2), borderRadius: BorderRadius.circular(42)),
                        child: Text('Skip', style: boldTextStyle(color: appStore.isDarkModeOn ? white : black)),
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () async {
                        await customDialoge(context, arguments: userInformation);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.42,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(45)),
                        child: Text('Continue', style: boldTextStyle(color: white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
