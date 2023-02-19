import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/utility_tracker/model/utility_tracker_model.dart';

class MessagesComponent extends StatelessWidget {
  const MessagesComponent({Key? key, this.messageData}) : super(key: key);

  final UtilityTrackerModel? messageData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${messageData!.messagesName!}', style: secondaryTextStyle(color: Colors.black)),
            Text('${messageData!.lastSeen!} min ago', style: secondaryTextStyle(color: Colors.black)),
          ],
        ),
        8.height,
        Text('${messageData!.complainText!}', style: boldTextStyle(size: 18, color: Colors.black)),
      ],
    );
  }
}
