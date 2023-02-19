import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/stockMarket/screens/signin_with%20_email_screen.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/colors.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/images.dart';

class FaceDetectScreen extends StatefulWidget {
  @override
  State<FaceDetectScreen> createState() => _FaceDetectScreenState();
}

class _FaceDetectScreenState extends State<FaceDetectScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    setStatusBarColor(primaryColor, delayInMilliSeconds: 300);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
    setStatusBarColor(appStore.isDarkModeOn ? black : white);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBarWidget(context, title: "", changeIcon: false, appBarColor: primaryColor, iconColor: white),
        body: Stack(
          children: [
            Container(color: primaryColor, width: context.width(), height: context.height()),
            CommonCachedNetworkImage(user, width: context.width(), height: context.height(), fit: BoxFit.cover),
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Container(
                decoration: boxDecorationWithRoundedCorners(
                  border: Border.all(color: Colors.white),
                  boxShape: BoxShape.circle,
                  backgroundColor: Colors.transparent,
                ),
                height: 450,
                width: 450,
              ),
            ),
            Positioned(right: 16, bottom: 200, child: CommonCachedNetworkImage(verify_image, fit: BoxFit.cover, width: 170, height: 130)),
            Positioned(
              bottom: 24,
              right: 80,
              left: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(right: 4),
                    decoration: boxDecorationWithRoundedCorners(
                      boxShape: BoxShape.circle,
                      backgroundColor: appStore.isDarkModeOn ? dividerDarkColor : white,
                    ),
                    child: CommonCachedNetworkImage(ic_video, color: context.iconColor, height: 30, width: 30, fit: BoxFit.cover),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: boxDecorationWithRoundedCorners(
                          boxShape: BoxShape.circle,
                          border: Border.all(color: white),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        padding: EdgeInsets.all(16),
                        decoration: boxDecorationWithRoundedCorners(
                          boxShape: BoxShape.circle,
                          backgroundColor: Colors.pink,
                        ),
                      ),
                    ],
                  ).onTap(() {
                    SignWithEmailInScreen().launch(context, isNewTask: true);
                  }),
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(right: 4),
                    decoration: boxDecorationWithRoundedCorners(
                      boxShape: BoxShape.circle,
                      backgroundColor: appStore.isDarkModeOn ? dividerDarkColor : white,
                    ),
                    child: Icon(Icons.camera_alt, color: context.iconColor, size: 24),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
