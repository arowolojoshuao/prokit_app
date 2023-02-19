import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCBackComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCReviewComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/main.dart';

class RCReviewScreen extends StatelessWidget {
  const RCReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: context.statusBarHeight),
            16.height,
            Row(
              children: [
                RCBackComponent(color: appStore.isDarkModeOn ? Colors.white : Colors.black, borderColor: rcSecondaryTextColor),
                70.width,
                Text('Reviews', style: boldTextStyle(size: 20, fontFamily: GoogleFonts.playfairDisplay().fontFamily))
              ],
            ).paddingSymmetric(vertical: 16, horizontal: 16),
            16.height,
            RCReviewComponent(),
            16.height,
            Divider(),
            RCReviewComponentOne()
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        decoration: boxDecorationDefault(borderRadius: radius(16), color: appStore.isDarkModeOn ? Colors.black : Colors.white),
        child: Row(
          children: [
            Icon(LineIcons.camera, color: primaryColor),
            8.width,
            AppTextField(
              textFieldType: TextFieldType.NAME,
              textStyle: boldTextStyle(),
              decoration: InputDecoration(hintText: 'Write a comment', hintStyle: secondaryTextStyle(), border: InputBorder.none),
            ).expand(),
            Icon(Icons.send_outlined, color: primaryColor),
          ],
        ),
      ),
    );
  }
}
