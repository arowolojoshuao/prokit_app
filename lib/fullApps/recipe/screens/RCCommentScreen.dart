import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCBackComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCCommentComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class RCCommentScreen extends StatelessWidget {
  const RCCommentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: context.statusBarHeight + 16),
            Row(
              children: [
                RCBackComponent(color: appStore.isDarkModeOn ? Colors.white : Colors.black, borderColor: rcSecondaryTextColor),
                70.width,
                Text('Comments', style: boldTextStyle(size: 20, fontFamily: GoogleFonts.playfairDisplay().fontFamily))
              ],
            ).paddingSymmetric(vertical: 16),
            8.height,
            RCCommentComponent(name: 'Anita Rose', comment: 'Wow! amazing', time: '3 mins', likes: '139', showLikes: true, liked: false, path: '$BaseUrl/images/recipe/faceOne.jpg'),
            Divider(height: 50),
            RCCommentComponent(
                name: 'Melanis',
                comment: 'Beautiful, I\'ll like to see what good he has to offer me',
                time: '4 hours',
                likes: '29',
                showLikes: true,
                liked: false,
                path: '$BaseUrl/images/recipe/faceThree.jpg'),
            16.height,
            IntrinsicHeight(
              child: Row(
                children: [
                  VerticalDivider(width: 30),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: context.width() - 70,
                          child: RCCommentComponent(
                              name: 'Lisa Horn', comment: 'I think the same as you', time: '1 min', likes: '0', showLikes: true, liked: false, path: '$BaseUrl/images/recipe/faceOne.jpg')),
                      16.height,
                      Container(
                          width: context.width() - 70,
                          child: RCCommentComponent(
                              name: 'Alex Will', comment: 'I think the same as you', time: '1 min', likes: '0', showLikes: true, liked: false, path: '$BaseUrl/images/recipe/faceTwo.jpg')),
                    ],
                  )
                ],
              ),
            ),
            Divider(height: 50),
            RCCommentComponent(name: 'Anita Rose', comment: 'Wow! amazing', time: '3 mins', likes: '139', showLikes: true, liked: false, path: '$BaseUrl/images/recipe/faceOne.jpg'),
          ],
        ).paddingAll(16),
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
