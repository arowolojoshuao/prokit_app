import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCBackComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCCommentComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCMiniStoryComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCCollectionModel.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCHomeStoryModel.dart';
import 'package:prokit_flutter/fullApps/recipe/screens/RCCommentScreen.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCBottomSheet.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCCommon.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class RCStoryBlogScreen extends StatefulWidget {
  RCHomeStoryModel element;
  List<RCCollectionModel> collectionList;

  RCStoryBlogScreen({required this.element, required this.collectionList});

  @override
  _RCStoryBlogScreenState createState() => _RCStoryBlogScreenState();
}

class _RCStoryBlogScreenState extends State<RCStoryBlogScreen> {
  List<RCHomeStoryModel> list = getSearchRecipeList();

  bool liked = false;

  @override
  void initState() {
    setStatusBarColor(appStore.isDarkModeOn ? Colors.black : Colors.white);
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.transparent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.statusBarHeight + 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RCBackComponent(color: appStore.isDarkModeOn ? Colors.white : Colors.black, borderColor: rcSecondaryTextColor),
                Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(border: Border.all(color: rcSecondaryTextColor), borderRadius: radius(16)),
                        margin: EdgeInsets.all(6),
                        child: IconButton(
                          icon: liked ? Icon(LineIcons.heart_1, color: Colors.red) : Icon(LineIcons.heart, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                          onPressed: () {
                            liked = !liked;
                            setState(() {});
                          },
                        )),
                    Container(
                        decoration: BoxDecoration(border: Border.all(color: rcSecondaryTextColor), borderRadius: radius(16)),
                        margin: EdgeInsets.all(6),
                        child: IconButton(
                          icon: Icon(LineIcons.bookmark, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                          onPressed: () {
                            showSaveBottomSheet(context, widget.collectionList);
                          },
                        )),
                    Container(
                        decoration: BoxDecoration(border: Border.all(color: rcSecondaryTextColor), borderRadius: radius(16)),
                        margin: EdgeInsets.all(6),
                        child: IconButton(
                          icon: Icon(Icons.share, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                          onPressed: () {
                            showShareBottomSheet(context);
                          },
                        ))
                  ],
                )
              ],
            ),
            16.height,
            Text(widget.element.title, style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 26)),
            20.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    rcProfileImage(widget.element.img, 30, 30),
                    8.width,
                    Text(widget.element.name, style: boldTextStyle(color: primaryColor)),
                  ],
                ),
                Text('4 hours ago', style: secondaryTextStyle(color: rcSecondaryTextColor)),
              ],
            ),
            16.height,
            rcCommonCachedNetworkImage(widget.element.foodImg.validate(), height: 170, width: context.width(), fit: BoxFit.cover).cornerRadiusWithClipRRect(30),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: secondaryTextStyle(color: rcSecondaryTextColor),
            ),
            30.height,
            Row(
              children: [
                rcCommonCachedNetworkImage('$BaseUrl/images/recipe/strawberryCupcake.jpg', height: 150, width: 150, fit: BoxFit.cover).cornerRadiusWithClipRRect(16),
                8.width,
                Text(
                  'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It was popularised in the 1960s with the release of Letraset sheets.',
                  style: secondaryTextStyle(color: rcSecondaryTextColor),
                ).expand(),
              ],
            ),
            20.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Comments', style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 20)),
                Text('More', style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 20, color: primaryColor)).onTap(() {
                  RCCommentScreen().launch(context);
                }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
              ],
            ),
            16.height,
            RCCommentComponent(name: 'Anita Rose', comment: 'Wow! amazing', time: '3 mins', likes: '139', showLikes: false, liked: false, path: '$BaseUrl/images/recipe/faceOne.jpg').onTap(() {
              RCCommentScreen().launch(context);
            }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
            Divider(height: 50),
            RCCommentComponent(
                    name: 'Melanis',
                    comment: 'Beautiful, I\'ll like to see what good he has to offer me',
                    time: '3 mins',
                    likes: '29',
                    showLikes: false,
                    liked: false,
                    path: '$BaseUrl/images/recipe/faceThree.jpg')
                .onTap(() {
              RCCommentScreen().launch(context);
            }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
            30.height,
            Text('More delicious things for you', style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 20)),
            16.height,
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: list.map((e) {
                return RCMiniStoryComponentRecipe(element: e, isProfile: false);
              }).toList(),
            ).center(),
            30.height,
          ],
        ).paddingAll(16),
      ),
    );
  }
}
