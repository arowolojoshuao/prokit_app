import 'package:prokit_flutter/fullApps/carea/commons/constants.dart';
import 'package:prokit_flutter/fullApps/carea/commons/data_provider.dart';
import 'package:prokit_flutter/fullApps/carea/components/chat_message_componet.dart';
import 'package:prokit_flutter/fullApps/carea/model/calling_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatScreen extends StatefulWidget {
  static String tag = '/ChatScreen';
  final String? name;

  ChatScreen({this.name});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController msgController = TextEditingController();

  FocusNode msgFocusNode = FocusNode();

  var msgListing = getChatMsgData();
  var personName = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  sendClick() async {
    DateFormat formatter = DateFormat('hh:mm a');

    if (msgController.text.trim().isNotEmpty) {
      hideKeyboard(context);
      var msgModel = BHMessageModel();
      msgModel.msg = msgController.text.toString();
      msgModel.time = formatter.format(DateTime.now());
      msgModel.senderId = BHSender_id;
      hideKeyboard(context);
      msgListing.insert(0, msgModel);

      var msgModel1 = BHMessageModel();
      msgModel1.msg = msgController.text.toString();
      msgModel1.time = formatter.format(DateTime.now());
      msgModel1.senderId = BHReceiver_id;

      msgController.text = '';

      if (mounted) scrollController.animToTop();
      FocusScope.of(context).requestFocus(msgFocusNode);
      setState(() {});

      await Future.delayed(Duration(seconds: 1));

      msgListing.insert(0, msgModel1);

      if (mounted) scrollController.animToTop();
    } else {
      FocusScope.of(context).requestFocus(msgFocusNode);
    }

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.3,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.name!, style: boldTextStyle(size: 18)),
              8.width,
              Container(
                padding: EdgeInsets.all(2),
                decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: Colors.blue),
                child: Icon(Icons.done, color: white, size: 10),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  launch('tel:${123456789}');
                },
                icon: Icon(Icons.call, color: context.iconColor, size: 18)),
            IconButton(
                onPressed: () {
                  launch('sms:${123456789}');
                },
                icon: Icon(Icons.chat, color: context.iconColor, size: 18)),
          ],
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              child: ListView.separated(
                separatorBuilder: (_, i) => Divider(color: Colors.transparent),
                shrinkWrap: true,
                reverse: true,
                controller: scrollController,
                itemCount: msgListing.length,
                padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 70),
                itemBuilder: (_, index) {
                  BHMessageModel data = msgListing[index];
                  var isMe = data.senderId == BHSender_id;

                  return ChatMessageComponent(isMe: isMe, data: data);
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                decoration: BoxDecoration(color: context.cardColor, boxShadow: defaultBoxShadow()),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: msgController,
                      focusNode: msgFocusNode,
                      autofocus: true,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration.collapsed(
                        hintText: personName.isNotEmpty ? 'Write to ${widget.name}' : 'Type a message',
                        hintStyle: primaryTextStyle(),
                        fillColor: context.cardColor,
                        filled: true,
                      ),
                      style: primaryTextStyle(),
                      onSubmitted: (s) {
                        sendClick();
                      },
                    ).expand(),
                    IconButton(
                      icon: Icon(Icons.send, size: 25),
                      onPressed: () async {
                        sendClick();
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
