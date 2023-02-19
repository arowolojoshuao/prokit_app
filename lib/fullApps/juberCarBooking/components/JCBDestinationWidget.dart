import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/models/JCBSearchDestinationModel.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';

class JCBDestinationWidget extends StatelessWidget {
  final JCBSearchDestinationModel destination;

  JCBDestinationWidget({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'images/juberCarBooking/jcbIcons/ic_pin.png',
          color: jcbPrimaryColor,
          width: 26,
          height: 26,
          fit: BoxFit.cover,
        ),
        16.width,
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(destination.name, style: boldTextStyle(size: 18)), 4.height, Text(destination.address, style: secondaryTextStyle()), Divider(color: jcbSecBorderColor)],
        ).expand(),
      ],
    );
  }
}
