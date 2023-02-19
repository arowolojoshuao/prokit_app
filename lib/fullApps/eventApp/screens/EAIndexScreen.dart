import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/eventApp/model/EAInboxModel.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EADataProvider.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAapp_widgets.dart';

class EAIndexScreen extends StatefulWidget {
  const EAIndexScreen({Key? key}) : super(key: key);

  @override
  _EAIndexScreenState createState() => _EAIndexScreenState();
}

class _EAIndexScreenState extends State<EAIndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        "Index",
        center: true,
        backWidget: IconButton(
          onPressed: () {
            finish(context);
          },
          icon: Icon(Icons.arrow_back, color: white),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        padding: EdgeInsets.all(8),
        shrinkWrap: true,
        itemCount: inboxList.length,
        itemBuilder: (BuildContext context, int index) {
          EAInboxModel data = inboxList[index];
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
                    Text(data.msg!, style: secondaryTextStyle()),
                  ],
                ).expand(),
              ],
            ),
          ).onTap(
            () {},
          );
        },
      ),
    );
  }
}
