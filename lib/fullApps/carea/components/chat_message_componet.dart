import 'package:prokit_flutter/fullApps/carea/model/calling_model.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class ChatMessageComponent extends StatelessWidget {
  const ChatMessageComponent({
    Key? key,
    required this.isMe,
    required this.data,
  }) : super(key: key);

  final bool isMe;
  final BHMessageModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isMe.validate() ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          margin: isMe.validate()
              ? EdgeInsets.only(top: 3.0, bottom: 3.0, right: 0, left: (500 * 0.25).toDouble())
              : EdgeInsets.only(
                  top: 4.0,
                  bottom: 4.0,
                  left: 0,
                  right: (500 * 0.25).toDouble(),
                ),
          decoration: BoxDecoration(
            color: !isMe
                ? appStore.isDarkModeOn
                    ? scaffoldDarkColor
                    : gray.withOpacity(0.2)
                : appStore.isDarkModeOn
                    ? cardDarkColor
                    : Colors.black,
            boxShadow: defaultBoxShadow(),
            borderRadius: isMe.validate()
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
          ),
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  data.msg!,
                  style: primaryTextStyle(
                    color: !isMe
                        ? appStore.isDarkModeOn
                            ? white
                            : black
                        : appStore.isDarkModeOn
                            ? white
                            : white,
                  ),
                ),
              ),
              Text(
                data.time!,
                style: secondaryTextStyle(
                  size: 12,
                  color: !isMe
                      ? context.iconColor
                      : appStore.isDarkModeOn
                          ? gray
                          : textSecondaryColor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
