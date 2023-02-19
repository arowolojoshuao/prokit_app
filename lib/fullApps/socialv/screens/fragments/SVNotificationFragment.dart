import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/models/SVNotificationModel.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/notification/components/SVBirthdayNotificationComponent.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/notification/components/SVLikeNotificationComponent.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/notification/components/SVNewPostNotificationComponent.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/notification/components/SVRequestNotificationComponent.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVCommon.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVConstants.dart';

class SVNotificationFragment extends StatefulWidget {
  @override
  State<SVNotificationFragment> createState() => _SVNotificationFragmentState();
}

class _SVNotificationFragmentState extends State<SVNotificationFragment> {
  List<SVNotificationModel> listToday = getNotificationsToday();
  List<SVNotificationModel> listMonth = getNotificationsThisMonth();
  List<SVNotificationModel> listEarlier = getNotificationsEarlier();

  Widget getNotificationComponent({String? type, required SVNotificationModel element}) {
    if (type == SVNotificationType.like) {
      return SVLikeNotificationComponent(element: element);
    } else if (type == SVNotificationType.request) {
      return SVRequestNotificationComponent(element: element);
    } else if (type == SVNotificationType.newPost) {
      return SVNewPostNotificationComponent(element: element);
    } else {
      return SVBirthdayNotificationComponent(element: element);
    }
  }

  @override
  void initState() {
    super.initState();
    afterBuildCreated(() {
      setStatusBarColor(svGetScaffoldColor());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: svGetScaffoldColor(),
      appBar: AppBar(
        backgroundColor: svGetScaffoldColor(),
        iconTheme: IconThemeData(color: context.iconColor),
        title: Text('Notification', style: boldTextStyle(size: 20)),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('TODAY', style: boldTextStyle()).paddingAll(16),
            Divider(height: 0, indent: 16, endIndent: 16),
            Column(
              children: listToday.map((e) {
                return getNotificationComponent(type: e.notificationType, element: e);
              }).toList(),
            ),
            Text('THIS MONTH', style: boldTextStyle()).paddingAll(16),
            Divider(height: 0, indent: 16, endIndent: 16),
            Column(
              children: listMonth.map((e) {
                return getNotificationComponent(type: e.notificationType, element: e);
              }).toList(),
            ),
            Text('Earlier', style: boldTextStyle()).paddingAll(16),
            Divider(height: 0, indent: 16, endIndent: 16),
            Column(
              children: listEarlier.map((e) {
                return getNotificationComponent(type: e.notificationType, element: e);
              }).toList(),
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}
