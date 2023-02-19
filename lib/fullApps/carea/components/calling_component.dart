import 'package:prokit_flutter/fullApps/carea/commons/data_provider.dart';
import 'package:prokit_flutter/fullApps/carea/model/calling_model.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:url_launcher/url_launcher.dart';

class CallingComponent extends StatefulWidget {
  @override
  _CallingComponentState createState() => _CallingComponentState();
}

class _CallingComponentState extends State<CallingComponent> {
  List<CallingModel> callingData = callingDataList();

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
      itemCount: callingData.length,
      padding: EdgeInsets.only(left: 16, bottom: 70, right: 8, top: 8),
      itemBuilder: (context, index) {
        CallingModel data = callingData[index];

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
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        backgroundColor: data.colorValue!,
                      ),
                      child: Icon(data.icon, color: white, size: 10),
                    ),
                    8.width,
                    Text(data.subTitle.validate(), style: secondaryTextStyle()),
                  ],
                ),
              ],
            ).expand(),
            IconButton(
              onPressed: () {
                launch('tel:${123456789}');
              },
              icon: Icon(Icons.call, size: 18, color: appStore.isDarkModeOn ? white : gray.withOpacity(0.7)),
            ),
          ],
        ).paddingSymmetric(vertical: 8);
      },
    );
  }
}
