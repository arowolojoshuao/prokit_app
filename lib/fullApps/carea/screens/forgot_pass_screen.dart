import 'package:prokit_flutter/fullApps/carea/commons/images.dart';
import 'package:prokit_flutter/fullApps/carea/commons/widgets.dart';
import 'package:prokit_flutter/fullApps/carea/screens/forgotpass_otp.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return true;
      },
      child: Scaffold(
        appBar: careaAppBarWidget(context, titleText: "Forgot the password"),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(width: 200, height: 200, image: AssetImage(forgotpass)),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Select which contact details should we use to \nreset your password', style: primaryTextStyle()),
                ),
                SizedBox(height: 16),
                Container(
                  height: MediaQuery.of(context).size.width * 0.3,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : gray.withOpacity(0.2),
                        child: Icon(Icons.message_rounded, color: context.iconColor, size: 20),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ForgotPassOtp()),
                            );
                          },
                          child: ListTile(
                            title: Text('via SMS', style: secondaryTextStyle()),
                            subtitle: Text('+1 111 ********99', style: boldTextStyle()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.width * 0.3,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : gray.withOpacity(0.2),
                        child: Icon(Icons.email_rounded, size: 20, color: context.iconColor),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ForgotPassOtp()),
                            );
                          },
                          child: ListTile(
                            title: Text('via Email', style: secondaryTextStyle()),
                            subtitle: Text('Chief.strategist.j@gmail.com', style: boldTextStyle()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassOtp()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: appStore.isDarkModeOn ? cardDarkColor : Colors.black, borderRadius: BorderRadius.circular(45)),
                    child: Text('Continue', style: boldTextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
