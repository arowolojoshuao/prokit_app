import 'package:prokit_flutter/fullApps/appetit/utils/ADataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/AColors.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/appetit/utils/ACommon.dart';

class ANotificationFragment extends StatefulWidget {
  const ANotificationFragment({Key? key}) : super(key: key);

  @override
  State<ANotificationFragment> createState() => _ANotificationFragmentState();
}

class _ANotificationFragmentState extends State<ANotificationFragment> {
  void initState() {
    super.initState();
    afterBuildCreated(() => setStatusBarColor(context.scaffoldBackgroundColor));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.value(true);
      },
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notification", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
                Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.center,
                  child: Icon(Icons.delete_outline_outlined, color: context.iconColor, size: 24),
                  decoration: BoxDecoration(color: appStore.isDarkModeOn ? context.cardColor : appetitAppContainerColor, borderRadius: BorderRadius.circular(15)),
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Recent", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                SizedBox(height: 16),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: mynotifications.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: commonCachedNetworkImage(mynotifications[index].image.toString(), height: 50, width: 50, fit: BoxFit.cover),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: mynotifications[index].name.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: context.iconColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: mynotifications[index].message.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: context.iconColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(mynotifications[index].time.toString(), style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10)),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: commonCachedNetworkImage(mynotifications[index].recipeimage.toString(), height: 45, width: 45, fit: BoxFit.cover),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 8),
                Text('Older Notifications', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                SizedBox(height: 16),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: mynotifications.length.clamp(0, 5),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: commonCachedNetworkImage(mynotifications[index].image.toString(), height: 50, width: 50, fit: BoxFit.cover),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: mynotifications[index].name.toString(),
                                        style: TextStyle(fontWeight: FontWeight.w700, color: context.iconColor),
                                      ),
                                      TextSpan(
                                        text: mynotifications[index].message.toString(),
                                        style: TextStyle(fontWeight: FontWeight.w300, color: context.iconColor),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(mynotifications[index].time.toString(), style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10)),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: commonCachedNetworkImage(mynotifications[index].recipeimage.toString(), height: 45, width: 45, fit: BoxFit.cover),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
