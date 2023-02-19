import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/fullApps/eventApp/model/EAForYouModel.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAColors.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EADataProvider.dart';
import 'package:prokit_flutter/main.dart';

class EAFollowersScreen extends StatefulWidget {
  const EAFollowersScreen({Key? key}) : super(key: key);

  @override
  _EAFollowersScreenState createState() => _EAFollowersScreenState();
}

class _EAFollowersScreenState extends State<EAFollowersScreen> {
  List<EAForYouModel> list = getMayKnowData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          EAForYouModel data = list[index];
          return Container(
            margin: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                commonCachedNetworkImage(
                  data.image,
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                ).cornerRadiusWithClipRRect(35),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.name!, style: boldTextStyle()),
                    4.height,
                    Text(data.add!, style: secondaryTextStyle()),
                  ],
                ).expand(),
                IconButton(
                  onPressed: () {
                    list[index].fev = !list[index].fev!;
                    setState(() {});
                  },
                  icon: list[index].fev!
                      ? Icon(Icons.person_remove,
                          color: list[index].fev!
                              ? primaryColor1
                              : appStore.isDarkModeOn
                                  ? white
                                  : black)
                      : Icon(Icons.person_add_alt_1,
                          color: list[index].fev!
                              ? primaryColor1
                              : appStore.isDarkModeOn
                                  ? white
                                  : black),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
