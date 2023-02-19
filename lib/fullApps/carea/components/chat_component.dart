import 'package:prokit_flutter/fullApps/carea/commons/data_provider.dart';
import 'package:prokit_flutter/fullApps/carea/model/calling_model.dart';
import 'package:prokit_flutter/fullApps/carea/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class ChatComponent extends StatefulWidget {
  @override
  _ChatComponentState createState() => _ChatComponentState();
}

class _ChatComponentState extends State<ChatComponent> {
  List<CallingModel> chatData = chatDataList();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: chatData.length,
      padding: EdgeInsets.only(left: 0, bottom: 70, right: 0, top: 8),
      itemBuilder: (context, index) {
        CallingModel data = chatData[index];

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(data.imageUrl.validate(), color: context.iconColor, height: 40, width: 40, fit: BoxFit.cover),
            16.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.userName.validate(), style: boldTextStyle()),
                8.height,
                Text(data.subTitle.validate(), style: secondaryTextStyle()),
              ],
            ).expand(),
            Column(
              children: [
                data.countNumber.validate().isNotEmpty
                    ? Container(
                        padding: EdgeInsets.all(5),
                        decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: context.iconColor),
                        child: Text(
                          data.countNumber.validate(),
                          style: boldTextStyle(color: appStore.isDarkModeOn ? black : white, size: 12),
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.all(5),
                        child: Text("", style: boldTextStyle(color: appStore.isDarkModeOn ? black : white, size: 12)),
                      ),
                4.height,
                Text(data.arriveTime.validate(), style: secondaryTextStyle()),
              ],
            ),
          ],
        ).paddingSymmetric(vertical: 8, horizontal: 16).onTap(
          () {
            ChatScreen(name: data.userName.validate()).launch(context);
          },
        );
      },
    );
  }
}
