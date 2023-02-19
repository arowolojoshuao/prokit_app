import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/models/JCBCommonModel.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';

class JCBPaymentCard extends StatefulWidget {
  List<JCBCommonModel> list;

  JCBPaymentCard({required this.list});

  @override
  State<JCBPaymentCard> createState() => _JCBPaymentCardState();
}

class _JCBPaymentCardState extends State<JCBPaymentCard> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: widget.list.map((e) {
        int index = widget.list.indexOf(e);
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: radius(jcbButtonRadius),
            border: Border.all(color: selectedIndex == index ? jcbPrimaryColor : jcbSecBorderColor),
          ),
          child: Row(
            children: [
              Image.asset(e.image.validate(), height: 40, width: 50, fit: BoxFit.fill),
              16.width,
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(e.title.validate(), style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor)),
                  if (e.subTitle.validate().isNotEmpty) Text('Expires ${e.subTitle.validate()}', style: secondaryTextStyle(color: jcbGreyColor)),
                ],
              ),
            ],
          ),
        ).paddingSymmetric(vertical: 8).onTap(() {
          selectedIndex = index;
          setState(() {});
        }, splashColor: Colors.transparent, highlightColor: Colors.transparent);
      }).toList(),
    );
  }
}
