import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/stockMarket/screens/face_detect_screen.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/colors.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/images.dart';

class VerifyPhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CommonButton(
          buttonText: "Continue",
          margin: 16,
          width: context.width(),
          onTap: () {
            FaceDetectScreen().launch(context);

            // DashBoardScreen().launch(context);
          }).paddingOnly(bottom: 16),
      appBar: commonAppBarWidget(context, changeIcon: false, title: ""),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          60.height,
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: primaryColor),
                width: 180,
                height: 180,
              ),
              Positioned(bottom: 16, child: CommonCachedNetworkImage(verify_image, fit: BoxFit.cover, width: 180, height: 150)),
            ],
          ),
          42.height,
          Text('Verify Your Photo ID', style: boldTextStyle(size: 24)),
          16.height,
          Text(
            'Financial regulation require us to verify your \nID. This help prevent someone else from \ncreating an account in your name!',
            textAlign: TextAlign.center,
            style: secondaryTextStyle(height: 1.5),
          ),
        ],
      ).center().paddingAll(16),
    );
  }
}
