import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/models/BMMessageModel.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/screens/BMCallScreen.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMColors.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMCommonWidgets.dart';
import 'package:prokit_flutter/main.dart';

class BMChatScreen extends StatefulWidget {
  BMMessageModel element;

  BMChatScreen({required this.element});

  @override
  _BMChatScreenState createState() => _BMChatScreenState();
}

class _BMChatScreenState extends State<BMChatScreen> {
  List<String> inputMessageList = [];

  TextEditingController comment = TextEditingController();
  var form_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
        elevation: 0,
        leadingWidth: 30,
        iconTheme: IconThemeData(color: bmPrimaryColor),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            bmCommonCachedNetworkImage(widget.element.image, height: 40, width: 40, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
            8.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                titleText(title: widget.element.name, size: 16),
                Text(
                  widget.element.isActive! ? 'Active now' : widget.element.lastSeen.validate(),
                  style: secondaryTextStyle(color: appStore.isDarkModeOn ? bmTextColorDarkMode : bmPrimaryColor),
                )
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              BMCallScreen().launch(context);
            },
            icon: Icon(Icons.call_outlined),
          ),
          IconButton(
            onPressed: () {
              BMCallScreen(image: widget.element.image).launch(context);
            },
            icon: Icon(Icons.videocam_outlined),
          ),
        ],
      ),
      body: Container(
        width: context.width(),
        height: context.height(),
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        decoration: BoxDecoration(
          color: appStore.isDarkModeOn ? bmSecondBackgroundColorDark : bmSecondBackgroundColorLight,
          borderRadius: radiusOnly(topRight: 32, topLeft: 32),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Container(
                padding: EdgeInsets.all(8),
                width: context.width() / 1.5,
                decoration: BoxDecoration(color: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor, borderRadius: radius(16)),
                child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                    style: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : bmSpecialColorDark)),
              ),
              16.height,
              Container(
                padding: EdgeInsets.all(8),
                constraints: BoxConstraints(maxWidth: context.width() / 1.5),
                decoration: BoxDecoration(color: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor, borderRadius: radius(16)),
                child: Text(widget.element.message!, style: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : bmSpecialColorDark)),
              ),
              16.height,
              Align(
                alignment: Alignment.topRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: inputMessageList.map((e) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.all(8),
                      constraints: BoxConstraints(maxWidth: context.width() / 1.5),
                      decoration: BoxDecoration(color: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor, borderRadius: radius(16)),
                      child: Text(e, style: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : bmSpecialColorDark)),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Form(
        key: form_key,
        child: Container(
          decoration: BoxDecoration(color: appStore.isDarkModeOn ? bmSecondBackgroundColorDark : bmSecondBackgroundColorLight),
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: bmPrimaryColor.withAlpha(50),
                  borderRadius: radius(32),
                  border: Border.all(color: bmPrimaryColor),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: AppTextField(
                  controller: comment,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add comment',
                    hintStyle: secondaryTextStyle(color: bmPrimaryColor),
                  ),
                  textFieldType: TextFieldType.NAME,
                  cursorColor: bmPrimaryColor,
                ),
              ).flexible(flex: 3),
              16.width,
              Container(
                decoration: BoxDecoration(color: bmPrimaryColor, borderRadius: radius(100)),
                child: IconButton(
                  icon: Icon(Icons.arrow_upward, color: Colors.white),
                  onPressed: () {
                    if (form_key.currentState!.validate() && comment.text != '') {
                      inputMessageList.add(comment.text);
                      setState(() {});
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
