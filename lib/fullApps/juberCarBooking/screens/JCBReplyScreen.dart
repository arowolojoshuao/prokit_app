import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class JCBReplyScreen extends StatefulWidget {
  @override
  State<JCBReplyScreen> createState() => _JCBReplyScreenState();
}

class _JCBReplyScreenState extends State<JCBReplyScreen> {
  TextEditingController reply = TextEditingController();

  List<String> repliesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? context.cardColor : jcbBackGroundColor,
      appBar: AppBar(
        leading: jcbBackWidget(context),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Connor Chavez', style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor)),
            Text('ST3571 - Toyoto Vios', style: secondaryTextStyle(color: jcbGreyColor, size: 10)),
          ],
        ),
        centerTitle: true,
        actions: [
          jcbCommonCachedNetworkImage(
            '$BaseUrl/images/juberCarBooking/jcb_face1.jpeg',
            height: 30,
            width: 40,
            fit: BoxFit.cover,
          ).cornerRadiusWithClipRRect(100).paddingAll(8),
        ],
        elevation: 0.5,
      ),
      body: SizedBox(
        height: context.height(),
        width: context.width(),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  16.height,
                  Text('Today at 5:30 PM', style: secondaryTextStyle(), textAlign: TextAlign.center),
                  16.height,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(color: jcbPrimaryColor, borderRadius: radius(jcbBottomSheetRadius)),
                      child: Text('Hello, are you nearby?', style: boldTextStyle(color: Colors.white)),
                    ),
                  ),
                  16.height,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(color: jcbGreyColor.withAlpha(30), borderRadius: radius(jcbBottomSheetRadius)),
                      child: Text('I\'ll be there in few minutes', style: boldTextStyle()),
                    ),
                  ),
                  16.height,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(color: jcbPrimaryColor, borderRadius: radius(jcbBottomSheetRadius)),
                      child: Text('OK, I am in front of bus stop', style: boldTextStyle(color: Colors.white)),
                    ),
                  ),
                  16.height,
                  Text('5:33 PM', style: secondaryTextStyle(), textAlign: TextAlign.center),
                  16.height,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(color: jcbGreyColor.withAlpha(30), borderRadius: radius(jcbBottomSheetRadius)),
                      child: Text('Sorry I am stuck in traffic. \nPlease give me a moment.', style: boldTextStyle()),
                    ),
                  ),
                  16.height,
                  if (repliesList.isNotEmpty)
                    ListView.builder(
                      itemCount: repliesList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(color: jcbPrimaryColor, borderRadius: radius(jcbBottomSheetRadius)),
                            child: Text(repliesList[index], style: boldTextStyle(color: Colors.white)),
                          ),
                        );
                      },
                    )
                ],
              ).paddingAll(16),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: context.width(),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.scaffoldBackgroundColor,
                  border: Border(top: BorderSide(color: appStore.isDarkModeOn ? context.dividerColor : jcbSecBorderColor)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(border: Border.all(color: appStore.isDarkModeOn ? context.dividerColor : jcbSecBorderColor), borderRadius: radius(jcbButtonRadius)),
                      width: context.width() * 0.76,
                      child: AppTextField(
                        controller: reply,
                        autoFocus: false,
                        textFieldType: TextFieldType.NAME,
                        textInputAction: TextInputAction.done,
                        textStyle: boldTextStyle(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type a message..',
                          hintStyle: boldTextStyle(color: jcbGreyColor, size: 14),
                        ),
                        onFieldSubmitted: (val) {
                          if (val != '') {
                            repliesList.add(val);
                            reply.clear();
                            setState(() {});
                          }
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send, color: jcbPrimaryColor, size: 30),
                      onPressed: () {
                        hideKeyboard(context);
                        if (reply.text != '') {
                          repliesList.add(reply.text);
                          reply.clear();
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
